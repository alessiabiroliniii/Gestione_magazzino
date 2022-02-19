using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Security.Cryptography.Xml;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace gestione_magazzino.Pages.prodotti
{
    public class registraModel : PageModel
    {
        static public string URL = "https://gestionemagazzino.pythonanywhere.com/";

        public class User
        {
            public string nome{ get; set; }
            public string password { get; set; }
            public string cognome { get; set; }
            public string email { get; set; }
        }

        public void OnPost(string Nome, string Password, string Cognome, string Email)
        {
            var httpWebRequest = (HttpWebRequest)WebRequest.Create(URL + "register");
            httpWebRequest.ContentType = "application/json";
            httpWebRequest.Method = "POST";
            
                using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
                {
                    string json = JsonConvert.SerializeObject(new User() { 
                    nome=Nome,
                    password=Password, 
                    cognome=Cognome,
                    email=Email
                    });

                    streamWriter.Write(json);
                }

                var httpResponse = (HttpWebResponse) httpWebRequest.GetResponseAsync().Result;
                using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                {
                    var result = streamReader.ReadToEnd();
                    Class.token = JObject.Parse(result)["access_token"].ToString();
                }
        }
    }
}
