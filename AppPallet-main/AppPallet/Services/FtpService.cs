using FluentFTP;
using FluentFTP.Exceptions;
using System;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace AppPallet.Services
{
    public class FtpService
    {
        private string ftpServer = "prosystem.dyndns-work.com";
        private string ftpUsername = ""; // Deixe em branco se não houver nome de usuário
        private string ftpPassword = ""; // Deixe em branco se não houver senha

        public async Task UploadFileAsync(string localFilePath, Page page)
        {
            var fileName = Path.GetFileName(localFilePath);
            var ftpUri = new Uri($"ftp://{ftpServer}/{fileName}");

            try
            {
                var request = (FtpWebRequest)WebRequest.Create(ftpUri);
                request.Method = WebRequestMethods.Ftp.UploadFile;
                request.Credentials = new NetworkCredential(ftpUsername, ftpPassword);

                using (var fileStream = File.OpenRead(localFilePath))
                using (var requestStream = await request.GetRequestStreamAsync())
                {
                    await fileStream.CopyToAsync(requestStream);
                }

                using (var response = (FtpWebResponse)await request.GetResponseAsync())
                {
                    if (response.StatusCode == FtpStatusCode.ClosingData)
                    {
                        await page.DisplayAlert("Success", "File uploaded successfully", "OK");
                    }
                    else
                    {
                        await page.DisplayAlert("Error", $"Upload failed: {response.StatusDescription}", "OK");
                    }
                }
            }
            catch (WebException webEx)
            {
                if (webEx.Response is FtpWebResponse ftpResponse)
                {
                    var statusDescription = ftpResponse.StatusDescription;
                    await page.DisplayAlert("FTP Error", $"FTP Error: {statusDescription}", "OK");
                }
                else
                {
                    await page.DisplayAlert("Web Error", $"Web Error: {webEx.Message}", "OK");
                }
            }
            catch (UnauthorizedAccessException)
            {
                await page.DisplayAlert("Permission Error", "Permission denied. Please ensure the app has access to read the file.", "OK");
            }
            catch (FileNotFoundException)
            {
                await page.DisplayAlert("File Error", "File not found. Please check the file path.", "OK");
            }
            catch (IOException ioEx)
            {
                await page.DisplayAlert("IO Error", $"IO Error: {ioEx.Message}", "OK");
            }
            catch (Exception ex)
            {
                await page.DisplayAlert("General Error", $"An unexpected error occurred: {ex.Message}", "OK");
            }
        }
    }
}
