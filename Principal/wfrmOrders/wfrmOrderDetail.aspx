<%@ Page Title="" Language="C#" MasterPageFile="~/Dummy.Master" AutoEventWireup="true" CodeBehind="wfrmOrderDetail.aspx.cs" Inherits="Principal.wfrmOrders.wfrmOrderDetail" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../assets/css/factura.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="BodyContent" runat="server">
    <div class="contenedor">      
        <header>
			<h1>Detalle de orden</h1>
			<address>
				<p><asp:Label ID="CompradorLabel" runat="server"></asp:Label></p>
                <p><asp:Label ID="CompanniaLabel" runat="server"></asp:Label></p>
                <p><asp:Label ID="DireccionLabel" runat="server"></asp:Label></p>
                <p><asp:Label ID="TelefonoLabel" runat="server"></asp:Label></p>
			</address>
			<%--<span><img alt="Logo UAM" src="logo.png"></span>--%>
		</header>
		<article>
			<h1>Factura</h1>

			<table class="detail">
				<tr>
					<th><span>Orden #</span></th>
					<td><span><asp:Label ID="OrderIDLabel" runat="server"></asp:Label></span></td>
					<th><span>Estado</span></th>
					<td><asp:Label ID="IdStateLabel" runat="server"></asp:Label></td>
                    <th><span>Flete</span></th>
					<td>
                        <span class="signo-colon">₡</span>
                        <asp:Label ID="FreightLabel" runat="server"></asp:Label>
					</td>
				</tr>
				<tr>
					<th><span>Fecha</span></th>
					<td><span><asp:Label ID="OrderDateLabel" runat="server"></asp:Label></span></td>
					<th><span>Fecha Requerida</span></th>
					<td><span><asp:Label ID="RequiredDateLabel" runat="server"></asp:Label></span></td>
					<th><span>Fecha Envío</span></th>
					<td><span><asp:Label ID="ShippedDateLabel" runat="server"></asp:Label></span></td>
				</tr>
				<tr>
					<th><span>Transportista</span></th>
					<td colspan="2"><asp:Label ID="ShipViaLabel" runat="server"></asp:Label></td>
					<th><span>Nombre envío</span></th>
					<td colspan="2"><asp:Label ID="ShipNameLabel" runat="server"></asp:Label></td>
				</tr>
                <tr>
                    <th><span>Cliente</span></th>
					<td colspan="2"><span><asp:Label ID="CustomerIDLabel" runat="server"></asp:Label></span></td>
					<th><span>Empleado</span></th>
					<td colspan="2"><span><asp:Label ID="EmployeeIDLabel" runat="server"></asp:Label></span></td>
					
				</tr>
			</table>
            <asp:ListView ID="lvOrderDetails" ItemPlaceholderID="itemPlaceholder" runat="server">
            <LayoutTemplate>
                <table class="inventory">
                    <thead>
                        <tr>
                            <th><span>Producto</span></th>
                            <th><span>Precio</span></th>
                            <th><span>Cantidad</span></th>
                            <th><span>Descuento</span></th>
                        </tr>
                    </thead>
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                    
                    <tr>
                        <td class="contenedor-numeros" colspan="4">
                            <asp:DataPager ID="PaginadorDatos" runat="server" PageSize="10" PagedControlID="lvOrderDetails">
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
                    <asp:Label ID="ProductLabel" runat="server" 
                    Text='<%#Eval("Product.ProductName")%>' />
                  </td>
                   <td runat="server">
                       <span class="signo-colon">₡</span>
                    <asp:Label ID="UnitPriceLabel" runat="server" 
                      Text='<%#Eval("UnitPrice")%>' />
                  </td>
                  <td runat="server">
                    <asp:Label ID="QuantityLabel" runat="server" 
                      Text='<%#Eval("Quantity")%>' />
                  </td>
                  <td runat="server">
                    <asp:Label ID="DiscountLabel" runat="server" 
                      Text='<%#Eval("Discount")%>' />
                  </td>
                </tr>
              </ItemTemplate>
        </asp:ListView>
			<table class="balance">
				<tr>
					<th><span>Subtotal</span></th>
					<td><span class="signo-colon">₡</span>
                        <span>
                            <asp:Label ID="TotalLabel" runat="server"></asp:Label>
                        </span>
					</td>
				</tr>
				<tr>
					<th><span>Descuento</span></th>
					<td><span class="signo-colon">₡</span>
                        <span>
                            <asp:Label ID="MontoDescuentoLabel" runat="server"></asp:Label>
                        </span>
					</td>
				</tr>
                <tr>
					<th><span>Total</span></th>
					<td><span class="signo-colon">₡</span>
                        <span>
                            <asp:Label ID="RealTotalLabel" runat="server"></asp:Label>
                        </span>
					</td>
				</tr>
			</table>
		</article>
    </div>
</asp:Content>
