using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Mime;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace gestione_magazzino.Pages.prodotti
{
    public class IndexModel : PageModel
    {
        static public string URL = "https://gestionemagazzino.pythonanywhere.com/";
        public class User
        {
            public string index { get; set; }

            public string amount { get; set; }
        }

        public void OnGet()
        {
            HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", Class.token);

            var result = client.GetStringAsync(URL + "prodotto");

            var json = JsonConvert.SerializeObject(new User()
            {
                index = "0",
                amount="100"
            }) ;
            var request = new HttpRequestMessage
            {
                Method = HttpMethod.Get,
                RequestUri = new Uri(URL + "prodotto"),
                Content = StringContent(json, Encoding.UTF8, MediaTypeNames.Application.Json)
            };
        }
    }
}
