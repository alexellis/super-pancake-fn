using System;
using System.Text;
using System.Threading.Tasks;
using System.Net.Http;

namespace Function
{
    public class FunctionHandler
    {
        private static readonly HttpClient client = new HttpClient();

        public void Handle(string input) {
            PingURL(input.Trim()).Wait();
        }

        private static async Task PingURL(string url) {
            client.DefaultRequestHeaders.Add("User-Agent", "OpenFaaS URL-ping in CSharp");

            var stringTask = client.GetAsync(url);
            var response = await stringTask;

            Console.Write(string.Format("{0} returned {1}", url, ((int)response.StatusCode)) );
        }
    }
}
