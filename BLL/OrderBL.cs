using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BEL;
using DAL;

namespace BLL
{
    public class OrderBL
    {
        public List<Order> GetOrders()
        {
            OrdersDA ordersDAL = new OrdersDA();
            return ordersDAL.GetOrders();
        }

        public static void AddOrder(Order order)
        {
            OrdersDA.AddOrder(order);
        }
    }
}
