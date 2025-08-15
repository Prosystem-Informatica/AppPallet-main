using System;
using System.Windows.Input;
using Xamarin.Essentials;
using Xamarin.Forms;

namespace AppPallet.ViewModels
{
    public class BaixaPalletViewModel : BaseViewModel
    {
        public BaixaPalletViewModel()
        {
            Title = "Baixa Paletes";
            OpenWebCommand = new Command(async () => await Browser.OpenAsync("https://aka.ms/xamarin-quickstart"));
        }

        public ICommand OpenWebCommand { get; }
    }
}