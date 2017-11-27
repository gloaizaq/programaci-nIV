<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inventario.aspx.cs" Inherits="Principal.Inventario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inventario</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Inventario</h1>
        <table style="width: 100%;">
            <tr>
                <td>
                    <ul><a href="/Categorias.aspx">Categorias</a></ul>
                    <ul><a href="/Productos.aspx">Productos</a></ul>
                    <ul><a href="/Proveedores.aspx">Proveedores</a></ul>
                </td>
                <td>
                    <asp:Image ID="Image1" runat="server" ImageAlign="Right" ImageUrl="~/Images/inventario.png" Height="225px" Width="273px" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
