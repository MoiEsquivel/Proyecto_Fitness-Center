using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.EnterpriseServices.Internal;

namespace Fitness_Center.Clases
{
    public class Facturacion
    {
        public static int N_Factura { get; set; }
        public static float total { get; set; }
        public static int linea { get; set; }
        public static int cantidad { get; set; }
        public static float precio { get; set; }
        public static int CDcliente { get; set; }
        public static float subtotal { get; set; }
        public static float iva { get; set; }
        public static string Nombre { get; set; }
        public static string fecha { get; set; }

        public static int AgregarDetalleFactura(int linea, int cod, int cant, float precio)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();

            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("DetFactura", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@linea", linea));
                    cmd.Parameters.Add(new SqlParameter("@codpro", cod));
                    cmd.Parameters.Add(new SqlParameter("@cantidad", cant));
                    cmd.Parameters.Add(new SqlParameter("@precio", precio));


                    retorno = cmd.ExecuteNonQuery();

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;
        }

        public static int AgregarMaestroFactura()
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();

            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("Maefactura", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@CodCliente", CDcliente));
                    cmd.Parameters.Add(new SqlParameter("@subtotal", subtotal));
                    cmd.Parameters.Add(new SqlParameter("@IVA", iva));
                    cmd.Parameters.Add(new SqlParameter("@Total", total));

                    retorno = cmd.ExecuteNonQuery();

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;
        }

        public static int DetalleFactura(string Cod)
        {
            int retorno = 0;
            var Fecha = "";
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("VerFactura", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Codigo", Cod));

                    // retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            N_Factura = int.Parse(rdr["N_Fac"].ToString());
                            fecha = rdr["Fecha"].ToString();
                            CDcliente = int.Parse(rdr["CodCliente"].ToString());
                            Nombre = rdr["Nombre"].ToString() + " " + rdr["Apellido"].ToString();
                            subtotal = float.Parse(rdr["Subtotal"].ToString());
                            iva = float.Parse(rdr["IVATotal"].ToString());
                            total = float.Parse(rdr["Total"].ToString());
                            retorno = 1;
                        }

                    }
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return retorno;
        }
        public static DataTable Listar(string Cod)
        {
            int retorno = 1;
            SqlConnection Conn = new SqlConnection();
            DataTable dt = new DataTable();

            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {

                    SqlCommand cmd = new SqlCommand("VerFacturaD", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Codigo", Cod));

                    using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            retorno = cmd.ExecuteNonQuery();
                            cmd.Connection = Conn;
                            sda.SelectCommand = cmd;
                            using (dt = new DataTable())
                            {
                                cmd.CommandType = CommandType.StoredProcedure;
                                sda.Fill(dt);
                                return dt;
                            }
                        }
                    
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
               // Conn.Close();
            }
            return dt;
        }
    }
}