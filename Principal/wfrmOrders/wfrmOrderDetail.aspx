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
					<td><asp:Label ID="FreightLabel" runat="server"></asp:Label></td>
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
