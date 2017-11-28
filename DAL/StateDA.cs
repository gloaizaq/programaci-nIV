using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BEL;

namespace DAL
{
    public class StateDA
    {
        public List<State> GetActiveStates()
        {
            using (VentasCxtDataContext ctx = new VentasCxtDataContext())
            {
                var states = from state in ctx.States
                             select state;

                return states.ToList();
            }
        }
    }
}
