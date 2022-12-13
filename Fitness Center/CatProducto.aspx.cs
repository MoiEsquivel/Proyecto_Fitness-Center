using Fitness_Center.Clases;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitness_Center
{
    public partial class CatProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            datagrid1.DataSource = Dboconn.ListarP();
            datagrid1.DataBind();
        }

        protected void Bagregar_Click(object sender, EventArgs e)
        {
            Dboconn.agregarProducto(TnombreP.Text,TprecioP.Text);
            Response.Redirect("CatProducto.aspx");
        }

        protected void Bmodificar_Click(object sender, EventArgs e)
        {
            Dboconn.ModificarProducto(TnombreP.Text, TprecioP.Text, ClsUsuario.codigoProducto);
            Response.Redirect("CatProducto.aspx");
        }

        protected void Bbuscar_Click(object sender, EventArgs e)
        {
            Dboconn.BuscarProducto(Tbuscar.Text);
            TnombreP.Text = ClsUsuario.NombreProducto;
            TprecioP.Text = ClsUsuario.PrecioProducto.ToString();
            Lcodigo.Text = ClsUsuario.codigoProducto;
            Tbuscar.Text = "";
        }

        protected void Beliminar_Click(object sender, EventArgs e)
        {
            Dboconn.EliminarProducto(ClsUsuario.codigoProducto);
            Response.Redirect("CatProducto.aspx");
        }
    }
}