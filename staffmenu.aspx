<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"  CodeBehind="staffmenu.aspx.cs" Inherits="WebApplication1.staffmenu" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
    <div id="smenu">
  
     <div style="text-align:center">
        <asp:Button ID="Button1" runat="server" Text="< Back" Font-Bold="true" CssClass="slist" OnClick="Button1_Click" />

    </div>
  <% if (((string)this.Session["usertype"]).Equals("Manager")) {  %>
     <div style="text-align:center">
        <asp:Button ID="Button2" runat="server" Text="Create Staff" Font-Bold="true" CssClass="slist" OnClick="Button2_Click" Enabled="true" />

    </div>
     <div style="text-align:center">
        <asp:Button ID="Button3" runat="server" Text="View Staff list" Font-Bold="true" CssClass="slist" OnClick="Button3_Click" Enabled="true"/>

    </div>
          <% } %>
        <div id="positionStatus" style="margin-left:auto;margin-right:auto;">
                    <asp:Label ID="lblPositionStatus" runat="server" Text="Warning" style="color:red;clear:both;float:left;width:100%;font-size:large;" visible="false"></asp:Label>
                </div>

</div>


</asp:Content>
