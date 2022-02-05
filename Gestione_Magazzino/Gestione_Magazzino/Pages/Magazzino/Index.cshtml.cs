using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using gestione_magazzino.Data;
using Gestione_Magazzino.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace Gestione_Magazzino.Pages.Magazzino
{
    public class IndexModel : PageModel
    {
        private AppDbContext _context { get; set; }
        public List<magazzino> Ele { get; set; }
        public IndexModel(AppDbContext context)
        {
            this._context = context;
        }
        public async Task<ActionResult> OnGetAsync()
        {
            Ele = await _context.Prodotti.ToListAsync();
            return Page();
        }
    }
}
