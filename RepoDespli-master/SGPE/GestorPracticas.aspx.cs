using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGPE
{
    public partial class GestorPracticas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                MultiViewGestores.ActiveViewIndex = 0;


            if (Request.Params["target"] == "ViewTabla")
            {
                MultiViewGestores.SetActiveView(ViewTabla);
            }else if(Request.Params["target"] == "viewSeguimiento")
            {
                MultiViewGestores.SetActiveView(viewSeguimiento);
            }
        }

        protected void btnConsultarEstudiantes_Click(object sender, EventArgs e)
        {
            MultiViewGestores.ActiveViewIndex = 1;
        }

        protected void btnEstablecerSeguimiento_Click(object sender, EventArgs e)
        {
            MultiViewGestores.ActiveViewIndex = 2;
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            using (SqlConnection cn = new SqlConnection(@"Data Source=DESKTOP-I6L7TVE;Initial Catalog=SGPE;Integrated Security=True;"))
            {
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter("select IdUsuario, Nombre, Apellido, Documento, Email, Telefono, Direccion, Rol, Programa from USUARIOS us inner join ROLES rl on us.IdRol=rl.IdRol inner join PROGRAMAS pr on us.IdPrograma=pr.IdPrograma where Nombre like '" + txtFiltrar.Text + "%'", cn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    this.GridView2.DataSource = dt;
                    GridView2.DataBind();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                
            }
        }
    }
}