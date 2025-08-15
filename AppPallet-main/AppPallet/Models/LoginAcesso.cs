using SQLite;
using Xamarin.Forms;

namespace AppPallet.Models
{
    public class LoginAcesso
    {
        [PrimaryKey, AutoIncrement]
        public int Id_key { get; set; }
        public string codigo { get; set; }
        public string validado { get; set; }
        public string empresa { get; set; }
        public string id_Placa { get; set; }
        public string placa { get; set; }
        public string equipe { get; set; }
    }
}