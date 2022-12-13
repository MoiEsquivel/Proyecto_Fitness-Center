using Fitness_Center.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitness_Center
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bingreso_Click(object sender, EventArgs e)
        {
            ClsUsuario.Clave = Tclave.Text;
            ClsUsuario.Correo = Tcorreo.Text;

            if (Dboconn.ValidarLogin(ClsUsuario.Correo, ClsUsuario.Clave) > 0)
            {
                if (ClsUsuario.Tusuario == "Admi")
                {
                    Response.Redirect("Inicio.aspx");
                }
                else
                {
                    Response.Redirect("InicioCli.aspx");                   
                }

            }
        }
    }
}