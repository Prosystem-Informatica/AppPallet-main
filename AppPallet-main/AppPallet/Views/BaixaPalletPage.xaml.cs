using AppPallet.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using SkiaSharp;
using System.IO;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Essentials;
using Xamarin.Forms;
using FluentFTP.Helpers;
using AppPallet.Services;
using FluentFTP.Exceptions;
using Plugin.Media;
using Plugin.Media.Abstractions;

namespace AppPallet.Views
{
    public partial class BaixaPalletPage : ContentPage
    {
        public IControleRepository _controleRepository;
        ObservableCollection<LoginAcesso> dadosAcesso { get; set; } = new ObservableCollection<LoginAcesso>();
        private LoginAcesso _acessoDados;
        private Login _loginDados;
        private VerificaCarga _verificaCargaDados;
        private static readonly HttpClient _client = new HttpClient(new HttpClientHandler
        {
            AllowAutoRedirect = false
        });
        private string _photoPath;

        private FtpService ftpService;

        // Convert the image to a byte array
        byte[] imageBytes;

        private string _url = "";

        private const string DevolucaoKey = "devolucaoEntry";
        private const string EntregaKey = "entregaEntry";

        public BaixaPalletPage()
        {
            InitializeComponent();
            NavigationPage.SetHasBackButton(this, false);
            _controleRepository = new ControleRepository();
            ftpService = new FtpService();
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();
            _acessoDados = DadosServicos.Instance.AcessoDados;
            _loginDados = DadosServicos.Instance.LoginDados;
            _url = $"http://{_loginDados.servidor}:{_loginDados.porta}/datasnap/rest/TserverAPPnfe";
            LoadData();
        }

        private async void LoadData()
        {
            ShowLoading(true);

            string url = _url + $"/VerificaCarga/{_acessoDados.empresa}/{_acessoDados.codigo}";

            try
            {
                HttpResponseMessage response = await _client.GetAsync(url);

                if (response.IsSuccessStatusCode)
                {
                    string jsonResponse = await response.Content.ReadAsStringAsync();
                    Console.WriteLine($"Resposta recebida: {jsonResponse}");

                    if (IsJson(jsonResponse))
                    {
                        var verificaCargaList = JsonConvert.DeserializeObject<List<VerificaCarga>>(jsonResponse);

                        if (verificaCargaList != null && verificaCargaList.Count > 0)
                        {
                            var data = verificaCargaList[0];

                            if (data.ID == "0" || data.DATA == "0")
                            {
                                // Redireciona para CopaPalletPage
                                await Shell.Current.GoToAsync("//CopaPalletPage");
                                return;
                            }

                            if (DateTime.TryParse(data.DATA, out DateTime parsedDate))
                            {
                                dataDatePicker.Date = parsedDate;
                            }

                            numeroCargaEntry.Text = data.ID.Replace(" ","");

                            placaEntry.Text = data.PLACA;

                            nomeEntry.Text = _loginDados.login;

                            var devolucao = Preferences.Get(DevolucaoKey, null);
                            var entrega = Preferences.Get(EntregaKey, null);

                            // Verifica se há devolução ou se o valor atual de entregaEntry é diferente do esperado
                            if (!string.IsNullOrWhiteSpace(devolucao) || (entrega != null && entregaEntry.Text != data.QUANT))
                            {
                                // Atualiza os campos com os valores das preferências, se existirem
                                entregaEntry.Text = entrega ?? data.QUANT;
                                devolucaoEntry.Text = devolucao ?? string.Empty;

                                // Remove os dados armazenados nas preferências
                                Preferences.Remove(EntregaKey);
                                Preferences.Remove(DevolucaoKey);
                            }
                            else
                            {
                                // Se não houver devolução ou o valor for igual ao esperado, atualiza os campos para os valores padrão do serviço
                                entregaEntry.Text = data.QUANT;
                                devolucaoEntry.Text = string.Empty;
                            }


                            DadosServicos.Instance.VerificaCargaDados = data;
                            _verificaCargaDados = DadosServicos.Instance.VerificaCargaDados;
                        }
                        else
                        {
                            ShowLoading(false);
                            DependencyService.Get<IMessage>().LongAlert("Nenhum dado encontrado.");
                        }
                    }
                    else
                    {
                        ShowLoading(false);
                        DependencyService.Get<IMessage>().LongAlert("Resposta do servidor não é JSON válido.");
                    }
                }
                else
                {
                    ShowLoading(false);
                    DependencyService.Get<IMessage>().LongAlert($"Erro ao carregar dados. StatusCode: {response.StatusCode}");
                }
            }
            catch (HttpRequestException httpEx)
            {
                ShowLoading(false);
                DependencyService.Get<IMessage>().LongAlert($"Erro de rede ao carregar dados: {httpEx.Message}");
            }
            catch (JsonException jsonEx)
            {
                ShowLoading(false);
                DependencyService.Get<IMessage>().LongAlert($"Erro ao processar os dados recebidos: {jsonEx.Message}");
            }
            catch (Exception ex)
            {
                ShowLoading(false);
                DependencyService.Get<IMessage>().LongAlert($"Falha ao carregar dados: {ex.Message}");
            }
            finally
            {
                ShowLoading(false);
            }
        }

