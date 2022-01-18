using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace progetto_pcto.Models
{
    public class Prodotto
    {
        [Key]
        public string codice { get; set; }
        [Required]
        public string nome { get; set; }
    }
}
