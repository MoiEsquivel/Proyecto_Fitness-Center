using Fitness_Center.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitness_Center
{
    public partial class CatDireccion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {           
            
        }

        protected void BagreP_Click(object sender, EventArgs e)
        {
            Dboconn.agregarProvincia(TnewProv.Text);
            Response.Redirect("CatDireccion.aspx");
        }

        protected void BagreC_Click(object sender, EventArgs e)
        {
            Dboconn.agregarCanton(TnewCanton1.Text, DProvinciaD.SelectedValue.ToString());
            Response.Redirect("CatDireccion.aspx");
        }

        protected void BagreD_Click(object sender, EventArgs e)
        {
            Dboconn.agregarDistrito(TnewDistrito.Text, DcantonD.SelectedValue.ToString());
            Response.Redirect("CatDireccion.aspx");
        }

        protected void BborrarP_Click(object sender, EventArgs e)
        {
            Dboconn.EliminarProvincia(DProvinciaD.SelectedValue.ToString());
            Response.Redirect("CatDireccion.aspx");
        }

        protected void BborrarC_Click(object sender, EventArgs e)
        {
            Dboconn.EliminarCanton(DcantonD.SelectedValue.ToString());
            Response.Redirect("CatDireccion.aspx");
        }

        protected void BborrarD_Click(object sender, EventArgs e)
        {
            Dboconn.EliminarDistrito(DdistrD.SelectedValue.ToString());
            Response.Redirect("CatDireccion.aspx");
        }
    }
}