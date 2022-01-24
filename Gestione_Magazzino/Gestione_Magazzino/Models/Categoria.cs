using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Gestione_Magazzino.Models
{
    public class Categoria
    {
        [Key]
        public int codice { get; set; }
        [Required]
        public string nome { get; set; }
    }
}
