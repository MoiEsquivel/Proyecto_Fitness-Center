using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.EnterpriseServices.Internal;
using System.Web.UI.WebControls;

namespace Fitness_Center.Clases
{
    public class Producto
    {
        public static int codigo { get; set; }
        public static string producto { get; set; }
        public static string nombre { get; set; }
        public static float precio { get; set; }


        public static string BuscarProducto(string cod)
        {
            string retorno = "";

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("VerProductoC", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Codigo", cod));
                    ;

                    // retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            retorno = rdr["NombreProducto"].ToString();
                            precio = float.Parse(rdr["Precio"].ToString());
                            producto = retorno;
                        }
                    }
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = "";
                nombre = retorno;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return retorno;
        }
        public static string BuscarCliente(string cod)
        {
            string retorno = "";

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("VerCliente", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Cod", cod));
                    ;

                    // retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            retorno = rdr["Nombre"].ToString() +" "+ rdr["Apellido"].ToString();
                            nombre = retorno;
                        }
                    }
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = "";
                nombre = retorno;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return retorno;
        }


    }
}