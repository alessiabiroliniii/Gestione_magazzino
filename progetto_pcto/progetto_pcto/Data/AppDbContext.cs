﻿using Microsoft.EntityFrameworkCore;
using progetto_pcto.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace progetto_pcto.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions options) : base(options)
        {

        }
        public DbSet<Prodotto> Prodotti { get; set; }
    }
}
