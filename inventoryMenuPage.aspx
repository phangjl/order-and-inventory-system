<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="inventoryMenuPage.aspx.cs" Inherits="WebApplication1.inventoryMenuPage" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
    <div id="inventorymenupage">
  
     <div style="text-align:center">
        <asp:Button ID="Button1" runat="server" Text="< Back" Font-Bold="true" CssClass="inventorymenulist" OnClick="Button1_Click" />

    </div>
     <div style="text-align:center">
        <asp:Button ID="Button2" runat="server" Text="Upload Product" Font-Bold="true" CssClass="inventorymenulist" OnClick="Button2_Click" />

    </div>
     <div style="text-align:center">
        <asp:Button ID="Button3" runat="server" Text="View Inventory Report" Font-Bold="true" CssClass="inventorymenulist" OnClick="Button3_Click" />

    </div>

</div>


</asp:Content>


