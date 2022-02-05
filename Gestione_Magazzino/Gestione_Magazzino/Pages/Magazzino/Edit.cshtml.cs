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
    public class EditModel : PageModel
    {
        [BindProperty]
        public magazzino mag { get; set; }

        private AppDbContext _context { get; set; }

        public EditModel(AppDbContext context)
        {
            this._context = context;
        }
        public async Task<ActionResult> OnGetAsync(string id)
        {
            var result = await _context.Prodotti.FirstOrDefaultAsync(x => x.codice == int.Parse(id));
            if (result != null)
            {
                mag = result;
                return Page();
            }
            return NotFound("Nessuna Prenotazione con codice " + id + " Trovata");
        }

        public async Task<ActionResult> OnPostAsync()
        {
            var result = await _context.Prodotti.FirstOrDefaultAsync(x => x.codice == mag.codice);
            if (result != null)
            { 
                await _context.SaveChangesAsync();
                return RedirectToPage("./Index");
            }
            return NotFound();
        }
    
    }
}
