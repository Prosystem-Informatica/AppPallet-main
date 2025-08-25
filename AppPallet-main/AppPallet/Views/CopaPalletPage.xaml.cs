using AppPallet.Models;
using AppPallet.ViewModels;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace AppPallet.Views
{
    public partial class CopaPalletPage : ContentPage
    {
        ItemsViewModel _viewModel;
        private static readonly HttpClient _client = new HttpClient();
        private LoginAcesso _acessoDados;
        private Login _loginDados;
        private bool _isCheckingUrl;
        private bool _isUpdatingPositions;
        private CancellationTokenSource _cancellationTokenSource;
        private CancellationTokenSource _checkUrlCancellationTokenSource;
        private bool _isCheckingUrlVisible;
        private string _url = "";

        public CopaPalletPage()
        {
            InitializeComponent();
            NavigationPage.SetHasBackButton(this, false);
            BindingContext = _viewModel = new ItemsViewModel();
        }

        private async Task BuscaResumoViagens()
        {
            try
            {

                Console.WriteLine($" Dados do endpoint {_acessoDados.empresa}/{_acessoDados.codigo}");
                
                // URL fixa que você me passou
                string url = _url + $"/Viagens_Dev/{_acessoDados.empresa}/{_acessoDados.codigo}";
                var response = await _client.GetStringAsync(url);

                // Converte JSON -> objeto
                var resumo = JsonConvert.DeserializeObject<ViagensResumo>(response);

                if (resumo != null)
                {
                    // Atualiza os bindings da tela (cards)
                    Device.BeginInvokeOnMainThread(() =>
                    {
                        TotalViagensLabel.Text = resumo.TOTAL_VIAGENS;
                        NormaisLabel.Text = resumo.VIAGENS_NORMAL;
                        ExtrasLabel.Text = resumo.VIAGENS_EXTRA;
                        DevolucoesLabel.Text = resumo.TOTAL_DEV;
                    });
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Erro ao buscar resumo de viagens: {ex.Message}");
            }
        }

          private async Task ShowActionSheet()
          {
              string result = await DisplayActionSheet("A baixa a ser feita", "Cancelar", "OK");
              if (result == "OK")
              {
                  await Navigation.PushAsync(new BaixaPalletPage());
              }
          }
          private async Task ShowCustomAlertPage()
          {
              var customAlertPage = new CustomPopupPage();
              await Navigation.PushModalAsync(customAlertPage);
          }

          private void AtualizarData()
          {
              DateTime today = DateTime.Today;
              int year = today.Year;
              int month = today.Month;

              // Calculando o primeiro e o último dia do mês atual
              DateTime firstDayOfMonth = new DateTime(year, month, 1);
              DateTime lastDayOfMonth = firstDayOfMonth.AddMonths(1).AddDays(-1);

              // Formatando as datas
              string formattedFirstDay = firstDayOfMonth.ToString("dd/MM/yyyy");
              string formattedLastDay = lastDayOfMonth.ToString("dd/MM/yyyy");

              // Atualizando o texto do Label
             // DataLabel.Text = $"{formattedFirstDay} a {formattedLastDay}";
          }

          protected override async void OnAppearing()
          {
              base.OnAppearing();
              
            _viewModel.OnAppearing();
            AtualizarData();
            //PosicaoInicial();
            _acessoDados = DadosServicos.Instance.AcessoDados;
              _loginDados = DadosServicos.Instance.LoginDados;
              _url = $"http://{_loginDados.servidor}:{_loginDados.porta}/datasnap/rest/TserverAPPnfe";

            await BuscaResumoViagens();


            // Inicia o método assíncrono para atualizar posições
            _ = StartFetchAndUpdatePositionsPeriodically();

              // Inicia o método assíncrono para verificar a URL periodicamente
              _ = CheckUrlPeriodically();
                
          }

          protected override void OnDisappearing()
          {
              base.OnDisappearing();
              _cancellationTokenSource?.Cancel(); // Cancela o loop ao sair da página
              _isUpdatingPositions = false;
              _isCheckingUrl = false;
          }

          private async Task StartFetchAndUpdatePositionsPeriodically()
          {
              _cancellationTokenSource = new CancellationTokenSource();
              var token = _cancellationTokenSource.Token;
              _isUpdatingPositions = true;

              while (!token.IsCancellationRequested)
              {
                  try
                  {
                      // Chama o método que você deseja executar periodicamente
                     // await BuscaPosicoesEquipes(_acessoDados.empresa); // Certifique-se de que isso é um método assíncrono

                      Device.BeginInvokeOnMainThread(() =>
                      {
                          Console.WriteLine("Posições atualizadas.");
                      });
                  }
                  catch (Exception ex)
                  {
                      Device.BeginInvokeOnMainThread(() =>
                      {
                          Console.WriteLine($"Erro ao atualizar posições: {ex.Message}");
                      });
                  }

                  try
                  {
                      // Espera 1 minuto antes de verificar novamente
                      await Task.Delay(TimeSpan.FromMinutes(1), token);
                  }
                  catch (TaskCanceledException)
                  {
                      // A tarefa foi cancelada, você pode lidar com isso se necessário
                  }
              }

              _isUpdatingPositions = false;
          }

          private async Task CheckUrlPeriodically()
          {
              while (true)
              {
                  if (!_isCheckingUrl)
                  {
                      _isCheckingUrl = true;
                      try
                      {
                          var verificaCarga = await CheckUrl();
                          Device.BeginInvokeOnMainThread(async () =>
                          {
                              if (verificaCarga != null)
                              {
                                  Console.WriteLine("URL acessível.");

                                  // Verifica se a página atual é a CopaPalletPage antes de navegar
                                  if (Shell.Current.CurrentPage is CopaPalletPage)
                                  {
                                      // Navega para BaixaPalletPage quando a URL estiver acessível
                                      await Shell.Current.GoToAsync("//BaixaPalletPage");
                                  }
                                  else
                                  {
                                      Console.WriteLine("Não está na página CopaPalletPage.");
                                  }
                              }
                              else
                              {
                                  Console.WriteLine("Erro ao acessar a URL ou dados inválidos.");
                              }
                          });
                      }
                      finally
                      {
                          _isCheckingUrl = false;
                      }
                  }

                  await Task.Delay(TimeSpan.FromMinutes(1)); // Espera 1 minuto antes de verificar novamente
              }
          }

          public async Task<VerificaCarga> CheckUrl()
          {
              try
              {
                  string UrlToCheck = _url + $"/VerificaCarga/{_acessoDados.empresa}/{_acessoDados.codigo}";

                  var response = await _client.GetAsync(UrlToCheck);

                  if (response.IsSuccessStatusCode)
                  {
                      string content = await response.Content.ReadAsStringAsync();
                      Console.WriteLine($"Resposta da URL: {content}");

                      // Deserializar como lista de VerificaCarga
                      var verificaCargaList = JsonConvert.DeserializeObject<List<VerificaCarga>>(content);

                      if (verificaCargaList != null && verificaCargaList.Count > 0)
                      {
                          var verificaCarga = verificaCargaList[0];

                          // Verificar se ID e DATA são diferentes de "0"
                          if (!string.IsNullOrWhiteSpace(verificaCarga.ID) && !verificaCarga.ID.Equals("0") &&
                              !string.IsNullOrWhiteSpace(verificaCarga.DATA) && !verificaCarga.DATA.Equals("0"))
                          {
                              return verificaCarga;
                          }
                      }
                  }
                  else
                  {
                      Console.WriteLine($"Erro ao acessar a URL: {response.StatusCode}");
                  }
              }
              catch (HttpRequestException httpEx)
              {
                  Console.WriteLine($"Erro HTTP ao verificar a URL: {httpEx.Message}");
              }
              catch (Exception ex)
              {
                  Console.WriteLine($"Erro ao verificar a URL: {ex.Message}");
              }

              return null;
          }




        /* private async Task BuscaPosicoesEquipes(string empresaId)
         {
             try
             {
                 string url = _url + $"/PosicaoEquipes/{empresaId}";
                 var response = await _client.GetStringAsync(url);
                 var positions = JArray.Parse(response);
                 int qtd = 0;

                 foreach (var position in positions)
                 {
                     qtd++;
                     string equipe = (string)position["EQUIPE"];
                     int quant = (int)position["QUANT"];
                     AtualizaPontos(equipe, quant, qtd);
                 }
             }
             catch (HttpRequestException httpEx)
             {
                 Console.WriteLine($"Erro HTTP ao buscar posições: {httpEx.Message}");
             }
             catch (Exception ex)
             {
                 Console.WriteLine($"Erro ao buscar posições: {ex.Message}");
             }
         }*/

        /* private void PosicaoInicial()
         {
             AbsoluteLayout.SetLayoutBounds(PotinhoAmarelo, new Rectangle(0.2, 0.18, 10, 10));
             AbsoluteLayout.SetLayoutBounds(PotinhoVerde, new Rectangle(0.2, 0.20, 10, 10));
             AbsoluteLayout.SetLayoutBounds(PotinhoAzul, new Rectangle(0.2, 0.22, 10, 10));
         }*/

        /*private void AtualizaPontos(string equipe, int paletesEntregues, int qtd)
        {
            double x = 0.2, y = 0.22;

            // Definir coordenadas para cada valor de paletes entregues
            switch (paletesEntregues)
            {
                case int n when (n >= 100 && n < 200):
                    if (qtd == 1)
                    {
                        x = 0.26; y = 0.18;
                    }
                    else if (qtd == 2)
                    {
                        x = 0.26; y = 0.20;
                    }
                    else
                    {
                        x = 0.26; y = 0.22;
                    }
                    break;
                case int n when (n >= 200 && n < 300):
                    if (qtd == 1)
                    {
                        x = 0.39; y = 0.18;
                    }
                    else if (qtd == 2)
                    {
                        x = 0.39; y = 0.20;
                    }
                    else
                    {
                        x = 0.39; y = 0.22;
                    }
                    break;
                case int n when (n >= 300 && n < 400):
                    if (qtd == 1)
                    {
                        x = 0.52; y = 0.18;
                    }
                    else if (qtd == 2)
                    {
                        x = 0.52; y = 0.20;
                    }
                    else
                    {
                        x = 0.52; y = 0.22;
                    }
                    break;
                case int n when (n >= 400 && n < 500):
                    if (qtd == 1)
                    {
                        x = 0.66; y = 0.18;
                    }
                    else if (qtd == 2)
                    {
                        x = 0.66; y = 0.20;
                    }
                    else
                    {
                        x = 0.66; y = 0.22;
                    }
                    break;
                case int n when (n >= 500 && n < 600):
                    if (qtd == 1)
                    {
                        x = 0.85; y = 0.24;
                    }
                    else if (qtd == 2)
                    {
                        x = 0.85; y = 0.26;
                    }
                    else
                    {
                        x = 0.85; y = 0.28;
                    }
                    break;
                case int n when (n >= 600 && n < 700):
                    if (qtd == 1)
                    {
                        x = 0.86; y = 0.40;
                    }
                    else if (qtd == 2)
                    {
                        x = 0.86; y = 0.42;
                    }
                    else
                    {
                        x = 0.86; y = 0.44;
                    }
                    break;
                case int n when (n >= 700 && n < 800):
                    if (qtd == 1)
                    {
                        x = 0.66; y = 0.47;
                    }
                    else if (qtd == 2)
                    {
                        x = 0.66; y = 0.49;
                    }
                    else
                    {
                        x = 0.66; y = 0.51;
                    }
                    break;
                case int n when (n >= 800 && n < 900):
                    if (qtd == 1)
                    {
                        x = 0.52; y = 0.47;
                    }
                    else if (qtd == 2)
                    {
                        x = 0.52; y = 0.49;
                    }
                    else
                    {
                        x = 0.52; y = 0.51;
                    }
                    break;
                case int n when (n >= 900 && n < 1000):
                    if (qtd == 1)
                    {
                        x = 0.39; y = 0.47;
                    }
                    else if (qtd == 2)
                    {
                        x = 0.39; y = 0.49;
                    }
                    else
                    {
                        x = 0.39; y = 0.51;
                    }
                    break;
                case int n when (n >= 1000 && n < 1100):
                    if (qtd == 1)
                    {
                        x = 0.26; y = 0.47;
                    }
                    else if (qtd == 2)
                    {
                        x = 0.26; y = 0.49;
                    }
                    else
                    {
                        x = 0.26; y = 0.51;
                    }
                    break;
                case int n when (n >= 1100 && n < 1200):
                    if (qtd == 1)
                    {
                        x = 0.15; y = 0.53;
                    }
                    else if (qtd == 2)
                    {
                        x = 0.15; y = 0.55;
                    }
                    else
                    {
                        x = 0.15; y = 0.57;
                    }
                    break;
                case int n when (n >= 1200 && n < 1300):
                    if (qtd == 1)
                    {
                        x = 0.15; y = 0.71;
                    }
                    else if (qtd == 2)
                    {
                        x = 0.15; y = 0.73;
                    }
                    else
                    {
                        x = 0.15; y = 0.75;
                    }
                    break;
                case int n when (n >= 1300 && n < 1400):
                    if (qtd == 1)
                    {
                        x = 0.26; y = 0.78;
                    }
                    else if (qtd == 2)
                    {
                        x = 0.28; y = 0.78;
                    }
                    else
                    {
                        x = 0.30; y = 0.78;
                    }
                    break;
                case int n when (n >= 1400 && n < 1500):
                    if (qtd == 1)
                    {
                        x = 0.40; y = 0.78;
                    }
                    else if (qtd == 2)
                    {
                        x = 0.42; y = 0.78;
                    }
                    else
                    {
                        x = 0.44; y = 0.78;
                    }
                    break;
                case int n when (n >= 1500 && n < 1600):
                    if (qtd == 1)
                    {
                        x = 0.54; y = 0.78;
                    }
                    else if (qtd == 2)
                    {
                        x = 0.56; y = 0.78;
                    }
                    else
                    {
                        x = 0.58; y = 0.78;
                    }
                    break;
                case int n when (n >= 1600 && n < 1700):
                    if (qtd == 1)
                    {
                        x = 0.66; y = 0.78;
                    }
                    else if (qtd == 2)
                    {
                        x = 0.68; y = 0.78;
                    }
                    else
                    {
                        x = 0.70; y = 0.78;
                    }
                    break;
                default:
                    if (qtd == 1)
                    {
                        x = 0.2; y = 0.18;
                    }
                    else if (qtd == 2)
                    {
                        x = 0.2; y = 0.20;
                    }
                    else
                    {
                        x = 0.2; y = 0.22;
                    }
                    break;
            }*/

        // Atualizar a posição dos potinhos baseado na equipe
        /*witch (equipe)
         {
             case "AMARELO":
                 AbsoluteLayout.SetLayoutBounds(PotinhoAmarelo, new Rectangle(x, y, 10, 10));
                 break;
             case "VERDE":
                 AbsoluteLayout.SetLayoutBounds(PotinhoVerde, new Rectangle(x, y, 10, 10));
                 break;
             case "AZUL":
                 AbsoluteLayout.SetLayoutBounds(PotinhoAzul, new Rectangle(x, y, 10, 10));
                 break;
                 // Adicionar mais equipes conforme necessário
         }
     }*/
    }
}
