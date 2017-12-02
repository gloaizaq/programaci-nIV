using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BEL;
using DAL;

namespace BLL
{
    public class DummyBL
    {
        public static List<Customer> GetCustomers()
        {
            return DummyDA.GetCustomers();
        }
        public static List<Employee> GetEmployees()
        {
            return DummyDA.GetEmployees();
        }
        public static List<Shipper> GetShippers()
        {
            return DummyDA.GetShippers();
        }
        public static List<Product> GetProducts()
        {
            return DummyDA.GetProducts();
        }
        public static Product GetProductByID(int productID)
        {
            return DummyDA.GetProductById(productID);
        }
    }
}
