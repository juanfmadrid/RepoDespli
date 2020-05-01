using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data;
namespace SGPE
{
    
    public class Conexion
    {
        SqlConnection con;
        DataSet objds;
        SqlCommand objCommandSql;

        public Conexion()
    {
            con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CadenaConexion"].ToString());
    }
    public string abrirBaseDatos()
    {
        String mensaje = String.Empty;
        try
        {
            con.Open();
        }catch (SqlException objException)
        {
            mensaje = objException.Message;
        }
            return mensaje;
    }
    public string cerrarBaseDatos()
    {
        String mensaje = String.Empty;
        try
        {
            con.Close();
        }
        catch (SqlException objException)
        {
            mensaje = objException.Message;
        }
            return mensaje;
    }
    public DataSet ejecutarConsultaSql(String consultaSql)
    {
        String mensaje = String.Empty;
      
        try
        {
            SqlDataAdapter objAdapter = new SqlDataAdapter(consultaSql, con);
            objds = new DataSet();
            objAdapter.Fill(objds);
        }
        catch (SqlException objException)
        {
            mensaje = objException.Message;
        }
            return objds;
    }
    public String ejecutarNoConsultaSql(String comandoSql)
    {
        String mensaje = String.Empty;

        try
        {
            objCommandSql = new SqlCommand(comandoSql, con);
            objCommandSql.ExecuteNonQuery();
            mensaje = "comando ejecutado";
        }
        catch (SqlException objException)
        {
            mensaje = objException.Message;

        }
            return mensaje;
    }
    }
}