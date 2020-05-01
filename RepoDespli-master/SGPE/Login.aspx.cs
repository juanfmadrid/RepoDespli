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
    
    public partial class Login : System.Web.UI.Page
    {
        
        
        


        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            if(!IsPostBack)
            multiview1.activeviewindex=0
            o con 
            multiview.setactiveview(nombreid)
            en el metodo del boton
            multiview1.activeindex=0;
             */
         


        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Conexion objConexion;
            objConexion = new Conexion();
            //Response.Redirect("Administrador.aspx");
            DataSet objDataSet;
            String mensaje = String.Empty;
            try
            {
                objConexion.abrirBaseDatos();
                String sql = "select IdRol from USUARIOS where Documento='" + txtUsuario.Text + "' and Contrasena='" + txtPassword.Text + "';";
                objDataSet = objConexion.ejecutarConsultaSql(sql);
                int i = Convert.ToInt32(objDataSet.Tables[0].Rows[0][0] == DBNull.Value ? 0 : objDataSet.Tables[0].Rows[0][0]);
                if (i == 1)
                {
                    Response.Redirect("administrador.aspx");
                }
                if (i == 2)
                {
                    Response.Redirect("GestorPracticas.aspx");
                }
                if (i == 3)
                {
                    Response.Redirect("Usuarios.aspx");
                }
                objConexion.cerrarBaseDatos();

            }
            catch (Exception)
            {
            Response.Write("<script language=javascript>alert('Usuario y/o contraseña incorrectos');</script>");
            } 
        }
    }
}