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
using Newtonsoft.Json.Linq;

namespace gestione_magazzino.Pages.categorie
{
    public class IndexModel : PageModel
    {
        static public string URL = "https://gestionemagazzino.pythonanywhere.com/";
        public class User
        {
            public string index { get; set; }

            public string amount { get; set; }
        }
        public class Categoria
        {
            public string id { get; set; }
            public string nome { get; set; }
        }
        public List<Categoria> eleCategoria { get; set; }

        public void OnGet()
        {
            HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", Class.token);

            var result = client.GetStringAsync(URL + "categoria");

            var json = JsonConvert.SerializeObject(new User()
            {
                index = "0",
                amount = "100"
            });
            var request = new HttpRequestMessage
            {
                Method = HttpMethod.Get,
                RequestUri = new Uri(URL + "categoria"),
                Content = new StringContent(json, Encoding.UTF8, MediaTypeNames.Application.Json)
            };

            HttpResponseMessage response = client.Send(request);

            Task<string> responseBody = response.Content.ReadAsStringAsync();
            List<Categoria> response2 = JsonConvert.DeserializeObject<List<Categoria>>(JObject.Parse(responseBody.Result)["categorie"].ToString());
            eleCategoria = response2;
        }
    }
}
