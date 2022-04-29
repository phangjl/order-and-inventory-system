<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="vieworderdetail.aspx.cs" Inherits="WebApplication1.vieworderdetail" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">



     <div id="orderdetail">
      <div>
           <asp:Button ID="Button1" runat="server" Text="< Back" Font-Bold="true" CssClass="backordermenu" OnClick="Button1_Click" />
           <asp:Button ID="Button5" runat="server" Text=" Generate PDF" Font-Bold="true" CssClass="backordermenu" OnClick="Button5_Click" />
      </div>

      <div style="text-align:center;">
         <h3 style="text-align:center; font-weight:bold"> Customer Order Detail </h3>
      </div>


        <%-- store customer and salespsersion info  --%>
      <div id="orderdetail1" style="float:left; width:100%;  border:solid 1px; padding:1%; margin-bottom: 5%; margin-left:2%;">
          <table  class="createordertable">
              <tr>
                   <td> <asp:Label ID="Label2" runat="server" Text="Order ID: "></asp:Label> </td>
                    <td> <asp:Label ID="Label40" runat="server" Text="Order ID: "  CssClass="createorderinput" ></asp:Label> </td>
              </tr>
              <tr>
                   <td> <asp:Label ID="Label3" runat="server" Text="Customer : "></asp:Label> </td>
                   <td> <asp:Label ID="Label41" runat="server" Text="Order ID: "  CssClass="createorderinput" ></asp:Label> </td>
              </tr>
                <tr>
                   <td> <asp:Label ID="Label4" runat="server" Text="E-mail Address : "></asp:Label> </td>
                    <td> <asp:Label ID="Label42" runat="server" Text="Order ID: "  CssClass="createorderinput" ></asp:Label> </td>
              </tr>
              <tr>
                   <td> <asp:Label ID="Label5" runat="server" Text="Salesperson : "></asp:Label> </td>
                    <td> <asp:Label ID="Label43" runat="server" Text="Order ID: "  CssClass="createorderinput" ></asp:Label> </td>
              </tr>
              <tr>
                   <td> <asp:Label ID="Label6" runat="server" Text="Order data : "></asp:Label> </td>
                    <td> <asp:Label ID="Label44" runat="server" Text="Order ID: "  CssClass="createorderinput" ></asp:Label> </td>
              </tr>
              <tr>
                   <td> <asp:Label ID="Label7" runat="server" Text="From : "></asp:Label> </td>
                   <td> <asp:Label ID="Label45" runat="server" Text="Order ID: "  CssClass="createorderinput" ></asp:Label> </td>
              </tr>
               <tr>
                   <td> <asp:Label ID="Label8" runat="server" Text="Ship To : "></asp:Label> </td>
                    <td> <asp:Label ID="Label46" runat="server" Text="Order ID: "  CssClass="createorderinput" ></asp:Label> </td>
              </tr>
              <tr>
                   <td> <asp:Label ID="Label1" runat="server" Text="Status : "></asp:Label> </td>
                    <td> <asp:Label ID="Label47" runat="server" Text="Order ID: "  CssClass="createorderinput" ></asp:Label> </td>
              </tr>

          </table>

      </div>


       <%-- store order detail  --%>
      <div id="createorder2" style="width:100%;   margin-bottom: 10%;  margin-left:2%;">
         <div style="background-color:black; font-weight:bold; float:left; width:100%;  border:solid 1px;"><h4 style="color:white; margin-left:15px; font-weight:bold;">Order detail </h4>  </div>
              <div class="col-xs-12" style="background-color:black; color:white; margin:auto; padding:1%;">
                <div class="col-xs-3"><asp:Label ID="Label9" runat="server" Text="Product" style="font-weight:bold"></asp:Label></div>
                <div class="col-xs-2"><asp:Label ID="Label10" runat="server" Text="Qty" style="font-weight:bold"></asp:Label></div>
                <div class="col-xs-2"><asp:Label ID="Label11" runat="server" Text="Unit Price (RM)" style="font-weight:bold"></asp:Label></div>
                <div class="col-xs-2"><asp:Label ID="Label12" runat="server" Text="Discount (%)" style="font-weight:bold"></asp:Label></div>
                <div class="col-xs-2"><asp:Label ID="Label13" runat="server" Text="Sub total (RM)" style="font-weight:bold"></asp:Label></div>
           
            </div>



      </div>
      
         <%-- input  --%>
       <div id="createorder3" style="width:100%;   margin-bottom: 10%;  margin-left:2%;">
        <div class="col-xs-12"  style="width:100%;   border:solid 1px">

            <% 
                List<int> record = (List<int>)this.Session["allorderid"];
                List<string> record1 = (List<string>)this.Session["allpdid"];
                List<int> record2 = (List<int>)this.Session["allqty"];

                List<double> record3 = (List<double>)this.Session["allsellp"];
                List<double> record4 = (List<double>)this.Session["alldisc"];
                List<double> record5 = (List<double>)this.Session["allsubtt"];


                for (int i = 0; i < record.Count(); i++)
                {
                    if (record[i] == (int)this.Session["selected"])
                    {

                        prod1.Text = record1[i].ToString();
                        qty.Text = record2[i].ToString();
                        pri1.Text = string.Format("{0:0.00}", record3[i]);
                        disc1.Text = record4[i].ToString();
                        subt1.Text = string.Format("{0:0.00}", record5[i]);
               %>
            
            
            <div class="col-xs-12"style="width:100%;padding:1%; ">
                
                  <div class="col-xs-3"> <asp:Label ID="prod1" runat="server" Text="Product" style="font-weight:bold">  </asp:Label>     </div>
                  <div class="col-xs-2">  <asp:Label ID="qty" runat="server" Text="Product" style="font-weight:bold">  </asp:Label>    </div>
                  <div class="col-xs-2">  <asp:Label ID="pri1" runat="server" Text="Product" style="font-weight:bold">  </asp:Label>    </div>
                  <div class="col-xs-2">  <asp:Label ID="disc1" runat="server" Text="Product" style="font-weight:bold">  </asp:Label>    </div>
                  <div class="col-xs-2">  <asp:Label ID="subt1" runat="server" Text="Product" style="font-weight:bold">  </asp:Label>    </div>
           
            </div>


               <%} } %>  
           
            
            <%-- Total  --%>
             <div class="col-xs-12"style="width:100%; padding:1%">
                
              <div class="col-xs-3" style="padding:1%">  
                   
                </div>
                <div class="col-xs-2" style="padding:0">  </div>
                <div class="col-xs-2" style="padding:0">  </div>
                <div class="col-xs-2" style="padding:0"> <asp:Label ID="Label14" runat="server" Text="Total (RM)" Font-Bold="true"></asp:Label>  </div>
                <div class="col-xs-2" style="padding:0"> <asp:TextBox ID="totalamount" runat="server"  Enabled="false" CssClass="orderinsert" ></asp:TextBox> </div>
           
                </div>

        </div>
            
           
           <% if ((int)this.Session["changestatus"]==1) { 
               
                %> 
           
           <div>
                <asp:Button ID="Button4" runat="server" Text="Change status" CssClass="changestatus" OnClick="Button4_Click" />             
           </div>
           
             <%}else {  %>  

            <div style="width:100%; padding: 2%; float: right;">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" style="padding:2%">
                     <asp:ListItem Text="delivered" > </asp:ListItem>
                     <asp:ListItem Text="pending"> </asp:ListItem>
                     <asp:ListItem Text="canceled"> </asp:ListItem>
                </asp:RadioButtonList>
           </div>
           
           <div>
                <asp:Button ID="Button2" runat="server" Text="Confirm Change" CssClass="changestatus" OnClick="Button2_Click" />             
                <asp:Button ID="Button3" runat="server" Text="cancel Change" CssClass="changestatus" OnClick="Button3_Click" />             
           </div>

             <%} %>  
      </div>
         
    
     


  </div>




</asp:Content>
    


