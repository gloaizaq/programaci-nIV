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

        public static void UpdOrder(Order order)
        {
            OrderDA.UpdOrder(order);
        }
       
        public static Order GetOrderById(int orderId)
        {
            return OrderDA.GetOrderById(orderId);
        }
        public static decimal GetTotalOrderPrice(int orderID)
        {
            return OrderDA.GetTotalOrderPrice(orderID);
        }

        public static decimal GetDiscountAmount(int orderID)
        {
            return OrderDA.GetDiscountAmount(orderID);
        }
    }
}
