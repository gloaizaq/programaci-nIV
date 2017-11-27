﻿<%@ Page Language="C#" MasterPageFile="~/Dummy.Master" AutoEventWireup="true" CodeBehind="wfrmOrdersList.aspx.cs" Inherits="Principal.wfrmOrdersList" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="BodyContent" runat="server">
    <div>
        <asp:Button CssClass="btn" ID="nuevaOrden" OnClick="nuevaOrden_Click" runat="server" Text="Nueva orden" />
        <asp:ListView ID="lvOrders" ItemPlaceholderID="Contenido" runat="server">
            <LayoutTemplate>
                <table class="tabla-lista" runat="server" id="tablaOrders" >
                   <tr runat="server" id="Encabezado">
                    <th runat="server">ID</th>
                    <th runat="server">Comprador</th>
                    <th runat="server">Empleado</th>
                    <th runat="server">Fecha orden</th>
                    <th runat="server">Fecha requerida</th>
                    <th runat="server">Fecha envío</th>
                    <th runat="server">Medio envío</th>
                    <th runat="server">Carga</th>
                    <th runat="server">Nombre envío</th>
                    <th runat="server">Estado</th>
                    <th runat="server"><i class="fa fa-eye" aria-hidden="true"></i></th>
                    <th runat="server"><i class="fa fa-trash" aria-hidden="true"></i></th>
                </tr>
                <tr runat="server" id="Contenido" ></tr>
                    <tr>
                        <td class="contenedor-numeros" colspan="10">
                            <asp:DataPager ID="PaginadorDatos" runat="server" PageSize="15" PagedControlID="lvOrders">
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
                    <%--<a ID="OrderDetail" runat="server" OnServerClick="OrderDetail_ServerClick">--%>
                        <asp:Label ID="orderIdLabel" runat="server" 
                        Text='<%#Eval("OrderID") %>' />
                    <%--</a>--%>
                  </td>
                    <td runat="server">
                    <asp:Label ID="Label1" runat="server" 
                      Text='<%#Eval("Customer.ContactName")%>' />
                  </td>
                    <td runat="server">
                    <asp:Label ID="Label2" runat="server" 
                      Text='<%#Eval("Employee.FirstName")+" "+Eval("Employee.LastName")%>' />
                  </td>
                    <td runat="server">
                    <asp:Label ID="Label3" runat="server" 
                      Text='<%#Eval("OrderDate", "{0:dd-MM-yyyy}") %>' />
                  </td>
                    <td runat="server">
                    <asp:Label ID="Label4" runat="server" 
                      Text='<%#Eval("RequiredDate", "{0:dd-MM-yyyy}") %>' />
                  </td>
                    <td runat="server">
                    <asp:Label ID="Label5" runat="server" 
                      Text='<%#Eval("ShippedDate", "{0:dd-MM-yyyy}") %>' />
                  </td>
                  <td runat="server">
                    <asp:Label ID="Label6" runat="server" 
                      Text='<%#Eval("Shipper.CompanyName") %>' />
                  </td>
                  <td runat="server">
                    <asp:Label ID="Label7" runat="server" 
                      Text='<%#Eval("Freight") %>' />
                  </td>
                  <td runat="server">
                    <asp:Label ID="Label8" runat="server" 
                      Text='<%#Eval("ShipName") %>' />
                  </td>
                  <td runat="server">
                    <asp:Label ID="Label9" runat="server" 
                      Text='<%#Eval("State.Name") %>' />
                  </td>
                  <td runat="server">
                    <a class="icono" ID="detail" runat="server" OnServerClick="OrderDetail_ServerClick">
                        <i class="fa fa-eye" aria-hidden="true"></i>
                    </a>
                  </td>
                    <td runat="server">
                    <a class="icono" ID="delete" runat="server" OnServerClick="OrderDetail_ServerClick">
                        <i class="fa fa-trash" aria-hidden="true"></i>
                    </a>
                  </td>
                </tr>
              </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

