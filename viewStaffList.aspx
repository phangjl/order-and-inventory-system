<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewStaffList.aspx.cs" Inherits="WebApplication1.viewStaffList" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
        <div id="inventoryReportMainForm">

             <div>
               <asp:Button ID="Button1" runat="server" Text="< Back" Font-Bold="true" CssClass="backInventoryMenu" OnClick="Button1_Click" />
             </div>

             <div style="text-align:center;">
                <h3 style="text-align:center; font-weight:bold"> Staff List </h3>
             </div>
          
            <div style="width:100%;margin-bottom: 10%;margin-top:10px;  " >
                <div class="col-xs-12" style="width:100%; border:solid 1px;background-color:black;color:white;font-weight:bolder " >
                     <div class="col-xs-2" style="float:left;width:25%"><asp:Label ID="lblStaffUsernameHeader" runat="server" style="font-weight:bold;" Text="USERNAME"></asp:Label></div>
                    <div class="col-xs-2" style="float:left;width:25%"><asp:Label ID="lblStaffNameHeader" runat="server" style="font-weight:bold;" Text="NAME"></asp:Label></div>
                    <div class="col-xs-2" style="float:left;width:25%"><asp:Label ID="lblStaffEmailHeader" runat="server" style="font-weight:bold;" Text="EMAIL"></asp:Label></div>
                    <div class="col-xs-2" style="float:left;width:25%"><asp:Label ID="lblStaffPositionHeader" runat="server" style="font-weight:bold;" Text="POSITION"></asp:Label></div>

                </div>

          
                    <%
                        List<string> record0 = (List<string>)this.Session["allStaffUsername"];
                        List<string> record1 = (List<string>)this.Session["allStaffName"];
                        List<string> record2 = (List<string>)this.Session["allStaffEmail"];
                        List<string> record3 = (List<string>)this.Session["allStaffPosition"];

                        for (int i = 0; i < record0.Count(); i++)
                        {
                            lblStaffUsername.Text = record0[i].ToString();
                            lblStaffName.Text = record1[i].ToString();
                            lblStaffEmail.Text = record2[i].ToString();
                            lblStaffPosition.Text = record3[i].ToString();

                           
                     %>
                <a href="modifyStaff.aspx?id=<%=record0[i].ToString() %>" style="color:black;">
                    <div class="col-xs-12"style="width:100%; border:solid 1px; padding:1%;font-weight:bolder" id="productList">
                        <div class="col-xs-2" style="float:left;width:25%"><asp:Label ID="lblStaffUsername" runat="server" ></asp:Label></div>
                         <div class="col-xs-2" style="float:left;width:25%"><asp:Label ID="lblStaffName" runat="server" ></asp:Label></div>
                         <div class="col-xs-2" style="float:left;width:25%"><asp:Label ID="lblStaffEmail" runat="server" ></asp:Label></div>
                         <div class="col-xs-2" style="float:left;width:25%"><asp:Label ID="lblStaffPosition" runat="server" ></asp:Label></div>
                        
                    </div>
                         
                     
                </a>
                <%
                    }

                %>

                </div>
            
        </div>
    <div style="height:25em;"></div>
</asp:Content>
