using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using progetto_pcto.Data;
using progetto_pcto.Models;

namespace progetto_pcto.Pages.CRUD
{
    public class IndexModel : PageModel
    {
        private readonly AppDbContext _context;

        public IndexModel(AppDbContext context)
        {
            this._context = context;
            this.eleEventi = _context.Prodotti.ToList();
        }

        public IList<Prodotto> eleEventi { get; set; }

        public void OnGet()
        {
            //eleEventi = await _context.Eventi.ToListAsync();
        }
    }
}
