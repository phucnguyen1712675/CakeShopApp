//------------------------------------------------------------------------------
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
    using System.Collections.ObjectModel;
    using PropertyChanged;

    [AddINotifyPropertyChangedInterface]
    public partial class CAKE_IN_ORDERS
    {
        public int ORDERS_ID { get; set; }
        public int CAKE_ID { get; set; }
        public Nullable<int> NUMBER { get; set; }
    
        public virtual CAKE CAKE { get; set; }
        public virtual ORDER ORDER { get; set; }
    }
}