        private bool IsJson(string input)
        {
            input = input.Trim();
            return input.StartsWith("{") && input.EndsWith("}") || input.StartsWith("[") && input.EndsWith("]");
        }

        private async void TirarFoto_Clicked(object sender, EventArgs e) { await TakePhotoAsync(); }

        private async Task TakePhotoAsync()
        {
            try
            {
                // Salvar os dados dos campos
                Preferences.Set(EntregaKey, entregaEntry.Text);
                Preferences.Set(DevolucaoKey, devolucaoEntry.Text);

                await CrossMedia.Current.Initialize();

                if (!CrossMedia.Current.IsCameraAvailable || !CrossMedia.Current.IsTakePhotoSupported)
                {
                    await App.Current.MainPage.DisplayAlert("Nenhuma Câmera", "Nenhuma câmera disponível.", "OK");
                    return;
                }

                var file = await CrossMedia.Current.TakePhotoAsync(new StoreCameraMediaOptions
                {
                    Directory = "Sample",
                    Name = "Baixa_Pallet.jpg"
                });

                if (file == null)
                    return;

                // Salvar o caminho da foto
                _photoPath = file.Path;
                caminhoFotoEntry.Text = _photoPath;

                using (var memoryStream = new MemoryStream())
                {
                    file.GetStream().CopyTo(memoryStream);
                    imageBytes = memoryStream.ToArray();
                }
            }
            catch (Exception ex)
            {
                DependencyService.Get<IMessage>().LongAlert($"Ocorreu um erro: {ex.Message}");
            }
            
        }

        //private async void GravarButton_Clicked(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        ShowLoading(true);

        //        if (_verificaCargaDados == null)
        //        {
        //            DependencyService.Get<IMessage>().LongAlert("Dados da carga não encontrados.");
        //            return;
        //        }

        //        if (int.TryParse(entregaEntry.Text, out int quantidadeEntregue) &&
        //            int.TryParse(devolucaoEntry.Text, out int quantidadeDevolvido) &&
        //            int.TryParse(_verificaCargaDados.ID, out int cargaId))
        //        {
        //            Console.WriteLine($"Carga ID: {cargaId}, Quantidade Entregue: {quantidadeEntregue}, Quantidade Devolvido: {quantidadeDevolvido}");

        //            // Enviar Json
        //            bool success = await UploadImageAsync(cargaId, quantidadeEntregue, quantidadeDevolvido, imageBytes);

        //            if (success)
        //            {
        //                DependencyService.Get<IMessage>().LongAlert("Dados enviados com sucesso!");
        //                clearBaixaPallet();
        //                await Shell.Current.GoToAsync("//CopaPalletPage");
        //            }
        //            else
        //            {
        //                ShowLoading(false);
        //                DependencyService.Get<IMessage>().LongAlert("Falha ao enviar dados.");
        //            }
        //        }
        //        else
        //        {
        //            ShowLoading(false);
        //            DependencyService.Get<IMessage>().LongAlert("Entradas inválidas.");
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        ShowLoading(false);
        //        DependencyService.Get<IMessage>().LongAlert($"Ocorreu um erro: {ex.Message}");
        //    }
        //    finally
        //    {
        //        ShowLoading(false);
        //    }
        //}


