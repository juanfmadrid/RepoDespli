<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="SGPE.Usuarios" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/StyleUsuarios.css" type="text/css"/>
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
        <asp:MultiView ID="MultiViewUsuarios" runat="server">
            <asp:View ID="ViewTabla" runat="server">
        <div class="container">
           <h3>Buscar Usuarios</h3>
          
        </div>
        <div class="container">
      <h2>Usuarios</h2>
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" AllowPaging="True" AllowSorting="True" DataKeyNames="IdUsuario" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
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
    
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SGPEConnectionString %>" DeleteCommand="DELETE FROM [USUARIOS] WHERE [IdUsuario] = @IdUsuario" InsertCommand="INSERT INTO [USUARIOS] ([Documento], [Nombre], [IdRol], [Email], [Telefono], [Direccion], [Contrasena], [IdPrograma], [Apellido]) VALUES (@Documento, @Nombre, @IdRol, @Email, @Telefono, @Direccion, @Contrasena, @IdPrograma, @Apellido)" SelectCommand="SELECT [IdUsuario], [Documento], [Nombre], [IdRol], [Email], [Telefono], [Direccion], [Contrasena], [IdPrograma], [Apellido] FROM [USUARIOS]" UpdateCommand="UPDATE [USUARIOS] SET [Documento] = @Documento, [Nombre] = @Nombre, [IdRol] = @IdRol, [Email] = @Email, [Telefono] = @Telefono, [Direccion] = @Direccion, [Contrasena] = @Contrasena, [IdPrograma] = @IdPrograma, [Apellido] = @Apellido WHERE [IdUsuario] = @IdUsuario">
                <DeleteParameters>
                    <asp:Parameter Name="IdUsuario" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Documento" Type="String" />
                    <asp:Parameter Name="Nombre" Type="String" />
                    <asp:Parameter Name="IdRol" Type="Int32" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Telefono" Type="String" />
                    <asp:Parameter Name="Direccion" Type="String" />
                    <asp:Parameter Name="Contrasena" Type="String" />
                    <asp:Parameter Name="IdPrograma" Type="Int32" />
                    <asp:Parameter Name="Apellido" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Documento" Type="String" />
                    <asp:Parameter Name="Nombre" Type="String" />
                    <asp:Parameter Name="IdRol" Type="Int32" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Telefono" Type="String" />
                    <asp:Parameter Name="Direccion" Type="String" />
                    <asp:Parameter Name="Contrasena" Type="String" />
                    <asp:Parameter Name="IdPrograma" Type="Int32" />
                    <asp:Parameter Name="Apellido" Type="String" />
                    <asp:Parameter Name="IdUsuario" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:LinkButton ID="btnNuevoUsuario" runat="server" class="btn btn-success btn-lg" OnClick="btnNuevoUsuario_Click"> Agregar <span class="glyphicon glyphicon-new-window"/></asp:LinkButton>
            <asp:LinkButton ID="btnReportes" runat="server" class="btn btn-success btn-lg" OnClick="btnReportes_Click"> Reportes <span class="glyphicon glyphicon-new-window"/></asp:LinkButton>
    </div>
                
</asp:View>
            <asp:View ID="ViewNuevoUsuario" runat="server">
    <div class="containerIngresoUsuarios">
       
                        <asp:Label ID="lblNombre" runat="server">Nombre</asp:Label>
                        <asp:TextBox ID="txtNombre" runat="server" placeholder="Nombre" class="form-control"></asp:TextBox>
                        <asp:Label ID="lblApellido" runat="server">Apellido</asp:Label>
                        <asp:TextBox ID="txtApellido" runat="server" placeholder="Apellido" class="form-control"></asp:TextBox>
                        <asp:Label ID="lblDocumento" runat="server">Documento</asp:Label>
                        <asp:TextBox ID="txtDocumento" runat="server" placeholder="Documento" class="form-control"></asp:TextBox>
                        <asp:Label ID="lblContrasena" runat="server">Contraseña</asp:Label>
                        <asp:TextBox ID="txtContrasena" runat="server" placeholder="Contraseña" class="form-control"></asp:TextBox>
                        <asp:Label ID="lblRol" runat="server">Rol</asp:Label>
                        <asp:DropDownList ID="DropListRol" runat="server" class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" DataSourceID="SqlDataSource1" DataTextField="Rol" DataValueField="IdRol">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SGPEConnectionString %>" SelectCommand="SELECT [IdRol], [Rol] FROM [ROLES]"></asp:SqlDataSource>
                        <br />
                        <asp:Label ID="lblPrograma" runat="server">Programa</asp:Label>
                        <asp:DropDownList ID="DropDownPrograma" runat="server" class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" DataSourceID="SqlDataSource2" DataTextField="Programa" DataValueField="IdPrograma">  
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SGPEConnectionString %>" SelectCommand="SELECT [IdPrograma], [Programa] FROM [PROGRAMAS]"></asp:SqlDataSource>
                        <br />
                        <asp:Label ID="lblemail" runat="server">e-mail</asp:Label>
                        <asp:TextBox ID="txtemail" runat="server" placeholder="e-mail" class="form-control"></asp:TextBox>
                        <asp:Label ID="lbltelefono" runat="server">Telefono</asp:Label>
                        <asp:TextBox ID="txttelefono" runat="server" placeholder="Telefono" class="form-control"></asp:TextBox>
                        <asp:Label ID="lblDireccion" runat="server">Direccion</asp:Label>
                        <asp:TextBox ID="txtDireccion" runat="server" placeholder="Direccion" class="form-control"></asp:TextBox>
                        <br />
                        <asp:LinkButton ID="btnAgregarUsuario" runat="server" class="btn btn-success" OnClick="btnAgregarUsuario_Click" > Agregar <span class="glyphicon glyphicon-ok"/></asp:LinkButton>
                        <asp:LinkButton ID="btnAtras" runat="server" class="btn btn-danger" OnClick="btnAtras_Click" > Atras <span class="glyphicon glyphicon-remove"/></asp:LinkButton>
       
            </div>
                
  </asp:View>
            <asp:View ID="Reportes" runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <rsweb:ReportViewer ID="ReportViewer" runat="server" BackColor="" ClientIDMode="AutoID" Font-Names="Verdana" Font-Size="8pt" HighlightBackgroundColor="" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemHoverBackColor="" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
                    <LocalReport ReportEmbeddedResource="SGPE.Reportes.ListaUsuarios.rdlc" ReportPath="Reportes\ListaUsuarios.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DataSet2" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SelectMethod="GetData" TypeName="DS1TableAdapters.USUARIOSTableAdapter"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="GetData" TypeName="DSTableAdapters.USUARIOSTableAdapter"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetData" TypeName="pruebaTableAdapters.USUARIOSTableAdapter"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="DataSet1TableAdapters.DataTable1TableAdapter"></asp:ObjectDataSource>
            </asp:View>
</asp:MultiView>
    </form>
</body>
</html>