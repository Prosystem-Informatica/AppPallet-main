using System.Threading.Tasks;

namespace AppPallet
{
    public interface IMessageService
    {
        Task ShowAsync(string message);
        //Task ShowAsync(Track objeto, string title, string message, string text1);
        //Task ShowAsync(Track objeto, string title, string message, string text1, string text2);
        Task<bool> ShowAsyncBool(string title, string message, string text1, string text2);
    }
}