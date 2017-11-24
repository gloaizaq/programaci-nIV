using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BEL;
using System.Data.SqlClient;

namespace DAL
{
    public class OrderDA
    {
        public List<Order> GetOrders()
        {
            VentasCxtDataContext ctx = new VentasCxtDataContext();
            
            var orders = (from order in ctx.Orders
                            select order).OrderByDescending(o => o.OrderID);

            return orders.ToList();
            
        }
        public static Order GetOrderById(int orderId)
        {
            using (VentasCxtDataContext ctx = new VentasCxtDataContext())
            {
                var orders = from order in ctx.Orders
                             where order.OrderID == orderId
                             select order;

                return orders.SingleOrDefault();
            }
        }
        public static void AddOrder(Order order)
        {
            using (VentasCxtDataContext ctx = new VentasCxtDataContext())
            {
                ctx.Orders.InsertOnSubmit(order);
                ctx.SubmitChanges();
            }
        }
    }
}
