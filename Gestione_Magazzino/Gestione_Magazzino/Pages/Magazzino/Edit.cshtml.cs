using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Gestione_Magazzino.Pages.Magazzino
{
    public class EditModel : PageModel
    {
        [BindProperty]
        public Prestazione Prestazione { get; set; }

        private AppDbContext _context { get; set; }

        public EditModel(AppDbContext context)
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
            return NotFound("Nessuna Prenotazione con codice " + id + " Trovata");
        }

        public async Task<ActionResult> OnPostAsync()
        {
            var result = await _context.Prestazioni.FirstOrDefaultAsync(x => x.idPrestazione == Prestazione.idPrestazione);
            if (result != null)
            {
                result.TipoPrestazione = Prestazione.TipoPrestazione;
                if (result.TipoPrestazione == "Analisi del sangue")
                    result.costo = 70;
                if (result.TipoPrestazione == "Analisi urina")
                    result.costo = 50;
                if (result.TipoPrestazione == "Test Covid")
                    result.costo = 40;
                result.Sede = Prestazione.Sede;
                result.Data = Prestazione.Data;
                var day = result.Data.Date;
                if (day.DayOfWeek == DayOfWeek.Saturday || day.DayOfWeek == DayOfWeek.Sunday)
                    return BadRequest("Prenotazioni Consentite da lunedi a venerdi");
                result.CodiceFiscale = Prestazione.CodiceFiscale;
                await _context.SaveChangesAsync();
                return RedirectToPage("./Index");
            }
            return NotFound();
        }
    
    }
}
