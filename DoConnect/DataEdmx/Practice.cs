//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataEdmx
{
    using System;
    using System.Collections.Generic;
    
    public partial class Practice
    {
        public Practice()
        {
            this.Doctors = new HashSet<Doctors>();
            this.Staff = new HashSet<Staff>();
        }
    
        public int ID { get; set; }
        public string Name { get; set; }
        public string Phone_Number { get; set; }
        public string Fax_Number { get; set; }
        public string Street_Address { get; set; }
        public string Suburb { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public string Trading_Times { get; set; }
    
        public virtual ICollection<Doctors> Doctors { get; set; }
        public virtual ICollection<Staff> Staff { get; set; }
    }
}