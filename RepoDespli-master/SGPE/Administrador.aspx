<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Administrador.aspx.cs" Inherits="SGPE.Administrador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <title></title>
</head>
    <body>
        <form id="form1" runat="server">
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">Sistema Gestor de Practicas en Ingenieria TdeA</a>
                    </div>
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Inicio</a></li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Opciones<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Opcion 1-1</a></li>
                                <li><a href="#">Opcion 1-2</a></li>
                                <li><a href="#">Opcion 1-3</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Ayuda</a></li>
                        <li><a href="#">PQR</a></li>
                    </ul>
                    </div>
            </nav>
            <div class="container">
              <%--<a href="Usuarios.aspx" role="button" class="btn btn-info">USUARIOS</a>
              <button type="button" class="btn btn-info">INFORMES</button> --%>
                <asp:LinkButton ID="btnUsuarios" runat="server" class="btn btn-info" OnClick="btnUsuarios_Click"> Usuarios </asp:LinkButton>
                <asp:LinkButton ID="btnInformes" runat="server" class="btn btn-info" OnClick="btnInformes_Click"> Informes </asp:LinkButton>
            </div>
        </form>
    </body>
</html>
