using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace Gestione_Magazzino.Pages.Service
{
    public class scrapingRepository : IscrapingRepository
    {
        private readonly HttpClient httpClient;
        public scrapingRepository (HttpClient httpClient)
        {
            this.httpClient = httpClient;
        }
        public async Task<> nomefunzione (parametri)
        {
            return await httpClient.GetFromJsonAsync<>();
        }
    }
}
