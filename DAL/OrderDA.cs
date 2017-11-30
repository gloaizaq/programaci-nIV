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
        private static VentasCxtDataContext ctx = new VentasCxtDataContext();
        public static List<Order> GetOrders()
        {
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

        public static void UpdOrder(Order order)
        {
            Order newOrder = new Order();
            newOrder = ctx.Orders.Single(id => id.OrderID == order.OrderID);

            newOrder.CustomerID = order.CustomerID;
            newOrder.EmployeeID = order.EmployeeID;
            newOrder.OrderDate = order.OrderDate;
            newOrder.RequiredDate = order.RequiredDate;
            newOrder.ShippedDate = order.ShippedDate;
            newOrder.ShipVia = order.ShipVia;
            newOrder.Freight = order.Freight;
            newOrder.ShipName = order.ShipName;
            newOrder.IdState = order.IdState;
            newOrder.Order_Details = order.Order_Details;

            ctx.SubmitChanges();
            
        }
    }
}
