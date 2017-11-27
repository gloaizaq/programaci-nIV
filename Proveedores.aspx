<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="Principal.Inventario.Proveedores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Proveedores</h1>
        <table style="width: 100%;">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label1" runat="server" Text="IdProveedor:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtidproveedor" runat="server"></asp:TextBox>
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
                    <asp:TextBox ID="txtnombre" runat="server"></asp:TextBox>
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
                    <asp:Label ID="Label3" runat="server" Text="Contacto:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtcontacto" runat="server"></asp:TextBox>
                </td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Dirección:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtdireccion" runat="server"></asp:TextBox>
                </td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="País:"></asp:Label>

                </td>
                <td>
                    <asp:DropDownList ID="cmbpais" runat="server" Height="16px" Width="128px">
                    </asp:DropDownList>
                </td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Ciudad:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="cmbciudad" runat="server" Height="16px" Width="128px">
                    </asp:DropDownList>
                </td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Región:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="cmbregion" runat="server" Height="16px" Width="129px">
                    </asp:DropDownList>
                </td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Cod Postal:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtcodpostal" runat="server"></asp:TextBox>
                </td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="Teléfono:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txttelefono" runat="server"></asp:TextBox>
                </td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="Pág Proveedor:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtpagproveedor" runat="server"></asp:TextBox>
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
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" Width="100px" />
                </td>
                <td align="center">
                    <asp:Button ID="btnModificar" runat="server" Text="Modificar" Width="100px" />
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
