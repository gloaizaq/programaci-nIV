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
    public static class OrderDA
    {
        public static List<Order> GetOrders()
        {
            VentasCxtDataContext ctx = new VentasCxtDataContext();
            
            var orders = (from order in ctx.Orders
                            select order).OrderByDescending(o => o.OrderID);

            return orders.ToList();
            
        }
        public static decimal GetTotalOrderPrice(int orderID)
        {
            using (VentasCxtDataContext ctx = new VentasCxtDataContext()) {
                var orderDetails = (from orderDetail in ctx.Order_Details
                             where orderDetail.OrderID == orderID
                             select orderDetail);
                decimal total = 0;
                foreach (var orderDetail in orderDetails.ToList())
                {
                    total += orderDetail.UnitPrice * orderDetail.Quantity;
                }
                
                return total;
            }
        }
        public static decimal GetDiscountAmount(int orderID)
        {
            using (VentasCxtDataContext ctx = new VentasCxtDataContext())
            {
                var orderDetails = (from orderDetail in ctx.Order_Details
                                    where orderDetail.OrderID == orderID
                                    select orderDetail);
                decimal descuento = 0;
                foreach (var orderDetail in orderDetails.ToList())
                {
                    descuento += (decimal)orderDetail.Discount * (orderDetail.UnitPrice * orderDetail.Quantity);
                }

                return descuento;
            }
        }
        public static Order GetOrderById(int orderId)
        {
            VentasCxtDataContext ctx = new VentasCxtDataContext();
            
            var orders = from order in ctx.Orders
                            where order.OrderID == orderId
                            select order;

            return orders.SingleOrDefault();
            
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
