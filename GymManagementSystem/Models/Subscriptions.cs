//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GymManagementSystem.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Subscriptions
    {
        public int SubscriptionID { get; set; }
        public Nullable<int> MemberID { get; set; }
        public string SubscriptionType { get; set; }
        public Nullable<System.DateTime> StartDate { get; set; }
        public Nullable<System.DateTime> EndDate { get; set; }
    
        public virtual Members Members { get; set; }
    }
}
