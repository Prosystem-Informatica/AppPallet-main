using System.Threading.Tasks;

namespace AppPallet
{
    class MessageService : IMessageService
    {
        public async Task ShowAsync(string message)
        {
            await App.Current.MainPage.DisplayAlert("Pedidos", message, "OK");
        }

        //public async Task ShowAsync(Track objeto, string title, string message, string text1)
        //{
        //    //await App.Current.MainPage.DisplayAlert(title, message, text1);
        //    await PopupNavigation.Instance.PushAsync(new MyPopupPage(objeto));
        //}

        //public async Task ShowAsync(Track objeto, string title, string message, string text1, string text2)
        //{
        //    //await App.Current.MainPage.DisplayAlert(title, message, text1, text2);
        //    await PopupNavigation.Instance.PushAsync(new MyPopupPage(objeto));
        //}

        public async Task<bool> ShowAsyncBool(string title, string message, string text1, string text2)
        {
            return await App.Current.MainPage.DisplayAlert(title, message, text1, text2);

            //return PopupNavigation.Instance.PushAsync(new MyPopupPage(title));
        }
    }
}