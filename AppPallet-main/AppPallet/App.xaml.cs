using AppPallet.Models;
using AppPallet.Services;
using AppPallet.Views;
using System;
using System.Collections.ObjectModel;
using System.Linq;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace AppPallet
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();
            //DependencyService.Register<IMessageService, MessageService>();
            MainPage = new AppShell();

            // Navegar para a página de login ao iniciar
            Shell.Current.GoToAsync("//LoginPage");
        }

        protected override void OnStart()
        {
            //var dbHelper = new DatabaseHelper();
            //if (dbHelper.IsUserLoggedIn())
            //{
            //    ControleRepository buscaDados = new ControleRepository();
            //    DadosServicos.Instance.AcessoDados = buscaDados.GetAllLoginAcessoData().FirstOrDefault();
            //    DadosServicos.Instance.LoginDados = buscaDados.GetAllLoginData().FirstOrDefault();
            //    //MainPage = new NavigationPage(new CopaPalletPage());
            //    Shell.Current.GoToAsync("//CopaPalletPage");
            //}
            //else
            //{
            //    Shell.Current.GoToAsync("//LoginPage");
            //}
        }

        protected override void OnSleep()
        {
        }

        protected override void OnResume()
        {
        }
    }
}
