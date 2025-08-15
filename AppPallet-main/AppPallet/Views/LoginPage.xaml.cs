using AppPallet.Models;
using AppPallet.ViewModels;
using Newtonsoft.Json;
using Syncfusion.XForms.MaskedEdit;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using Xamarin.Essentials;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace AppPallet.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class LoginPage : ContentPage
    {
        private readonly HttpClient _client = new HttpClient();
        ObservableCollection<Login> login { get; set; } = new ObservableCollection<Login>();
        ObservableCollection<LoginAcesso> loginAcesso { get; set; } = new ObservableCollection<LoginAcesso>();

        private Login _loginDados;
        private LoginAcesso _acessoDados;

        public IControleRepository _controleRepository;

        public LoginPage()
        {
            InitializeComponent();
            _controleRepository = new ControleRepository();
            VersionCode.Text = "Versão • " + DependencyService.Get<IAppVersionAndBuild>().GetVersionNumber();
            this.BindingContext = new LoginViewModel();
        }

        private async void usuariologado() 
        {
            var dbHelper = new DatabaseHelper();
            if (dbHelper.IsUserLoggedIn())
            {
                ControleRepository buscaDados = new ControleRepository();
                DadosServicos.Instance.AcessoDados = buscaDados.GetAllLoginAcessoData().FirstOrDefault();
                DadosServicos.Instance.LoginDados = buscaDados.GetAllLoginData().FirstOrDefault();
                Login dados = _controleRepository.GetAllLoginData().FirstOrDefault();
                maskedEditCNPJ.Value = dados.cnpj; //"09334805000146";
                maskedEditLogin.Value = dados.login; //"marceli";
                maskedEditSenha.Value = dados.senha; //"it1010";
                await Entrar();
            }
            else { ClearLoginFields(); }
        }

        // Limpa os campos de entrada
        private void ClearLoginFields()
        {
            maskedEditCNPJ.Value = string.Empty;
            maskedEditLogin.Value = string.Empty;
            maskedEditSenha.Value = string.Empty;

            maskedEditCNPJ.ErrorBorderColor = Color.Default;
            maskedEditLogin.ErrorBorderColor = Color.Default;
            maskedEditSenha.ErrorBorderColor = Color.Default;
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();
            usuariologado();
        }

        private bool IsMaskedEditFilled(SfMaskedEdit maskedEdit)
        {
            return !string.IsNullOrEmpty(maskedEdit.Value?.ToString());
        }

        private async void Button_OnClicked(object sender, EventArgs e)
        {
            await ShowMessage("Dialog Title", "Prompt", "Ok", async () =>
            {
                await ShowMessage("OK was pressed", "Message", "OK", null);
            });
        }

        public async Task ShowMessage(string message, string title, string buttonText, Action afterHideCallback)
        {
            await DisplayAlert(title, message, buttonText);
            afterHideCallback?.Invoke();
        }

        protected async void Login(object s, EventArgs e)
        {
            await Entrar();
        }

        private async Task Entrar()
        {
            try
            {
                ShowLoading(true);

                string cnpj = string.Empty;
                string login = string.Empty;
                string passwd = string.Empty;

                string mensagemErro = "";

                if (IsMaskedEditFilled(maskedEditCNPJ))
                {
                    cnpj = maskedEditCNPJ.Value.ToString().Replace(".", "").Replace("/", "").Replace("-", "");
                    if (!CnpjValidator.IsValidCnpj(cnpj))
                    {
                        mensagemErro = "O CNPJ é inválido. \n";
                    }
                }
                else
                {
                    maskedEditCNPJ.ErrorBorderColor = Color.Red;
                    mensagemErro = "O campo CNPJ deve ser preenchido! \n";
                }

                if (IsMaskedEditFilled(maskedEditLogin))
                {
                    login = maskedEditLogin.Value.ToString().ToUpper();
                }
                else
                {
                    maskedEditLogin.ErrorBorderColor = Color.Red;
                    mensagemErro += "O campo Login deve ser preenchido! \n";
                }

                if (IsMaskedEditFilled(maskedEditSenha))
                {
                    passwd = maskedEditSenha.Value.ToString().ToUpper();
                }
                else
                {
                    maskedEditSenha.ErrorBorderColor = Color.Red;
                    mensagemErro += "O campo Senha deve ser preenchido! \n";
                }

                if (!string.IsNullOrEmpty(mensagemErro))
                {
                    DependencyService.Get<IMessage>().LongAlert(mensagemErro);
                }
                else
                {
                    await AddLogin(cnpj, login, passwd);
                }
            }
            catch (Exception exc)
            {
                Debug.WriteLine("DEBUG: " + exc.Message);
                DependencyService.Get<IMessage>().LongAlert("Erro de conexão com o servidor!");
            }
            finally
            {
                ShowLoading(false);
            }
        }

        async Task AddLogin(string cnpj, string log, string pass)
        {
            string url = $"http://prosystem.dyndns-work.com:9090/datasnap/rest/TserverAPPnfe/LoginEmpresa/{cnpj}";
            try
            {
                ShowLoading(true);

                var content = await _client.GetStringAsync(url);
                var tr = JsonConvert.DeserializeObject<List<Login>>(content);
                login = new ObservableCollection<Login>(tr);

                if (login.Count == 0 || login[0].codigo == "0")
                {
                    DependencyService.Get<IMessage>().LongAlert("Verifique se seu CNPJ está correto e tente novamente!");
                    return;
                }

                var obj = login[0];
                obj.cnpj = cnpj;
                obj.login = log;
                obj.senha = pass;

                string urlLoginAcesso = $"http://{obj.servidor}:{obj.porta}/datasnap/rest/TserverAPPnfe/LoginPalete/{obj.login}/{obj.senha}";

                _controleRepository.InsertLogin(obj);
                DadosServicos.Instance.LoginDados = obj;

                //Preferences.Set("UserName", log);

                await AcessoLogin(urlLoginAcesso, log, pass);
            }
            catch (HttpRequestException httpEx)
            {
                Debug.WriteLine("DEBUG (HttpRequestException): " + httpEx.Message);
                DependencyService.Get<IMessage>().LongAlert("Erro de conexão com o servidor!");
            }
            catch (Exception ex)
            {
                Debug.WriteLine("DEBUG: " + ex.Message);
                DependencyService.Get<IMessage>().LongAlert("Erro ao processar os dados!");
            }
            finally
            {
                ShowLoading(false);
            }
        }

        async Task AcessoLogin(string urlLoginAcesso, string log, string pass)
        {
            try
            {
                ShowLoading(true);

                var response = await _client.GetStringAsync(urlLoginAcesso);
                var result = JsonConvert.DeserializeObject<List<LoginAcesso>>(response);
                loginAcesso = new ObservableCollection<LoginAcesso>(result);

                if (loginAcesso.Count == 0 || string.IsNullOrEmpty(log) || string.IsNullOrEmpty(pass) || loginAcesso[0].validado == "F")
                {
                    DependencyService.Get<IMessage>().LongAlert("Login ou senha inválidos");
                    return;
                }

                var obj = loginAcesso[0];
                DependencyService.Get<IMessage>().LongAlert($"Bem vindo {log}");

                _controleRepository.InsertLoginAcesso(obj);
                DadosServicos.Instance.AcessoDados = obj;

                _acessoDados = DadosServicos.Instance.AcessoDados;
                _loginDados = DadosServicos.Instance.LoginDados;
                
                CarregaNomeUsuario(_loginDados.login);

                await Shell.Current.GoToAsync($"//{nameof(CopaPalletPage)}");
            }
            catch (HttpRequestException httpEx)
            {
                Debug.WriteLine("DEBUG (HttpRequestException): " + httpEx.Message);
                DependencyService.Get<IMessage>().LongAlert("Erro de conexão com o servidor!");
            }
            catch (Exception ex)
            {
                Debug.WriteLine("DEBUG: " + ex.Message);
                DependencyService.Get<IMessage>().LongAlert("Erro ao processar os dados!");
            }
            finally
            {
                ShowLoading(false);
            }
        }

        private void CarregaNomeUsuario(string login) {
            // Salve o nome do usuário nas Preferences
            Xamarin.Essentials.Preferences.Set("UserName", login);

            // Atualize o nome do usuário no AppShell
            if (Shell.Current is AppShell appShell)
            {
                appShell.UpdateUserName(login);
            }
        }

        private void ShowLoading(bool show)
        {
            loadingOverlay.IsVisible = show;
            activityIndicator.IsRunning = show;
        }
    }
}
