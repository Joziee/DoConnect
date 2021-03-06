using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace ObjectModel
{   
    public class Patient_Medical_Aid
    {
        public int ID { get; set; }
        public string Scheme_Name { get; set; }
        public string Membership_Number { get; set; }
        public bool Status { get; set; }
        public DateTime Registration_Date { get; set; }
        public DateTime Deregistration_Date { get; set; }
        public int Patient_ID { get; set; }
        public int Medical_Aid_ID { get; set; }

        public Patient_Medical_Aid Create(SqlDataReader reader)
        {
            return new Patient_Medical_Aid
            {
                ID = reader.GetInt32(reader.GetOrdinal("ID")),
                Scheme_Name = reader.GetString(reader.GetOrdinal("Scheme_Name")),
                Membership_Number = reader.GetString(reader.GetOrdinal("Membership_Number")),
                Status = reader.GetBoolean(reader.GetOrdinal("Status")),
                Registration_Date = reader.GetDateTime(reader.GetOrdinal("Registration_Date")),
                Deregistration_Date = reader.GetDateTime(reader.GetOrdinal("Deregistration_Date")),
                Patient_ID = reader.GetInt32(reader.GetOrdinal("Patient_ID")),
                Medical_Aid_ID = reader.GetInt32(reader.GetOrdinal("Medical_Aid_ID")),
            };
        }
    }
}
