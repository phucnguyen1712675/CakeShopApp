﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CakeShopApp
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class CAKESTOREEntities : DbContext
    {
        public CAKESTOREEntities()
            : base("name=CAKESTOREEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<CAKE> CAKEs { get; set; }
        public virtual DbSet<CAKE_IN_ORDERS> CAKE_IN_ORDERS { get; set; }
        public virtual DbSet<CAKE_TYPE> CAKE_TYPE { get; set; }
        public virtual DbSet<ORDER> ORDERS { get; set; }
    }
}
