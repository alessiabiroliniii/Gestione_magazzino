using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Mime;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;

namespace gestione_magazzino.Pages.magazzino
{
    public class DeleteModel : PageModel
    {
        static public string URL = "https://gestionemagazzino.pythonanywhere.com/";
        public class User
        {
            public string id { get; set; }
        }

        public void OnPost(string Id)
        {
            HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", Class.token);

            var result = client.GetStringAsync(URL + "magazzino");

            var json = JsonConvert.SerializeObject(new User()
            {
                id = Id
            });
            var request = new HttpRequestMessage
            {
                Method = HttpMethod.Delete,
                RequestUri = new Uri(URL + "magazzino"),
                Content = new StringContent(json, Encoding.UTF8, MediaTypeNames.Application.Json)
            };

            HttpResponseMessage response = client.Send(request);

            var responseBody = response.Content.ReadAsStringAsync().ConfigureAwait(false);
        }
    }
}
