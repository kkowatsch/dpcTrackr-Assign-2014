//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace dpcTrackr
{
    using System;
    using System.Collections.Generic;
    
    public partial class CITY
    {
        public CITY()
        {
            this.CLIENTs = new HashSet<CLIENT>();
        }
    
        public int ID { get; set; }
        public string city1 { get; set; }
    
        public virtual ICollection<CLIENT> CLIENTs { get; set; }
    }
}
