using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace AppPallet.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class CustomPopupPage : ContentPage
    {
        public CustomPopupPage()
        {
            InitializeComponent();
        }

        private async void OnOkClicked(object sender, EventArgs e)
        {
            // Ação ao clicar em OK
            await Navigation.PopModalAsync();
        }

        private async void OnCancelClicked(object sender, EventArgs e)
        {
            // Ação ao clicar em Cancelar
            await Navigation.PopModalAsync();
        }
    }
}