        private async void GravarButton_Clicked(object sender, EventArgs e)
        {
            try
            {
                ShowLoading(true);

                if (_verificaCargaDados == null)
                {
                    DependencyService.Get<IMessage>().LongAlert("Dados da carga não encontrados.");
                    return;
                }

                if (int.TryParse(entregaEntry.Text, out int quantidadeEntregue) &&
                    int.TryParse(devolucaoEntry.Text, out int quantidadeDevolvido) &&
                    int.TryParse(_verificaCargaDados.ID, out int cargaId))
                {
                    Console.WriteLine($"Carga ID: {cargaId}, Quantidade Entregue: {quantidadeEntregue}, Quantidade Devolvido: {quantidadeDevolvido}");

                    //bool success = await SendMultiPartDataToServer(cargaId, quantidadeEntregue, quantidadeDevolvido, _photoPath);

                    //Enviar Json
                    bool success = await UploadImageAsync(cargaId, quantidadeEntregue, quantidadeDevolvido, imageBytes);

                    if (success)
                    {
                        DependencyService.Get<IMessage>().LongAlert("Dados enviados com sucesso!");
                        clearBaixaPallet();
                        await Shell.Current.GoToAsync("//CopaPalletPage");
                    }
                    else
                    {
                        ShowLoading(false);
                        DependencyService.Get<IMessage>().LongAlert("Falha ao enviar dados.");
                    }
                }
                else
                {
                    ShowLoading(false);
                    DependencyService.Get<IMessage>().LongAlert("Entradas inválidas.");
                }
            }
            catch (Exception ex)
            {
                ShowLoading(false);
                DependencyService.Get<IMessage>().LongAlert($"Ocorreu um erro: {ex.Message}");
            }
            finally
            {
                ShowLoading(false);
            }
        }
        private async Task<bool> UploadImageAsync(int cargaId, int quantidadeEntregue, int quantidadeDevolvido, byte[] imageBytes)
        {
            /*if (imageBytes == null || imageBytes.Length == 0)
            {
                await App.Current.MainPage.DisplayAlert("Error", "Os dados da imagem são inválidos ou estão vazios.", "OK");
                return false;
            }*/

            if (cargaId <= 0 || quantidadeEntregue < 0 || quantidadeDevolvido < 0)
            {
                await App.Current.MainPage.DisplayAlert("Error", "Dados de entrada inválidos.", "OK");
                return false;
            }

            try
            {
                var base64Image = await CompressAndConvertImageToBase64(imageBytes);
                if (imageBytes != null || imageBytes.Length != 0)
                {
                    // Convertendo a imagem para Base64
                    //var base64Image = Convert.ToBase64String(imageBytes);

                    // Calculando o tamanho da string Base64 em bytes
                    int base64ImageSizeInBytes = System.Text.Encoding.UTF8.GetByteCount(base64Image);

                    // Calcula o tamanho em megabytes
                    double sizeInMb = base64ImageSizeInBytes / (1024.0 * 1024.0);

                    // Exibindo o tamanho da imagem convertida
                    Console.WriteLine($"Base64 image size: {base64ImageSizeInBytes} bytes");

                    // Checando se o tamanho é aceitável (opcional)
                    if (base64ImageSizeInBytes > 5000000) // Por exemplo, limite de 5MB
                    {
                        await App.Current.MainPage.DisplayAlert("Error", "A imagem é muito grande.", "OK");
                        return false;
                    }
                }
                

                var content = new
                {
                    CargaId = cargaId,
                    QuantidadeEntregue = quantidadeEntregue,
                    QuantidadeDevolvido = quantidadeDevolvido,
                    Foto = base64Image
                };

                var json = Newtonsoft.Json.JsonConvert.SerializeObject(content);
                var httpContent = new StringContent(json, System.Text.Encoding.UTF8, "application/json");

                using (var httpClient = new HttpClient())
                {
                    httpClient.Timeout = TimeSpan.FromSeconds(30); // Define um timeout para a requisição
                    //var response = await httpClient.PostAsync("http://prosystem.dyndns-work.com:8081/datasnap/rest/TserverAPPnfe/UPLoadArquivo/", httpContent);

                    var encodedImage = Uri.EscapeDataString(base64Image);
                    var url = _url + $"/UPLoadArquivo/{cargaId}/{quantidadeEntregue}/{quantidadeDevolvido}/{encodedImage}";

                    var response = await httpClient.PostAsync(url, null);
                    if (response.IsSuccessStatusCode)
                    {
                        await App.Current.MainPage.DisplayAlert("Success", "Baixa feita com Sucesso!", "OK");
                        return true;
                    }
                    else
                    {
                        var errorMessage = await response.Content.ReadAsStringAsync();
                        await App.Current.MainPage.DisplayAlert("Error", $"Falha ao carregar a imagem. Status: {response.StatusCode}, Message: {errorMessage}", "OK");
                        return false;
                    }
                }
            }
            catch (HttpRequestException httpEx)
            {
                await App.Current.MainPage.DisplayAlert("Network Error", $"Ocorreu um erro de rede: {httpEx.Message}", "OK");
                return false;
            }
            catch (TaskCanceledException timeoutEx)
            {
                await App.Current.MainPage.DisplayAlert("Timeout Error", $"A solicitação expirou: {timeoutEx.Message}", "OK");
                return false;
            }
            catch (Exception ex)
            {
                await App.Current.MainPage.DisplayAlert("Error", $"Ocorreu um erro inesperado: {ex.Message}", "OK");
                return false;
            }
        }
        public async Task<string> CompressAndConvertImageToBase64(byte[] imageBytes, int maxWidth = 300, int maxHeight = 300, int maxBase64Length = 16000, int quality = 75)
        {
            byte[] compressedImageBytes;
            string base64Image;
            int base64ImageSizeInBytes;
            double sizeInMb;
            int currentWidth = maxWidth;
            int currentHeight = maxHeight;

            do
            {
                using (var inputStream = new MemoryStream(imageBytes))
                {
                    using (var originalBitmap = SKBitmap.Decode(inputStream))
                    {
                        var scale = Math.Min((float)currentWidth / originalBitmap.Width, (float)currentHeight / originalBitmap.Height);
                        var newWidth = (int)(originalBitmap.Width * scale);
                        var newHeight = (int)(originalBitmap.Height * scale);

                        using (var resizedBitmap = originalBitmap.Resize(new SKImageInfo(newWidth, newHeight), SKFilterQuality.High))
                        {
                            using (var image = SKImage.FromBitmap(resizedBitmap))
                            {
                                using (var outputStream = new MemoryStream())
                                {
                                    var imageData = image.Encode(SKEncodedImageFormat.Jpeg, quality); // Define a qualidade da compressão
                                    imageData.SaveTo(outputStream);
                                    compressedImageBytes = outputStream.ToArray();
                                    base64Image = Convert.ToBase64String(compressedImageBytes);

                                    // Calcula o tamanho da string Base64 em bytes
                                    base64ImageSizeInBytes = System.Text.Encoding.UTF8.GetByteCount(base64Image);

                                    // Calcula o tamanho em megabytes
                                    sizeInMb = base64ImageSizeInBytes / (1024.0 * 1024.0);
                                }
                            }
                        }
                    }
                }

                // Reduzir as dimensões para a próxima iteração se necessário
                currentWidth = (int)(currentWidth * 0.9);  // Reduz em 10%
                currentHeight = (int)(currentHeight * 0.9);

            } while (base64ImageSizeInBytes > maxBase64Length && currentWidth > 1 && currentHeight > 1);

            if (base64ImageSizeInBytes > maxBase64Length)
            {
                throw new Exception("Imagem excede o tamanho máximo permitido após múltiplas compressões.");
            }

            return base64Image;
        }


