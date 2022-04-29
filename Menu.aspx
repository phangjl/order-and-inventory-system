<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="WebApplication1.Menu" %>


<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
    <div id="menupage">
    <div style="text-align:center">
        <asp:Button ID="Button1" runat="server" Text="Manage Order" Font-Bold="true" CssClass="menulist" OnClick="Button1_Click" />

    </div>
     <div style="text-align:center">
        <asp:Button ID="Button2" runat="server" Text="Manage Inventory" Font-Bold="true" CssClass="menulist" OnClick="Button2_Click" />

    </div>
     <div style="text-align:center">
        <asp:Button ID="Button3" runat="server" Text="Manage Staff" Font-Bold="true" CssClass="menulist" OnClick="Button3_Click" />

    </div>
     <div style="text-align:center">
        <asp:Button ID="Button4" runat="server" Text="Profile" Font-Bold="true" CssClass="menulist" OnClick="Button4_Click"/>

    </div>
     <div style="text-align:center">
        <asp:Button ID="Button5" runat="server" Text="Logout" Font-Bold="true" CssClass="menulist" OnClick="Button5_Click" />

    </div>

</div>


</asp:Content>