<%@ Page Title="" Language="C#" MasterPageFile="~/Dummy.Master" AutoEventWireup="true" CodeBehind="wfrmOrderDetail.aspx.cs" Inherits="Principal.wfrmOrders.wfrmOrderDetail" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../assets/css/factura.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="BodyContent" runat="server">
    <div class="contenedor">
        <asp:Label ID="OrderIDLabel" runat="server" Text=""></asp:Label>
        <asp:Label ID="CustomerIDLabel" runat="server" Text=""></asp:Label>
        <asp:Label ID="EmployeeIDLabel" runat="server" Text=""></asp:Label>
        <asp:Label ID="OrderDateLabel" runat="server" Text=""></asp:Label>
        <asp:Label ID="RequiredDateLabel" runat="server" Text=""></asp:Label>
        <asp:Label ID="ShippedDateLabel" runat="server" Text=""></asp:Label>
        <asp:Label ID="ShipViaLabel" runat="server" Text=""></asp:Label>
        <asp:Label ID="FreightLabel" runat="server" Text=""></asp:Label>
        <asp:Label ID="ShipNameLabel" runat="server" Text=""></asp:Label>
        <asp:Label ID="IdStateLabel" runat="server" Text=""></asp:Label>

        <header>
			<h1>Orden</h1>
			<address >
				<p>Gustavo Loaiza</p>
				<p>Cartago, Concepción, Tres Ríos</p>
				<p>(506) 8743-7613</p>
			</address>
			<span><img alt="Logo UAM" src="logo.png"></span>
		</header>
		<article>
			<h1>Factura</h1>
			<!-- <address >
				<p>UAM CR<br>2017</p>
			</address> -->

			<table class="detail">
				<tr>
					<th><span>Orden #</span></th>
					<td><span>11000</span></td>
					<th><span>Orden #</span></th>
					<td><span>11000</span></td>
					<th><span>Orden #</span></th>
					<td><span>11000</span></td>
				</tr>
				<tr>
					<th><span>Fecha</span></th>
					<td><span>2 Nov, 2017</span></td>
					<th><span>Fecha</span></th>
					<td><span>2 Nov, 2017</span></td>
					<th><span>Fecha</span></th>
					<td><span>2 Nov, 2017</span></td>
				</tr>
				<tr>
					<th><span>Total</span></th>
					<td><span id="prefix" >$</span><span>13499.00</span></td>
					<th><span>Total</span></th>
					<td><span id="prefix" >$</span><span>13499.00</span></td>
					<th><span>Total</span></th>
					<td><span id="prefix" >$</span><span>13499.00</span></td>
				</tr>
			</table>
			<table class="inventory">
				<thead>
					<tr>
						<th><span>Producto</span></th>
						<th><span>Descripción</span></th>
						<th><span>Cantidad</span></th>
						<th><span>Precio</span></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><span>Mi producto</span></td>
						<td><span>Este es mi producto</span></td>
						<td><span>4</span></td>
						<td><span data-prefix>₡</span><span>600.00</span></td>
					</tr>
					<tr>
						<td><span>Mi producto</span></td>
						<td><span>Este es mi producto</span></td>
						<td><span>4</span></td>
						<td><span data-prefix>₡</span><span>600.00</span></td>
					</tr>
					<tr>
						<td><span>Mi producto</span></td>
						<td><span>Este es mi producto</span></td>
						<td><span>4</span></td>
						<td><span data-prefix>₡</span><span>600.00</span></td>
					</tr>
					<tr>
						<td><span>Mi producto</span></td>
						<td><span>Este es mi producto</span></td>
						<td><span>4</span></td>
						<td><span data-prefix>₡</span><span>600.00</span></td>
					</tr>
					<tr>
						<td><span>Mi producto</span></td>
						<td><span>Este es mi producto</span></td>
						<td><span>4</span></td>
						<td><span data-prefix>₡</span><span>600.00</span></td>
					</tr>
					<tr>
						<td><span>Mi producto</span></td>
						<td><span>Este es mi producto</span></td>
						<td><span>4</span></td>
						<td><span data-prefix>₡</span><span>600.00</span></td>
					</tr>
					<tr>
						<td><span>Mi producto</span></td>
						<td><span>Este es mi producto</span></td>
						<td><span>4</span></td>
						<td><span data-prefix>₡</span><span>600.00</span></td>
					</tr>
					<tr>
						<td><span>Mi producto</span></td>
						<td><span>Este es mi producto</span></td>
						<td><span>4</span></td>
						<td><span data-prefix>₡</span><span>600.00</span></td>
					</tr>
				</tbody>
			</table>
			<table class="balance">
				<tr>
					<th><span>Total</span></th>
					<td><span data-prefix>₡</span><span>400.00</span></td>
				</tr>
				<tr>
					<th><span>Descuento</span></th>
					<td><span data-prefix>₡</span><span>200.00</span></td>
				</tr>
			</table>
		</article>
		<!-- <aside>
			<h1><span>Comentarios</span></h1>
			<div>
				<p>Cualquier cosa que quiera poner aquí, sobre la empresa o sobre el pago de la orden</p>
			</div>
		</aside> -->

    </div>
</asp:Content>
