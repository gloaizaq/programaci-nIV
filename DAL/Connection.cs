using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;

namespace DAL
{
    public class Connection
    {
        private SqlConnection con;
        public SqlConnection Con
        {
            get { return con; }
            set { con = value; }
        }
        public Connection()
        {
            string miCadenaConexion = ConfigurationManager.ConnectionStrings["miCadena"].ConnectionString;
            Con = new SqlConnection(miCadenaConexion);
        }
       
        public void AbrirConexionBD()
        {
            Con.Open();
        }
       
        public void CerrarConexionBD()
        {
            Con.Close();
        }

        public SqlDataReader ExecStoredProc(string sp, List<SqlParameter> parametros = null)
        {
            SqlCommand cmd = new SqlCommand(sp, Con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (parametros != null)
            {
                foreach (var param in parametros)
                {
                    cmd.Parameters.Add(param);
                }
            }
            AbrirConexionBD();
            return cmd.ExecuteReader();
        }
    }
}
    

