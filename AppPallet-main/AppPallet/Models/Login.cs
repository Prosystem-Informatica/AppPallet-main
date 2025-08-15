using SQLite;

namespace AppPallet.Models
{
    public class Login
    {
        [PrimaryKey, AutoIncrement]
        public int Id_key { get; set; }
        public string codigo { get; set; }
        public string empresa { get; set; }
        public string servidor { get; set; }
        public string porta { get; set; }
        public string login { get; set; }
        public string cnpj { get; set; }
        public string senha { get; set; }

    }
}