        //private async Task<bool> UploadImageAsync(int cargaId, int quantidadeEntregue, int quantidadeDevolvido, byte[] imageBytes)
        //{
        //    if (imageBytes == null || imageBytes.Length == 0)
        //    {
        //        await App.Current.MainPage.DisplayAlert("Error", "Os dados da imagem são inválidos ou estão vazios.", "OK");
        //        return false;
        //    }

        //    if (cargaId <= 0 || quantidadeEntregue < 0 || quantidadeDevolvido < 0)
        //    {
        //        await App.Current.MainPage.DisplayAlert("Error", "Dados de entrada inválidos.", "OK");
        //        return false;
        //    }

        //    try
        //    {
        //        var base64Image = await CompressAndConvertImageToBase64(imageBytes);

        //        var content = new
        //        {
        //            CargaId = cargaId,
        //            QuantidadeEntregue = quantidadeEntregue,
        //            QuantidadeDevolvido = quantidadeDevolvido,
        //            Foto = base64Image
        //        };

        //        var json = JsonConvert.SerializeObject(content);
        //        var httpContent = new StringContent(json, Encoding.UTF8, "application/json");

        //        using (var httpClient = new HttpClient())
        //        {
        //            httpClient.Timeout = TimeSpan.FromSeconds(30); // Define um timeout para a requisição

