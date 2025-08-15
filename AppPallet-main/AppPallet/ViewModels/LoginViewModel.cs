using AppPallet.Views;
using System;
using System.Collections.Generic;
using Xamarin.Forms;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.Net.Http;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Newtonsoft.Json;
using AppPallet.Models;

namespace AppPallet.ViewModels
{
    public class LoginViewModel : INotifyPropertyChanged
    {
        public ICommand LoginCommand { get; private set; }

        private HttpClient _client = new HttpClient();
        ObservableCollection<Login> trends { get; set; } = new ObservableCollection<Login>();

        public LoginViewModel()
        {
            Debug.WriteLine("DEBUG VAZIO");
        }

        public LoginViewModel(string cnpjvm, string loginvm, string passwdvm)
        {
            Debug.WriteLine("LOGIN VIEW MODEL " + cnpjvm);
            Debug.WriteLine("LOGIN VIEW MODEL " + loginvm);
            Debug.WriteLine("LOGIN VIEW MODEL " + passwdvm);
            LoginCommand = new Command(async () => await AddLogin(cnpjvm, loginvm, passwdvm));
        }

        async Task AddLogin(string cnpjvm, string log, string pass)
        {

            Debug.Write("ENTROU NO ADD LOGIN");
            string url = "http://prosystem.dyndns-work.com:9090/datasnap/rest/TserverAPPnfe/LoginEmpresa/09334805000146";
            try
            {
                //Activity indicator visibility on
                //activity_indicator.IsRunning = true;
                //Getting JSON data from the Web
                var content = await _client.GetStringAsync(url);
                //We deserialize the JSON data from this line
                var tr = JsonConvert.DeserializeObject<List<Login>>(content);
                //After deserializing , we store our data in the List called ObservableCollection
                trends = new ObservableCollection<Login>(tr);

                Debug.Write("CONSOLE TRENDS " + trends[0].codigo.ToString());                
                Debug.Write("CONSOLE TRENDS " + trends[0].empresa.ToString());
                Debug.Write("CONSOLE TRENDS " + trends[0].servidor.ToString());
                Debug.Write("CONSOLE TRENDS " + trends[0].porta.ToString());

                //Debug.WriteLine("LOGIN " + log);
                //Debug.WriteLine("LOGIN " + pass);

                /*if (String.IsNullOrEmpty(log) || String.IsNullOrEmpty(pass))
                {
                    DependencyService.Get<IMessage>().LongAlert("Login ou senha inválidos");
                }
                else
                {
                    DependencyService.Get<IMessage>().LongAlert("Bem vindo " + log);
                    //Navigation.PushAsync(new LoginPage10());
                    App.Current.MainPage = new Views.HomePage();
                }*/

            }
            catch (Exception ey)
            {
                Debug.WriteLine("DEBUG" + ey);
            }

            // Prefixing with `//` switches to a different navigation stack instead of pushing to the active one
            await Shell.Current.GoToAsync($"{nameof(BaixaPalletPage)}");
        }

        #region INotifyPropertyChanged      
        public event PropertyChangedEventHandler PropertyChanged;
        protected void NotifyPropertyChanged([CallerMemberName] string propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
        #endregion

    }
}
