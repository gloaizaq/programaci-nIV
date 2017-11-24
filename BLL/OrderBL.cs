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
            OrderDA ordersDAL = new OrderDA();
            return ordersDAL.GetOrders();
        }

        public static void AddOrder(Order order)
        {
            OrderDA.AddOrder(order);
        }
       
        public static Order GetOrderById(int orderId)
        {
            return OrderDA.GetOrderById(orderId);
        }
    }
}