        //            var encodedImage = Uri.EscapeDataString(base64Image);
        //            var url = _url + $"/UPLoadArquivo/{cargaId}/{quantidadeEntregue}/{quantidadeDevolvido}/{encodedImage}";

        //            var response = await httpClient.PostAsync(url, null);
        //            if (response.IsSuccessStatusCode)
        //            {
        //                await App.Current.MainPage.DisplayAlert("Success", "Baixa feita com Sucesso!", "OK");
        //                return true;
        //            }
        //            else
        //            {
        //                var errorMessage = await response.Content.ReadAsStringAsync();
        //                await App.Current.MainPage.DisplayAlert("Error", $"Falha ao carregar a imagem. Status: {response.StatusCode}, Message: {errorMessage}", "OK");
        //                return false;
        //            }
        //        }
        //    }
        //    catch (HttpRequestException httpEx)
        //    {
        //        await App.Current.MainPage.DisplayAlert("Network Error", $"Ocorreu um erro de rede: {httpEx.Message}", "OK");
        //        return false;
        //    }
        //    catch (TaskCanceledException timeoutEx)
        //    {
        //        await App.Current.MainPage.DisplayAlert("Timeout", $"A operação foi cancelada devido ao timeout: {timeoutEx.Message}", "OK");
        //        return false;
        //    }
        //    catch (Exception ex)
        //    {
        //        await App.Current.MainPage.DisplayAlert("Error", $"Falha ao carregar a imagem: {ex.Message}", "OK");
        //        return false;
        //    }
        //}

        //private async Task<string> CompressAndConvertImageToBase64(byte[] imageBytes)
        //{
        //    using (var original = SKBitmap.Decode(imageBytes))
        //    {
        //        int originalWidth = original.Width;
        //        int originalHeight = original.Height;
        //        float maxDimension = Math.Max(originalWidth, originalHeight);
        //        float scale = 600f / maxDimension;

        //        int newWidth = (int)(originalWidth * scale);
        //        int newHeight = (int)(originalHeight * scale);

        //        using (var resized = original.Resize(new SKImageInfo(newWidth, newHeight), SKFilterQuality.Medium))
        //        {
        //            using (var image = SKImage.FromBitmap(resized))
        //            {
        //                using (var data = image.Encode(SKEncodedImageFormat.Jpeg, 80))
        //                {
        //                    return Convert.ToBase64String(data.ToArray());
        //                }
        //            }
        //        }
        //    }
        //}

        private void ShowLoading(bool show)
        {
            activityIndicator.IsRunning = show;
            activityIndicator.IsVisible = show;
            //mainLayout.IsVisible = !show;
        }

        private void clearBaixaPallet()
        {
            Preferences.Remove(EntregaKey);
            Preferences.Remove(DevolucaoKey);
            entregaEntry.Text = string.Empty;
            devolucaoEntry.Text = string.Empty;
            caminhoFotoEntry.Text = string.Empty;
            imageBytes = null;
        }

