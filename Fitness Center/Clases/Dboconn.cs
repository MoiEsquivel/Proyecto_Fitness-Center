using System.Data;
using System.Data.SqlClient;

namespace Fitness_Center.Clases
{
    public class Dboconn
    {
        
        public static SqlConnection obtenerConexion()
        {
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["GimnasioConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            return conexion;
        }

        public static int ValidarLogin(string Correo, string Clave)
        {
            int retorno = 0;
            int tipo = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("ValidarUsuario", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Email", Correo));
                    cmd.Parameters.Add(new SqlParameter("@Clave", Clave));

                    // retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            ClsUsuario.Tusuario = rdr["Tipo"].ToString();
                            ClsUsuario.codigo = rdr["Codigo"].ToString();
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

        public static int IngresarCliente(string Nombre, string Apellido, string Correo, string Telefono, string Tipo
                                          , string prov, string cant, string distri, string señas)
        {
            int retorno = 0;
            int tipo = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("IngresarClientes", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Cliente", Nombre));
                    cmd.Parameters.Add(new SqlParameter("@Apellido", Apellido));
                    cmd.Parameters.Add(new SqlParameter("@Telefono", Telefono));
                    cmd.Parameters.Add(new SqlParameter("@Correo", Correo));
                    cmd.Parameters.Add(new SqlParameter("@Tipo", Tipo));
                    cmd.Parameters.Add(new SqlParameter("@CoPro", prov));
                    cmd.Parameters.Add(new SqlParameter("@CoCan", cant));
                    cmd.Parameters.Add(new SqlParameter("@CoDis", distri));
                    cmd.Parameters.Add(new SqlParameter("@Señas", señas));
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
        public static int ModificarCliente(string Nombre, string Apellido, string Correo, string Telefono, string Tipo
                                          , string prov, string cant, string distri, string señas)
        {
            int retorno = 0;
            int tipo = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("ModificarClientes", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Cliente", Nombre));
                    cmd.Parameters.Add(new SqlParameter("@Apellido", Apellido));
                    cmd.Parameters.Add(new SqlParameter("@Telefono", Telefono));
                    cmd.Parameters.Add(new SqlParameter("@Correo", Correo));
                    cmd.Parameters.Add(new SqlParameter("@Tipo", Tipo));
                    cmd.Parameters.Add(new SqlParameter("@CoPro", prov));
                    cmd.Parameters.Add(new SqlParameter("@CoCan", cant));
                    cmd.Parameters.Add(new SqlParameter("@CoDis", distri));
                    cmd.Parameters.Add(new SqlParameter("@Señas", señas));
                    cmd.Parameters.Add(new SqlParameter("@codigo", ClsUsuario.codigo));
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

        public static int BuscarCliente(string Nombre, string Correo)
        {
            int retorno = 0;
            int tipo = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("ListarCliente", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@nombre", Nombre));
                    cmd.Parameters.Add(new SqlParameter("@correo", Correo));

                    // retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            ClsUsuario.Nombre = rdr["Nombre"].ToString();
                            ClsUsuario.Apellido = rdr["Apellido"].ToString();
                            ClsUsuario.Correo = rdr["Email"].ToString();
                            ClsUsuario.Telefono = rdr["Telefono"].ToString();
                            ClsUsuario.Tusuario = rdr["Tipo"].ToString();
                            ClsUsuario.provivia = rdr["CodProv"].ToString();
                            ClsUsuario.canton = rdr["CodCant"].ToString();
                            ClsUsuario.distrito = rdr["CodDis"].ToString();
                            ClsUsuario.señas = rdr["Señas"].ToString();
                            ClsUsuario.codigo = rdr["Codigo"].ToString();
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

        public static int BorrarClientes(string Codigo)
        {
            int retorno = 0;
            int tipo = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("EliminarClientes", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    cmd.Parameters.Add(new SqlParameter("@codigo", Codigo));
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

        public static DataTable Listar()
        {
            int retorno = 0;
            int tipo = 0;
            SqlConnection Conn = new SqlConnection();
            DataTable dt = new DataTable();

            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {

                    using (SqlCommand cmd = new SqlCommand("VerTodos", Conn))
                    {
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

        public static int agregarProvincia(string provincia)
        {
            int retorno = 0;
            int tipo = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("AgregarProvincia", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@provincia", provincia));
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
                Conn.Dispose();
            }

            return retorno;
        }
        public static int EliminarProvincia(string provincia)
        {
            int retorno = 0;
            int tipo = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("EliminarProvincia", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@provincia", provincia));
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
                Conn.Dispose();
            }

            return retorno;
        }
        public static int agregarCanton(string Canton, string codp)
        {
            int retorno = 0;
            int tipo = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("AgregarCanton", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Canton", Canton));
                    cmd.Parameters.Add(new SqlParameter("@Cdp", codp));
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
                Conn.Dispose();
            }

            return retorno;
        }

        public static int EliminarCanton(string codp)
        {
            int retorno = 0;
            int tipo = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("EliminarCanton", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@cdp", codp));
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
                Conn.Dispose();
            }

            return retorno;
        }

        public static int agregarDistrito(string Distrito, string codp)
        {
            int retorno = 0;
            int tipo = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("AgregarDistrito", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Distrito", Distrito));
                    cmd.Parameters.Add(new SqlParameter("@Cdd", codp));
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
                Conn.Dispose();
            }

            return retorno;
        }
        public static int EliminarDistrito(string codp)
        {
            int retorno = 0;
            int tipo = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("EliminarDistrito", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Cdd", codp));
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
                Conn.Dispose();
            }

            return retorno;
        }

        public static int agregarProducto(string Nombre, string Precio)
        {
            int retorno = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("IngresarProducto", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Nombre", Nombre));
                    cmd.Parameters.Add(new SqlParameter("@precio", Precio));
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
                Conn.Dispose();
            }

            return retorno;
        }
        public static int ModificarProducto(string Nombre, string Precio, string Cod)
        {
            int retorno = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("ModificarProducto", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Codigo", Cod));
                    cmd.Parameters.Add(new SqlParameter("@Nombre", Nombre));
                    cmd.Parameters.Add(new SqlParameter("@precio", Precio));
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
                Conn.Dispose();
            }

            return retorno;
        }
        public static int EliminarProducto(string codp)
        {
            int retorno = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("EliminarProducto", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Codigo", codp));
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
                Conn.Dispose();
            }

            return retorno;
        }
        public static int BuscarProducto(string Nombre)
        {
            int retorno = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("VerProducto", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Nombre", Nombre));

                    // retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            ClsUsuario.codigoProducto = rdr["Codigo"].ToString();
                            ClsUsuario.NombreProducto = rdr["NombreProducto"].ToString();
                            ClsUsuario.PrecioProducto = float.Parse(rdr["Precio"].ToString());
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

        public static DataTable ListarP()
        {
            int retorno = 0;
            int tipo = 0;
            SqlConnection Conn = new SqlConnection();
            DataTable dtp = new DataTable();

            try
            {
                using (Conn = Dboconn.obtenerConexion())
                {

                    using (SqlCommand cmd = new SqlCommand("VerProductos", Conn))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            retorno = cmd.ExecuteNonQuery();
                            cmd.Connection = Conn;
                            sda.SelectCommand = cmd;
                            using (dtp = new DataTable())
                            {
                                cmd.CommandType = CommandType.StoredProcedure;
                                sda.Fill(dtp);
                                return dtp;
                            }
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
            return dtp;
        }
    }
}