using AppPallet.ViewModels;
using AppPallet.Views;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using Xamarin.Essentials;
using Xamarin.Forms;

namespace AppPallet
{
    public partial class AppShell : Xamarin.Forms.Shell, INotifyPropertyChanged
    {
        public IControleRepository _controleRepository;
        public Command OpenMenuCommand { get; }
        private string userName;
        public string UserName
        {
            get => userName;
            set
            {
                if (userName != value)
                {
                    userName = value;
                    OnPropertyChanged(nameof(UserName));
                }
            }
        }

        public AppShell()
        {
            InitializeComponent();

            // Registre as rotas manualmente
            //Routing.RegisterRoute("CopaPalletPage", typeof(CopaPalletPage));
            //Routing.RegisterRoute("BaixaPalletPage", typeof(BaixaPalletPage));             

            _controleRepository = new ControleRepository();
            OpenMenuCommand = new Command(() => Current.FlyoutIsPresented = true);

            // Defina o BindingContext para que a propriedade seja usada no XAML
            this.BindingContext = this;
        }

        // Método para atualizar o nome do usuário após o login
        public void UpdateUserName(string newUserName)
        {
            UserName = newUserName;
        }

        private void OnMenuIconClicked(object sender, EventArgs e)
        {
            // Abre o menu Flyout
            FlyoutIsPresented = !FlyoutIsPresented;
        }

        private async void OnMenuItemClicked(object sender, EventArgs e)
        {
            try
            {
                _controleRepository.DeleteAllLogin();
                _controleRepository.DeleteAllLoginAcesso();
                _controleRepository.DeleteAllVerificaCarga();
                await Shell.Current.GoToAsync("//LoginPage");
            }
            catch (Exception)
            {

                throw;
            }

        }

        private async void OnCopaPalletsClicked(object sender, EventArgs e)
        {
            //await Shell.Current.GoToAsync("//CopaPalletPage");
        }

        private async void OnBaixaPalletsClicked(object sender, EventArgs e)
        {
            //await Shell.Current.GoToAsync("//BaixaPalletPage");
        }
    }
}
