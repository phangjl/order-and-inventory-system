<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="salesreport.aspx.cs" Inherits="WebApplication1.salesreport" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
  <div id="salereport">
      <div>
           <asp:Button ID="Button1" runat="server" Text="< Back" Font-Bold="true" CssClass="backordermenu" OnClick="Button1_Click" />
          <div id="syear">
               
               <asp:Button ID="Button2" runat="server" Text="2018" CssClass="selectyear" OnClick="Button2_Click"/>
               <asp:Button ID="Button5" runat="server" Text="2019" CssClass="selectyear" OnClick="Button5_Click" />
               <asp:Button ID="Button3" runat="server" Text="2020" CssClass="selectyear" OnClick="Button3_Click" />

      </div>
      </div>

      <br />
      <br />
      <div style="text-align:center;">
         <h3 style="text-align:center; font-weight:bold">  Sales Report </h3>
      </div>
      <div id="salesreport1" style="float:left; width:100%;  border:solid 1px; padding:1%; margin-bottom: 5%; margin-left:2%;">
          <table>
              <tr>
                   <td> <asp:Label ID="Label2" runat="server" Text="Report Generated Date :"></asp:Label> </td>
                    <td> <asp:Label ID="Label01" runat="server" Text="Order ID: "  CssClass="createorderinput" ></asp:Label> </td>
              </tr>
              <tr>
                   <td> <asp:Label ID="Label3" runat="server" Text="Date Range "></asp:Label> </td>
                   <td> <asp:Label ID="Label02" runat="server" Text="Order ID: "  CssClass="createorderinput" ></asp:Label> </td>
              </tr>
                <tr>
                   <td> <asp:Label ID="Label4" runat="server" Text="Total number of order created"></asp:Label> </td>
                    <td> <asp:Label ID="Label03" runat="server" Text="Order ID: "  CssClass="createorderinput" ></asp:Label> </td>
              </tr>
              <tr>
                   <td> <asp:Label ID="Label5" runat="server" Text="Total number of order in delivered status "></asp:Label> </td>
                    <td> <asp:Label ID="Label04" runat="server" Text="Order ID: "  CssClass="createorderinput" ></asp:Label> </td>
              </tr>
              <tr>
                   <td> <asp:Label ID="Label6" runat="server" Text="Total number of order in pending status "></asp:Label> </td>
                    <td> <asp:Label ID="Label05" runat="server" Text="Order ID: "  CssClass="createorderinput" ></asp:Label> </td>
              </tr>
              <tr>
                   <td> <asp:Label ID="Label7" runat="server" Text="Total number of canceled order "></asp:Label> </td>
                   <td> <asp:Label ID="Label06" runat="server" Text="Order ID: "  CssClass="createorderinput" ></asp:Label> </td>
              </tr>
               <tr>
                   <td> <asp:Label ID="Label8" runat="server" Text="Total amount :"></asp:Label> </td>
                    <td> <asp:Label ID="Label07" runat="server" Text="Order ID: "  CssClass="createorderinput" ></asp:Label> </td>
              </tr>
             

          </table>

      </div>

  </div>



</asp:Content>


