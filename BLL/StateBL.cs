using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BEL;
using DAL;

namespace BLL
{
    public static class StateBL
    {
        public static List<State> GetActiveStates()
        {
            StateDA ordersDAL = new StateDA();
            return ordersDAL.GetActiveStates();
        }
    }
}
