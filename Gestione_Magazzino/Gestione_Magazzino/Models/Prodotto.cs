using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Gestione_Magazzino.Models
{
    public class Prodotto
    {
        [Key]
        public int codice { get; set; }
        [Required]
        public string nome { get; set; }
        [Required]
        public string indirizzo { get; set; }
        [Required]
        public int numero_referente { get; set; }
    }
}
