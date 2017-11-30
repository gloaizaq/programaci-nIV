using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BEL;

namespace DAL
{
    public class DummyDA
    {
        public static List<Customer> GetCustomers()
        {
            VentasCxtDataContext ctx = new VentasCxtDataContext();

            var customers = (from customer in ctx.Customers
                             select customer).OrderByDescending(c => c.ContactName);

            return customers.ToList();

        }
        public static List<Employee> GetEmployees()
        {
            VentasCxtDataContext ctx = new VentasCxtDataContext();

            var employees = (from employee in ctx.Employees
                             select employee).OrderByDescending(x => x.LastName);

            return employees.ToList();

        }
        public static List<Shipper> GetShippers()
        {
            VentasCxtDataContext ctx = new VentasCxtDataContext();

            var shipVias = (from shipVia in ctx.Shippers
                            select shipVia).OrderByDescending(x => x.CompanyName);

            return shipVias.ToList();

        }

        public static List<Product> GetProducts()
        {
            VentasCxtDataContext ctx = new VentasCxtDataContext();

            var products = (from product in ctx.Products
                            select product).OrderByDescending(x => x.ProductName);

            return products.ToList();

        }
        public static Product GetProductById(int productID)
        {
            VentasCxtDataContext ctx = new VentasCxtDataContext();

            var products = from product in ctx.Products
                         where product.ProductID == productID
                         select product;

            return products.SingleOrDefault();

        }
    }
}
