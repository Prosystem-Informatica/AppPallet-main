using SQLite;
using System;
using System.Collections.Generic;
using System.Text;

namespace AppPallet.Models
{
    public class VerificaCarga
    {
        [PrimaryKey, AutoIncrement]
        public int Id_key { get; set; }
        public string ID { get; set; }
        public string DATA { get; set; }
        public string ID_VEICULO { get; set; }
        public string PLACA { get; set; }
        public string QUANT { get; set; }
        public string QUANTDV { get; set; }
    }
}
