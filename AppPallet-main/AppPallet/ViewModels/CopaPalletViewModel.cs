using System.Net.Http;
using System.Threading.Tasks;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using Newtonsoft.Json;
using AppPallet.Models;

public class CopaPalletViewModel : INotifyPropertyChanged
{
    private string _totalViagens;
    private string _viagensNormal;
    private string _viagensExtra;
    private string _totalDev;

    public string TotalViagens
    {
        get => _totalViagens;
        set { _totalViagens = value; OnPropertyChanged(); }
    }

    public string ViagensNormal
    {
        get => _viagensNormal;
        set { _viagensNormal = value; OnPropertyChanged(); }
    }

    public string ViagensExtra
    {
        get => _viagensExtra;
        set { _viagensExtra = value; OnPropertyChanged(); }
    }

    public string TotalDev
    {
        get => _totalDev;
        set { _totalDev = value; OnPropertyChanged(); }
    }

    public async Task LoadDataAsync()
    {
        using (var client = new HttpClient())
        {
            var url = "http://prosystem02.dyndns-work.com:8081/datasnap/rest/TServerAPPnfe/Viagens_Dev/1/14";
            var response = await client.GetStringAsync(url);

            var resumo = JsonConvert.DeserializeObject<ViagensResumo>(response);

            TotalViagens = resumo.TOTAL_VIAGENS;
            ViagensNormal = resumo.VIAGENS_NORMAL;
            ViagensExtra = resumo.VIAGENS_EXTRA;
            TotalDev = resumo.TOTAL_DEV;
        }
    }

    public event PropertyChangedEventHandler PropertyChanged;
    protected void OnPropertyChanged([CallerMemberName] string name = null) =>
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
}
