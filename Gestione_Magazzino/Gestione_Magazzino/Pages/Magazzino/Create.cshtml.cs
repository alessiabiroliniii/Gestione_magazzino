using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using gestione_magazzino.Data;
using gestione_magazzino.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Gestione_Magazzino.Pages.Magazzino
{
    public class CreateModel : PageModel
    {
        [BindProperty]
        public Magazzino Magazzino { get; set; }

        private AppDbContext _context { get; set; }
        public AddModel(AppDbContext context)
        {
            this._context = context;
        }

        public void OnGet()
        {
        }
        public async Task<ActionResult> OnPostAsync()
        {
            if (ModelState.IsValid)
            {
                var day = Prestazione.Data.Date;
                if (day.DayOfWeek == DayOfWeek.Saturday || day.DayOfWeek == DayOfWeek.Sunday)
                    return BadRequest("Prenotazioni Consentite da lunedi a venerdi");
                if (Prestazione.TipoPrestazione == "Analisi del sangue")
                    Prestazione.costo = 70;
                if (Prestazione.TipoPrestazione == "Analisi urina")
                    Prestazione.costo = 50;
                if (Prestazione.TipoPrestazione == "Test Covid")
                    Prestazione.costo = 40;
                await _context.AddAsync(Prestazione);


                await _context.SaveChangesAsync();
                return RedirectToPage("./Index");
            }
            return BadRequest("Inserire i dati correttamente");
        }
    }
}
