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
    public partial class CAKE
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CAKE()
        {
            this.CAKE_IN_ORDERS = new ObservableCollection<CAKE_IN_ORDERS>();
        }
    
        public int CAKE_ID { get; set; }
        public string CAKE_NAME { get; set; }
        public int CAKE_TYPE { get; set; }
        public Nullable<double> PRICE { get; set; }
        public string IMAGE { get; set; }
        public int REMAINING_AMOUNT { get; set; }
        public string DESCRIPTION { get; set; }
    
        public virtual CAKE_TYPE CAKE_TYPE1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ObservableCollection<CAKE_IN_ORDERS> CAKE_IN_ORDERS { get; set; }
    }
}
