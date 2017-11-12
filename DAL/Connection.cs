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
        private SqlConnection con; // Obj Conexion
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
        /// <summary>
        /// Metodo para Abrir la Conexion
        /// </summary>
        public void AbrirConexionBD()
        {
            Con.Open();
        }
        /// <summary>
        /// Metodo para Cerrar la Conexion
        /// </summary>
        public void CerrarConexionBD()
        {
            Con.Close();
        }

        public SqlDataReader ExecSp(string sp)
        {
            SqlCommand cmd = new SqlCommand(sp, Con);
            cmd.CommandType = CommandType.StoredProcedure;
            AbrirConexionBD();
            return cmd.ExecuteReader();
        }
    }
}
    

