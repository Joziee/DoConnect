﻿
using System.Net;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Newtonsoft.Json;
using ObjectModel;
using DataClient;

namespace DoConnectAdmin.Controllers
{
    public class EmployeesController : ApiController
    {
        [HttpGet]//Select all Employee data
        [Route("api/Employees/GetAllEmployees")]
        public List<Staff> GetAllEmployees()
        {
            DataLayer dtLayer = new DataLayer();
            return dtLayer.GetAllStaffMembers();
        }

        [HttpGet] //Select Employee by ID
        [Route("api/Employees/GetEmployee/{ID}")]
        public Staff GetEmployeeByID(int ID)
        {
            DataLayer dtLayer = new DataLayer();
            return dtLayer.GetStaff(ID);
        }

        [HttpPost]//Update Employee
        [Route("api/Employees/UpdateEmployee")]
        public bool UpdateEmployee(Staff staff)
        {
            DataLayer dtLayer = new DataLayer();
            return dtLayer.UpdateStaff(staff.ID, staff.FirstName, staff.LastName, staff.ID_Number, staff.Gender, staff.DOB, staff.Phone, staff.Employee_Type, staff.Practice_ID, staff.User_ID, staff.Email);
        }

        /*[HttpPost]
        [Route("api/Employees/InsertEmployee")]
        public bool InsertEmployee(Staff staff)
        {
            DataLayer dtLayer = new DataLayer();
            return dtLayer.InsertEmployee(staff.FirstName, staff.LastName, staff.ID_Number, staff.Gender, staff.DOB, staff.Phone, staff.Employee_Type, staff.Practice_ID, staff.Email);
        }*/

        [HttpPost]
        [Route("api/Employees/DeleteEmployee/{ID}")]
        public bool DeleteEmployee(int ID)
        {
            DataLayer dtLayer = new DataLayer();
            return dtLayer.DeleteStaff(ID);
        }
    }
}
