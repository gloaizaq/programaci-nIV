using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BLL;

namespace Pruebas
{
    class Program
    {
        static void Main(string[] args)
        {
            OrderBL test = new OrderBL();
            var x = test.GetOrders();
        }
    }
}
