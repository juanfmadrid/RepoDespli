<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SGPE.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/stylelogin.css" type="text/css"/>
    <title></title>
</head>
    <body>  
        <div class="container">
            <img src="logo-ppal.jpg" class="img-responsive" width="460" height="345" id="logo"/>
                <form id="formulario" runat="server">
                   <%--<div class="form-group row"> --%> 
                        <%--<div class="col-xs-4"> --%>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="txtUsuario" runat="server" placeholder="Usuario" class="form-control"></asp:TextBox>
                            </div> 
                         <%--</div>  --%>
                         <%--</div>  --%>
                    <%--<div class="form-group row"> --%> 
                        <%--<div class="col-xs-4"> --%>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <asp:TextBox ID="txtPassword" runat="server" placeholder="Contraseña" class="form-control" type="password"></asp:TextBox>   
                            </div>
                        <%--</div>  --%>
                         <%--</div>  --%>
                    <br />
                    <br />
                    <div class="input-group">
                        <asp:LinkButton ID="btnIngresar" runat="server" class="btn btn-info" OnClick="btnIngresar_Click"> Ingresar <span class="glyphicon glyphicon-log-in"/></asp:LinkButton>
                        <%-- <a href="Administrador.aspx" role="button" class="btn btn-info"><span class="glyphicon glyphicon-log-in"></span> Ingresar </a>--%>
                    </div>
                </form>
        </div> 
    </body>
</html>


