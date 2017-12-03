using System.Collections.Generic;
using System.Data;
using System.Linq;
using BEL;

namespace DAL
{
    public static class OrderDA
    {
        private static VentasCxtDataContext ctx = new VentasCxtDataContext();
        public static List<Order> GetOrders()
        {
            
            var orders = (from order in ctx.Orders
                              select order).OrderByDescending(o => o.OrderID);

            ctx.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, orders);

            return orders.ToList();
        }
        public static decimal GetTotalOrderPrice(int orderID)
        {
            using (VentasCxtDataContext ctx = new VentasCxtDataContext())
            {
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
            using (VentasCxtDataContext ctx = new VentasCxtDataContext())
            {
                var orders = (from order in ctx.Orders
                          where order.OrderID == orderId
                          select order);

                return orders.SingleOrDefault<Order>();
            }
        }
        public static Order GetOrderByIdNoUsing(int orderId)
        {
            
            var orders = (from order in ctx.Orders
                            where order.OrderID == orderId
                            select order);
            ctx.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, orders);
            return orders.SingleOrDefault<Order>();
            
        }
        public static List<Order_Detail> GetOrderDetails(int orderID)
        {
            //using (VentasCxtDataContext ctx = new VentasCxtDataContext())
            //{
                var orders = (from order in ctx.Order_Details
                             where order.OrderID == orderID
                             select order);
            ctx.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, orders);

            return orders.ToList<Order_Detail>();
            //}
        }
        public static void AddOrder(Order order)
        {
            using (VentasCxtDataContext ctx = new VentasCxtDataContext())
            {
                ctx.Orders.InsertOnSubmit(order);
                ctx.SubmitChanges();
            }
        }
        public static void AddOrderDetail(Order_Detail orderDetail)
        {
            using (VentasCxtDataContext ctx = new VentasCxtDataContext())
            {
                ctx.Order_Details.InsertOnSubmit(orderDetail);
                ctx.SubmitChanges();   
            }
        }

        public static void UpdOrder(Order order, List<Order_Detail> orderDetails)
        {
            using (VentasCxtDataContext ctx = new VentasCxtDataContext())
            {
                Order newOrder = new Order();
                List<Order_Detail> details = new List<Order_Detail>();
                newOrder = ctx.Orders.Single(id => id.OrderID == order.OrderID);
                var query = from detail in ctx.Order_Details where detail.OrderID == order.OrderID select detail;
                details = query.ToList<Order_Detail>();

                newOrder.CustomerID = order.CustomerID;
                newOrder.EmployeeID = order.EmployeeID;
                newOrder.OrderDate = order.OrderDate;
                newOrder.RequiredDate = order.RequiredDate;
                newOrder.ShippedDate = order.ShippedDate;
                newOrder.ShipVia = order.ShipVia;
                newOrder.Freight = order.Freight;
                newOrder.ShipName = order.ShipName;
                newOrder.IdState = order.IdState;

                DelOrderDetails(order.OrderID);
                
                foreach (var detail in orderDetails)
                {
                    Order_Detail newOrderDetail = new Order_Detail();
                    newOrderDetail.OrderID = order.OrderID;
                    newOrderDetail.ProductID = detail.ProductID;
                    newOrderDetail.UnitPrice = detail.UnitPrice;
                    newOrderDetail.Quantity = detail.Quantity;
                    newOrderDetail.Discount = detail.Discount;

                    ctx.Order_Details.InsertOnSubmit(newOrderDetail);
                    
                }
                
                ctx.SubmitChanges();
            }
        }
        
        public static void DelOrder(int orderID)
        {
            using (VentasCxtDataContext ctx = new VentasCxtDataContext())
            {
                Order order = ctx.Orders.Single(o => o.OrderID.Equals(orderID));
                ctx.Orders.DeleteOnSubmit(order);
                ctx.SubmitChanges();
            }
        }
        public static void DelOrderDetails(int orderID)
        {
            using (VentasCxtDataContext ctx = new VentasCxtDataContext())
            {
                var x = (from y in ctx.Order_Details
                         select y).Where(od => od.OrderID == orderID);
                ctx.Order_Details.DeleteAllOnSubmit(x);
                ctx.SubmitChanges();
            }
        }
    }
}
