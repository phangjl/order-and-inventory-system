<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="ordermenupage.aspx.cs" Inherits="WebApplication1.ordermenupage" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
    <div id="Ordermenupage">
  
     <div style="text-align:center">
        <asp:Button ID="Button5" runat="server" Text="< Back" Font-Bold="true" CssClass="ordermenulist" OnClick="Button5_Click" />

    </div>
     <div style="text-align:center">
        <asp:Button ID="Button1" runat="server" Text="Create Order" Font-Bold="true" CssClass="ordermenulist" OnClick="Button1_Click" />

    </div>
     <div style="text-align:center">
        <asp:Button ID="Button2" runat="server" Text="View Order" Font-Bold="true" CssClass="ordermenulist" OnClick="Button2_Click" />

    </div>
     <div style="text-align:center">
        <asp:Button ID="Button3" runat="server" Text="View Canceled Order" Font-Bold="true" CssClass="ordermenulist" OnClick="Button3_Click" />

    </div>
         <% if (((string)this.Session["usertype"]).Equals("Manager")) {  %>
     <div style="text-align:center">
        <asp:Button ID="Button4" runat="server" Text="View Sales Report" Font-Bold="true" CssClass="ordermenulist" OnClick="Button4_Click"  />

    </div>
           <% } %>
</div>


</asp:Content>


