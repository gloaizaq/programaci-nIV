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

        public static int AddOrder(Order order)
        {
            return OrderDA.AddOrder(order);
        }
        public static void AddOrderDetail(OrderDetail orderDetail)
        {
            OrderDA.AddOrderDetail(orderDetail);
        }
    }
}
