using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using progetto_pcto.Data;

namespace progetto_pcto.Pages.CRUD
{
    public class CreateModel : PageModel
    {
        private readonly AppDbContext _context;
        public CreateModel(AppDbContext context)
        {
            _context = context;
        }
        [BindProperty]
        public Evento evento { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            evento = await _context.Eventi.FirstOrDefaultAsync(m => m.IdEvento == id);

            if (evento == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
