<%@ Page Title="" Language="C#" MasterPageFile="~/Dummy.Master" AutoEventWireup="true" CodeBehind="wfrmOrderDetail.aspx.cs" Inherits="Principal.wfrmOrders.wfrmOrderDetail" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
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
    </div>
</asp:Content>
