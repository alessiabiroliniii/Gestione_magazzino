using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Gestione_Magazzino.Models;
using Gestione_Magazzino.Pages.Service;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Gestione_Magazzino.Pages
{
    public class RisultatoModel : PageModel
    {
        [Inject]
        public IscrapingRepository scrapingRepository { get; set; }
        public RisultatoModel(IscrapingRepository scrapingRepository)
        {
            this.scrapingRepository = scrapingRepository;
        }
        [BindProperty]
        public UserRegistrationDTO userRegistrationDTO { get; set; }

        public async Task<IActionResult> OnGetAsync()
        {
            return Page();
        }        
        public async Task<IActionResult>OnPostAsync()
        {
            var a = await scrapingRepository. (parametro);
            return Page();
        }
    }
}
