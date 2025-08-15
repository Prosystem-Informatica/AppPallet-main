using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;
using Xamarin.Essentials;

namespace AppPallet.Models
{
    public class DadosServicos
    {
        private static DadosServicos _instance;
        public static DadosServicos Instance => _instance ?? (_instance = new DadosServicos());

        public LoginAcesso AcessoDados { get; set; }
        public Login LoginDados { get; set; }
        public VerificaCarga VerificaCargaDados { get; set; }

        private DadosServicos() { }
    }
}
