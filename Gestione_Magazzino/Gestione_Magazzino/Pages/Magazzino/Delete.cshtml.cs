using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Gestione_Magazzino.Pages.Magazzino
{
    public class DeleteModel : PageModel
    {
        public Prestazione Prestazione { get; set; }
        private AppDbContext _context { get; set; }
        public DeleteModel(AppDbContext context)
        {
            this._context = context;
        }
        public async Task<ActionResult> OnGetAsync(string id)
        {
            var result = await _context.Prestazioni.FirstOrDefaultAsync(x => x.idPrestazione == int.Parse(id));
            if (result != null)
            {
                Prestazione = result;
                return Page();
            }
            return NotFound("Nessuna Prestazione con codice " + id + " Trovata");
        }

        public async Task<ActionResult> OnPostAsync(string id)
        {
            var result = await _context.Prestazioni.FirstOrDefaultAsync(x => x.idPrestazione == int.Parse(id));
            if (result != null)
            {
                _context.Remove(result);
                await _context.SaveChangesAsync();
                return RedirectToPage("./Index");
            }
            return BadRequest("Errore durante l'eliminazione");
        }
    }
}
