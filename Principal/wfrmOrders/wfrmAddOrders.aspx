<%@ Page Language="C#" MasterPageFile="~/Dummy.Master" AutoEventWireup="true" CodeBehind="wfrmAddOrders.aspx.cs" Inherits="Principal.wfrmOrders.wfrmAddOrders" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="../assets/js/popup.js"></script>
    <link href="../assets/css/popup.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="BodyContent" runat="server">

    <div class="contenedor">
        <h1>Nueva orden</h1>
        <div class="row">
            <div class="col">
                <label for="customerDropDownList">Cliente</label>
                <asp:DropDownList ID="customerDropDownList" runat="server"></asp:DropDownList>
            </div>
            <div class="col">
                <label for="employeeDropDownList">Empleado</label>
                <asp:DropDownList ID="employeeDropDownList" placeholder="Empleado" runat="server"></asp:DropDownList>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <label for="orderDateTextBox">Fecha de la orden</label>
                <asp:TextBox ID="orderDateTextBox" placeholder="dd/mm/aaaa" runat="server"></asp:TextBox>
            </div>
            <div class="col">
                <label for="requiredDateTextBox">Fecha requerida</label>
                <asp:TextBox ID="requiredDateTextBox" placeholder="dd/mm/aaaa" runat="server"></asp:TextBox>
            </div>
            <div class="col">
                <label for="shippedDateTextBox">Fecha de envío</label>
                <asp:TextBox ID="shippedDateTextBox" placeholder="dd/mm/aaaa" runat="server"></asp:TextBox>
            </div>
        </div>
        
        <div class="row">
            <div class="col">
                <label for="shipViaDropDownList">Enviado por</label>
                <asp:DropDownList ID="shipViaDropDownList" placeholder="Vía" runat="server"></asp:DropDownList>
            </div>
            <div class="col">
                <label for="freightTextBox">Flete</label>
                <asp:TextBox ID="freightTextBox" placeholder="Flete" runat="server"></asp:TextBox>
            </div>
            <div class="col">
                <label for="shipNameTextBox">Nombre del envío</label>
                <asp:TextBox ID="shipNameTextBox" placeholder="Nombre envío" runat="server"></asp:TextBox>
            </div>
            <div class="col">
                <label for="stateDropDownList">Estado</label>
                <asp:DropDownList ID="stateDropDownList" placeholder="Estado" runat="server"></asp:DropDownList>
            </div>
        </div>




        <%-- VALIDAR LAS ENTRADAS DEL USUARIO --%>
        <%--EL DESCUENTO DEBE ESTAR ENTRE 0 Y 1--%>



    </div>
    <div id="popup" data-popup="popup-detail" class="contenedor popup">
        <div class="popup-inner">
            <div class="row">
                <div class="col">
                    <label for="productDropDownList">Producto</label>
                    <asp:DropDownList ID="productDropDownList" runat="server"></asp:DropDownList>
                </div>
                <div class="col">
                    <label for="unitPriceTextBox">Precio por unidad</label>
                    <asp:TextBox ID="unitPriceTextBox" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="quantityTextBox">Cantidad</label>
                    <asp:TextBox ID="quantityTextBox" runat="server"></asp:TextBox>
                </div>
                <div class="col">
                    <label for="discountTextBox">Descuento</label>
                    <asp:TextBox ID="discountTextBox" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="btnAgregarDetalle">&nbsp;</label>
                    <asp:Button ID="btnAgregarDetalle" CssClass="btn" OnClick="btnAgregarDetalle_Click" runat="server" Text="Agregar" />
                </div>
            </div>
            <a class="popup-close" data-popup-close="popup-detail" href="#">x</a>
        </div>
    </div>
    <div class="contenedor">
        <button data-popup-open="popup-detail" type="button" class="btn">Agregar producto</button>
    </div>

    <div class="contenedor">
        <asp:ListView ID="DetallesOrden" runat="server" ItemPlaceholderID="Contenido">
            <LayoutTemplate>
                <table class="tabla-lista" runat="server" id="tablaOrders" >
                    <tr runat="server" id="Encabezado">
                    <th runat="server">Producto</th>
                    <th runat="server">Precio por unidad</th>
                    <th runat="server">Cantidad</th>
                    <th runat="server">Descuento</th>
                </tr>
                <tr runat="server" id="Contenido" ></tr>
                    <tr>
                        <td class="contenedor-numeros" colspan="10">
                            <asp:DataPager ID="PaginadorDatos" runat="server" PageSize="5" PagedControlID="DetallesOrden">
                                <Fields>
                                    <asp:NumericPagerField
                                        NextPreviousButtonCssClass="numeros"
                                        CurrentPageLabelCssClass="numero-actual"
                                        NumericButtonCssClass="numeros"
                                        ButtonType="Link" 
                                        RenderNonBreakingSpacesBetweenControls="true"
                                        ButtonCount="10"
                                        PreviousPageText="Anterior"
                                        NextPageText="Siguiente" />
                                    </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr runat="server">
                    <td runat="server">
                    <asp:Label ID="orderIdLabel" runat="server" 
                    Text='<%#Eval("ProductID") %>' />
                    </td>
                    <td runat="server">
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%#Eval("UnitPrice") %>' />
                    </td>
                    <td runat="server">
                    <asp:Label ID="Label2" runat="server" 
                        Text='<%#Eval("Quantity") %>' />
                    </td>
                    <td runat="server">
                    <asp:Label ID="Label3" runat="server" 
                        Text='<%#Eval("Discount") %>' />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
        <asp:Button ID="btnAddOrden" OnClick="btnAddOrden_Click" CssClass="btn" runat="server" Text="Crear Orden" />
    </div>      
</asp:Content>
