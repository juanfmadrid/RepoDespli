<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestorPracticas.aspx.cs" Inherits="SGPE.GestorPracticas" %>

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
                        <a class="navbar-brand" href="http://localhost:52530/GestorPracticas">Sistema Gestor de Practicas en Ingenieria TdeA</a>
                    </div>
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="http://localhost:52530/GestorPracticas">Inicio</a></li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Opciones<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="GestorPracticas.aspx?target=ViewTabla">Consultar Estudiantes</a></li>
                                <li><a href="GestorPracticas.aspx?target=viewSeguimiento">Establecer Seguimiento</a></li>
                                <li><a href="#">Generar Informes</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Ayuda</a></li>
                        <li><a href="#">PQR</a></li>
                    </ul>
                    </div>


            </nav>
        <asp:MultiView ID="MultiViewGestores" runat="server">
             <asp:View ID="ViewMenu" runat="server">
            <div class="container">
                <asp:LinkButton ID="btnConsultarEstudiantes" runat="server" class="btn btn-info" OnClick="btnConsultarEstudiantes_Click"> Consultar Estudiantes </asp:LinkButton>
                <asp:LinkButton ID="btnConfigurarSeguimiento" runat="server" class="btn btn-info" OnClick="btnEstablecerSeguimiento_Click"> Establecer Seguimiento </asp:LinkButton>
                <asp:LinkButton ID="btnGenerarInformes" runat="server" class="btn btn-info"> Generar Informes </asp:LinkButton>
            </div>
                 </asp:View>


                  <asp:View ID="ViewTabla" runat="server">
        <div class="container">
           <h3>Buscar Usuarios</h3>
          
            <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click" />
            <asp:TextBox ID="txtFiltrar" runat="server"></asp:TextBox>
        </div>
        <div class="container">
      <h2>Usuarios</h2>           
    <%--   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" AllowPaging="True" AllowSorting="True" DataKeyNames="IdUsuario" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
          <AlternatingRowStyle BackColor="White" />
          <Columns>
              <asp:BoundField DataField="IdUsuario" HeaderText="IdUsuario" SortExpression="IdUsuario" InsertVisible="False" ReadOnly="True" />
              <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
              <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
              <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
              <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
              <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
              <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
              <asp:BoundField DataField="Rol" HeaderText="Rol" SortExpression="Rol" />
              <asp:BoundField DataField="Programa" HeaderText="Programa" SortExpression="Programa"></asp:BoundField>
              <asp:CommandField ButtonType="Button" HeaderText="Opciones" ShowDeleteButton="True" ShowEditButton="True" />
          </Columns>
            <EditRowStyle BackColor="#7C6F57" />
          <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
          <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
          <RowStyle BackColor="#E3EAEB" />
          <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
          <SortedAscendingCellStyle BackColor="#F8FAFA" />
          <SortedAscendingHeaderStyle BackColor="#246B61" />
          <SortedDescendingCellStyle BackColor="#D4DFE1" />
          <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            --%>
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
            <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
          <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
          <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
          <RowStyle BackColor="#E3EAEB" />
          <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
          <SortedAscendingCellStyle BackColor="#F8FAFA" />
          <SortedAscendingHeaderStyle BackColor="#246B61" />
          <SortedDescendingCellStyle BackColor="#D4DFE1" />
          <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SGPEConnectionString %>" SelectCommand="select IdUsuario, Nombre, Apellido, Documento, Email, Telefono, Direccion, Rol, Programa from USUARIOS us inner join ROLES rl on us.IdRol=rl.IdRol inner join PROGRAMAS pr on us.IdPrograma=pr.IdPrograma" UpdateCommand="UPDATE USUARIOS SET Documento = @Documento, Nombre = @Nombre, Email = @Email, Telefono = @Telefono, Direccion = @Direccion, Apellido = @Apellido WHERE (IdUsuario = @IdUsuario)" DeleteCommand="DELETE FROM USUARIOS WHERE (IdUsuario = @IdUsuario)">
                <DeleteParameters>
                    <asp:Parameter Name="IdUsuario" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Documento" />
                    <asp:Parameter Name="Nombre" />
                    <asp:Parameter Name="Email" />
                    <asp:Parameter Name="Telefono" />
                    <asp:Parameter Name="Direccion" />
                    <asp:Parameter Name="Apellido" />
                    <asp:Parameter Name="IdUsuario" />
                </UpdateParameters>
            </asp:SqlDataSource>
    
    </div>
            </asp:View>

            <asp:View ID="viewSeguimiento" runat="server">

            

            </asp:View>
            
            
            

        </asp:MultiView>

        </form>
    
</body>
</html>
