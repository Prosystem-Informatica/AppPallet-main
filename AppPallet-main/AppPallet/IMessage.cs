namespace AppPallet
{
    public interface IMessage
    {
        void LongAlert(string message);
        void ShortAlert(string message);
    }
}