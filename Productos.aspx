<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Principal.Inventario.Productos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Productos</h1>
        <table style="width: 100%;">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label1" runat="server" Text="IdProducto:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtidproducto" runat="server"></asp:TextBox>
                </td>
                <td></td>
                <td align="right">
                    <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" Width="99px" />
                </td>
                <td>
                    <asp:Button ID="btnBorrar" runat="server" Text="Eliminar" Width="100px" />
                </td>
            </tr>

            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label2" runat="server" Text="Nombre:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                </td>
                <td></td>
                <td align="right">
                    <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" Width="100px" />
                </td>
                <td>
                    <asp:Button ID="btnListado" runat="server" Text="Ver Listado" Width="100px" />
                </td>
            </tr>

            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label3" runat="server" Text="IDProveedor:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtidpreveedor" runat="server"></asp:TextBox>
                </td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="IDCategoria:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtidcategoria" runat="server"></asp:TextBox>
                </td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Cant Unidad:"></asp:Label>

                </td>
                <td>
                    <asp:TextBox ID="txtcantunidad" runat="server"></asp:TextBox>
                </td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Precio Unidad:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtpreciounidad" runat="server"></asp:TextBox>
                </td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Unidad Stock:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtunidadstock" runat="server"></asp:TextBox>
                </td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Descontinuado:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtdescontinuado" runat="server"></asp:TextBox>
                </td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td class="auto-style1"></td>
                <td>
                    <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
                </td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td class="auto-style1">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" Width="100px" OnClick="btnGuardar_Click" />
                </td>
                <td align="center">
                    <asp:Button ID="btnModificar" runat="server" Text="Modificar" Width="100px" OnClick="btnModificar_Click" />
                </td>
                <td>
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" Width="101px" />
                </td>
                <td></td>
                <td></td>
            </tr>
        </table>
        <asp:GridView ID="GridListado" style="width: 100%;" runat="server"></asp:GridView>
    </div>
    </form>
</body>
</html>
