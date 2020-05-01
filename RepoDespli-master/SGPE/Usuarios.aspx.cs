using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGPE
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                MultiViewUsuarios.ActiveViewIndex = 0;
        }

        protected void btnNuevoUsuario_Click(object sender, EventArgs e)
        {
            MultiViewUsuarios.ActiveViewIndex = 1;
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {
            
            MultiViewUsuarios.ActiveViewIndex = 0;
            /*using (SqlConnection cn = new SqlConnection("Data Source=DESKTOP-I6L7TVE;Initial Catalog=SGPE;Integrated Security=True;"))
            {
                cn.Open();
                Conexion objConexion = new Conexion();
                objConexion.abrirBaseDatos();
              
                SqlCommand cmd = new SqlCommand("dbo.Ejemplos", cn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ejemplo", txtNombre.Text);

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    //aqui cargas la lista
                }
            }
              */  
        }

        protected void btnAgregarUsuario_Click(object sender, EventArgs e)
        {
            using (SqlConnection cn = new SqlConnection(@"Data Source=DESKTOP-I6L7TVE;Initial Catalog=SGPE;Integrated Security=True;"))
            {
                cn.Open();
                Conexion objConexion = new Conexion();
                objConexion.abrirBaseDatos();
                int typeIDRol = Convert.ToInt32(DropListRol.SelectedIndex);
                int typeIDPrograma = Convert.ToInt32(DropListRol.SelectedIndex);
                SqlCommand cmd = new SqlCommand("dbo.Procedure", cn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                cmd.Parameters.AddWithValue("@Documento", txtDocumento.Text);
                cmd.Parameters.AddWithValue("@IdRol", typeIDRol+1);
                cmd.Parameters.AddWithValue("@Email", txtemail.Text);
                cmd.Parameters.AddWithValue("@Telefono", txttelefono.Text);
                cmd.Parameters.AddWithValue("@Direccion",txtDireccion.Text);
                cmd.Parameters.AddWithValue("@Contrasena", txtContrasena.Text);
                cmd.Parameters.AddWithValue("@IdPrograma", typeIDPrograma+1);
                cmd.Parameters.AddWithValue("@Apellido", txtApellido.Text);

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    //aqui cargas la lista
                }
            }
            
        }

        protected void btnReportes_Click(object sender, EventArgs e)
        {
            MultiViewUsuarios.ActiveViewIndex = 2;
        }
    }
}