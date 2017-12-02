using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BEL;
using DAL;

namespace BLL
{
    public static class OrderBL
    {
        public static List<Order> GetOrders()
        {
            return OrderDA.GetOrders();
        }

        public static void AddOrder(Order order)
        {
            OrderDA.AddOrder(order);
        }
        public static void AddOrderDetail(Order_Detail orderDetail)
        {
            OrderDA.AddOrderDetail(orderDetail);
        }

        public static void UpdOrder(Order order, List<Order_Detail> orderDetails)
        {
            OrderDA.UpdOrder(order, orderDetails);
        }
       
        public static Order GetOrderById(int orderId)
        {
            return OrderDA.GetOrderById(orderId);
        }
        public static List<Order_Detail> GetOrderDetails(int orderID)
        {
            return OrderDA.GetOrderDetails(orderID);
        }
        public static decimal GetTotalOrderPrice(int orderID)
        {
            return OrderDA.GetTotalOrderPrice(orderID);
        }

        public static decimal GetDiscountAmount(int orderID)
        {
            return OrderDA.GetDiscountAmount(orderID);
        }
        public static void DelOrder(int orderID)
        {
            OrderDA.DelOrder(orderID);
        }
        public static void DelOrderDetails(int orderID)
        {
            OrderDA.DelOrderDetails(orderID);
        }
    }
}
