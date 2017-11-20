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
            Connection conexion = new Connection();
            try
            {
                var reader = conexion.ExecStoredProc("sp_GetActiveStates");
                List<State> states = new List<State>();
                while (reader.Read())
                {
                    State state = new State();
                    state.Id = Convert.ToInt32(reader["Id"]);
                    state.Name = reader["Name"].ToString();

                    states.Add(state);
                }
                return states;
            }
            finally
            {
                conexion.CerrarConexionBD();
            }
        }
    }
}
