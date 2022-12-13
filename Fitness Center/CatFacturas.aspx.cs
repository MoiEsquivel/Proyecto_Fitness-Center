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
    public partial class CatFacturas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bbuscar_Click(object sender, EventArgs e)
        {
            Facturacion.DetalleFactura(Tbuscar.Text);
            tcodigocliente.Text = Facturacion.CDcliente.ToString();
            tnumerofactura.Text = Facturacion.N_Factura.ToString();
            tfecha.Text = Facturacion.fecha;
            tnombrecliente.Text = Facturacion.Nombre;
            LSB.Text = Facturacion.subtotal.ToString();
            LIVA.Text = Facturacion.iva.ToString();
            LTOTAL.Text = Facturacion.total.ToString();

            DataTable dt = new DataTable();
            GridView1.DataSource = Facturacion.Listar(Tbuscar.Text);
            GridView1.DataBind();
        }

        protected void BnuevaB_Click(object sender, EventArgs e)
        {
            Response.Redirect("CatFacturas.aspx");
        }
    }
}