using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using gestione_magazzino.Data;
using Gestione_Magazzino.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Gestione_Magazzino.Pages.Magazzino
{
    public class CreateModel : PageModel
    {
        [BindProperty]
        public magazzino mag { get; set; }

        private AppDbContext _context { get; set; }
        public CreateModel(AppDbContext context)
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
                await _context.AddAsync(mag);

                await _context.SaveChangesAsync();
                return RedirectToPage("./Index");
            }
            return BadRequest("Inserire i dati correttamente");
        }
    }
}