        #region EnvioFotoMulitPart
        private async void CapturarFoto_Clicked(object sender, EventArgs e)
        {
            try
            {
                var photo = await MediaPicker.CapturePhotoAsync();
                if (photo == null)
                    return;

                var nomeFoto = _verificaCargaDados.ID + "_BAIXA_PALETE";

                var newFile = Path.Combine(FileSystem.AppDataDirectory, $"{nomeFoto}.jpg");
                using (var stream = await photo.OpenReadAsync())
                using (var newStream = File.OpenWrite(newFile))
                    await stream.CopyToAsync(newStream);

                _photoPath = newFile;
                caminhoFotoEntry.Text = _photoPath;

                UploadImage(_photoPath);
                DependencyService.Get<IMessage>().LongAlert("Foto capturada com sucesso!");
            }
            catch (Exception ex)
            {
                DependencyService.Get<IMessage>().LongAlert($"Erro ao capturar foto: {ex.Message}");
            }
        }
        public async void UploadImage(string localImagePath)
        {
            try
            {
                ShowLoading(true);

                var filePath = localImagePath;
                await ftpService.UploadFileAsync(filePath, this);
            }
            catch (Exception ex)
            {
                DependencyService.Get<IMessage>().LongAlert($"Erro ao subir foto via FTP: {ex.Message}");
            }
            finally
            {
                ShowLoading(false);
            }
        }
        private async Task<bool> SendMultiPartDataToServer(int cargaId, int quantidadeEntregue, int quantidadeDevolvido, string photoPath)
        {
            var url = _url + "/UPLoadArquivo/";

            try
            {
                ShowLoading(true);
                using (var client = new HttpClient())
                {
                    using (var content = new MultipartFormDataContent())
                    {
                        // Adicionar os dados
                        content.Add(new StringContent(cargaId.ToString()), "cargaId");
                        content.Add(new StringContent(quantidadeEntregue.ToString()), "quantidadeEntregue");
                        content.Add(new StringContent(quantidadeDevolvido.ToString()), "quantidadeDevolvido");

                        // Adicionar a foto
                        if (!string.IsNullOrEmpty(photoPath) && File.Exists(photoPath))
                        {
                            var fileStream = new FileStream(photoPath, FileMode.Open, FileAccess.Read);
                            var streamContent = new StreamContent(fileStream);
                            streamContent.Headers.ContentType = new MediaTypeHeaderValue("image/jpeg");
                            content.Add(streamContent, "foto", Path.GetFileName(photoPath));
                        }

                        var response = await client.PostAsync(url, content);

                        if (response.IsSuccessStatusCode)
                        {
                            return true;
                        }
                        else
                        {
                            ShowLoading(false);
                            string errorMessage = await response.Content.ReadAsStringAsync();
                            DependencyService.Get<IMessage>().LongAlert($"Falha ao enviar dados. StatusCode: {response.StatusCode} Message: {errorMessage}");
                            return false;
                        }
                    }
                }
            }
            catch (HttpRequestException httpEx)
            {
                ShowLoading(false);
                DependencyService.Get<IMessage>().LongAlert($"Erro de rede ao enviar dados: {httpEx.Message}");
            }
            catch (TaskCanceledException timeoutEx)
            {
                ShowLoading(false);
                DependencyService.Get<IMessage>().LongAlert($"Tempo de solicitação esgotado: {timeoutEx.Message}");
            }
            catch (Exception ex)
            {
                ShowLoading(false);
                DependencyService.Get<IMessage>().LongAlert($"Erro ao enviar dados para o servidor: {ex.Message}");
            }
            finally
            {
                ShowLoading(false);
            }

            return false;
        }
        private byte[] ReduceImageSize(string photoPath)
        {
            using (var inputStream = File.OpenRead(photoPath))
            {
                using (var originalImage = SKBitmap.Decode(inputStream))
                {
                    var initialSize = new SKImageInfo(600, 600);
                    var resizedImage = originalImage.Resize(initialSize, SKFilterQuality.Medium);

                    int quality = 100;
                    byte[] imageBytes = null;

                    do
                    {
                        using (var ms = new MemoryStream())
                        {
                            using (var image = SKImage.FromBitmap(resizedImage))
                            {
                                var imageData = image.Encode(SKEncodedImageFormat.Jpeg, quality);
                                imageData.SaveTo(ms);
                                imageBytes = ms.ToArray();
                            }
                        }

                        quality -= 10;

                        if (quality < 10 && imageBytes.Length > 16000)
                        {
                            var newSize = new SKImageInfo((int)(initialSize.Width * 0.9), (int)(initialSize.Height * 0.9));
                            if (newSize.Width < 100 || newSize.Height < 100)
                            {
                                newSize = new SKImageInfo(100, 100);
                            }

                            resizedImage = originalImage.Resize(newSize, SKFilterQuality.Medium);
                            quality = 100;
                        }
                    } while (imageBytes.Length > 16000 && (resizedImage.Width > 100 && resizedImage.Height > 100));

                    return imageBytes;
                }
            }
        }
        #endregion
    }
}
