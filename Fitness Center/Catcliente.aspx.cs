using Fitness_Center.Clases;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitness_Center
{
    public partial class Catcliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
        }

        protected void Bagregar_Click(object sender, EventArgs e)
        {

            Dboconn.IngresarCliente(Tnombre.Text,Tapellido.Text,Tcorreo.Text,Telefono.Text,Dtipo.SelectedValue
                                    , Dprov.SelectedValue, Dcanton.SelectedValue, Ddistrito.SelectedValue, Tseñas.Text);
            Limpiar();
        }

       

        protected void Bbuscar_Click1(object sender, EventArgs e)
        {
            try
            {
                if (Dbuscar.Text == "Todos")
                {
                    DataTable dt = new DataTable();
                    datagrid.DataSource = Dboconn.Listar();
                    datagrid.DataBind();
                }
                else
                {
                    Dboconn.BuscarCliente(Tbuscar.Text, Tbuscar.Text);
                    Tnombre.Text = ClsUsuario.Nombre;
                    Tapellido.Text = ClsUsuario.Apellido;
                    Tcorreo.Text = ClsUsuario.Correo;
                    Telefono.Text = ClsUsuario.Telefono;
                    Dprov.SelectedValue = ClsUsuario.provivia;
                    Dcanton.SelectedValue = ClsUsuario.canton;
                    Ddistrito.SelectedValue = ClsUsuario.distrito;
                    Tseñas.Text = ClsUsuario.señas;
                    Lcodigo.Text = ClsUsuario.codigo;
                    Tbuscar.Text = "";
                }
            }
            catch (Exception)
            {

                
            }            
            

            
        }

        protected void Bmodifi_Click(object sender, EventArgs e)
        {
            Dboconn.ModificarCliente(Tnombre.Text, Tapellido.Text, Tcorreo.Text, Telefono.Text, Dtipo.SelectedValue
                                    , Dprov.SelectedValue, Dcanton.SelectedValue, Ddistrito.SelectedValue, Tseñas.Text);
        }

        protected void Bborrar_Click(object sender, EventArgs e)
        {
            Dboconn.BorrarClientes(ClsUsuario.codigo);
        }

        protected void Blimbiar_Click(object sender, EventArgs e)
        {
            Limpiar();
            Response.Redirect("Catcliente.aspx");
        }

        public void Limpiar()
        {
            try
            {
                Tnombre.Text = "";
                Tapellido.Text = ""; Tcorreo.Text = "";
                Telefono.Text = "";
                Dtipo.SelectedValue = "1";
                Dprov.SelectedValue = "1";
                Dcanton.SelectedValue = "1";
                Ddistrito.SelectedValue = "1";
                Tseñas.Text = "";
                Tbuscar.Text = "";
            }
            catch (Exception)
            {

               
            }
            
        }
    }
}