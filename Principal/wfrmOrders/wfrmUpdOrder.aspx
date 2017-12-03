<%@ Page Title="" Language="C#" MasterPageFile="~/Dummy.Master" AutoEventWireup="true" CodeBehind="wfrmUpdOrder.aspx.cs" Inherits="Principal.wfrmOrders.wfrmUpdOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="../assets/js/popup.js"></script>
    <link href="../assets/css/popup.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div class="contenedor">
        <h1>Editar orden</h1>
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
                    <asp:DropDownList ID="productDropDownList" OnSelectedIndexChanged="productDropDownList_SelectedIndexChanged" runat="server"></asp:DropDownList>
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
                    <th runat="server">Borrar</th>
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
                    Text='<%# GetProductName(Eval("ProductID").ToString()) %>' />
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
                    <td runat="server">
                    <asp:LinkButton CssClass="icono" ID="BorrarDetalle" runat="server" OnClick="BorrarDetalle_Click" CommandArgument='<%#Eval("ProductID")%>'>
                        <i class="fa fa-trash" aria-hidden="true"></i>
                    </asp:LinkButton>
                  </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
        <asp:Button ID="btnDelOrder" OnClick="btnDelOrder_Click" CssClass="btn izq" runat="server" Text="Borrar Orden" />
        <asp:Button ID="btnUpdOrder" OnClick="btnUpdOrder_Click" CssClass="btn" runat="server" Text="Actualizar Orden" />
        <div class="errores">
            <div class="row">
                <asp:RegularExpressionValidator Display="Dynamic" ID="orderDateValidator" ControlToValidate="orderDateTextBox" runat="server" ValidationExpression="[0-9]{2}[-]{1}[0-9]{2}[-|\/]{1}[0-9]{4}" ErrorMessage="El formato de la fecha de orden es incorrecto"></asp:RegularExpressionValidator>
            </div>
            <div class="row">
                <asp:RegularExpressionValidator Display="Dynamic" ID="requiredDateValidator" ControlToValidate="requiredDateTextBox" runat="server" ValidationExpression="[0-9]{2}[-]{1}[0-9]{2}[-|\/]{1}[0-9]{4}" ErrorMessage="El formato de la fecha requerida es incorrecto"></asp:RegularExpressionValidator>
            </div>
            <div class="row">
                <asp:RegularExpressionValidator Display="Dynamic" ID="shippedDateValidator" ControlToValidate="shippedDateTextBox" runat="server" ValidationExpression="[0-9]{2}[-]{1}[0-9]{2}[-|\/]{1}[0-9]{4}" ErrorMessage="El formato de la fecha de envío es incorrecto"></asp:RegularExpressionValidator>
            </div>
            <div class="row">
                <asp:RegularExpressionValidator Display="Dynamic" ID="fleteValidator" ControlToValidate="freightTextBox" runat="server" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="El precio del flete es incorrecto"></asp:RegularExpressionValidator>
            </div>
            <div class="row">
                <asp:RegularExpressionValidator Display="Dynamic" ID="quantityValidator" ControlToValidate="quantityTextBox" runat="server" ValidationExpression="[+-]?[0-9]{1,10}" ErrorMessage="La cantidad es incorrecta"></asp:RegularExpressionValidator>
            </div>
            <div class="row">
                <asp:RegularExpressionValidator Display="Dynamic" ID="discountValitator" ControlToValidate="discountTextBox" runat="server" ValidationExpression="^(?:0*(?:\.\d+)?|1(\.0*)?)$" ErrorMessage="El descuento no es válido"></asp:RegularExpressionValidator>
            </div>
            <div class="row">
                <asp:RequiredFieldValidator Display="Dynamic" ID="requiredOrderDate" ControlToValidate="orderDateTextBox"  runat="server" ErrorMessage="La fecha de la orden es necesaria"></asp:RequiredFieldValidator>
            </div>
            <div class="row">
                <asp:RequiredFieldValidator Display="Dynamic" ID="requiredRequiredDate" ControlToValidate="requiredDateTextBox"  runat="server" ErrorMessage="La fecha requeridad es necesaria"></asp:RequiredFieldValidator>
            </div>
            <div class="row">
                <asp:RequiredFieldValidator Display="Dynamic" ID="requiredShippedName" ControlToValidate="shipNameTextBox"  runat="server" ErrorMessage="El nombre del envío es necesario"></asp:RequiredFieldValidator>
            </div>
            <div class="row">
                <asp:RequiredFieldValidator Display="Dynamic" ID="quantityTextBoxValidator" ControlToValidate="quantityTextBox"  runat="server" ErrorMessage="La cantidad es necesaria"></asp:RequiredFieldValidator>
            </div>
        </div>
    </div>      
</asp:Content>
