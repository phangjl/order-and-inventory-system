<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewcancelorder.aspx.cs" Inherits="WebApplication1.viewcancelorder" %>


<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
  <div id="vieworder2">
      <div>
           <asp:Button ID="Button1" runat="server" Text="< Back" Font-Bold="true" CssClass="backordermenu"  OnClick="Button1_Click"/>
      </div>

      <div style="text-align:center;">
         <h3 style="text-align:center; font-weight:bold"> Canceled Order list </h3>
      </div>

      <div style=" width:100%;   margin-bottom: 10%; ">
    
           <div class="col-xs-12" style="width:100%;   margin-bottom: 10%;  " >
                    <div class="col-xs-12" style="background-color:black; color:white; margin:auto; padding:1%;">
                        <div class="col-xs-2"><asp:Label ID="Label3" runat="server" Text="Order ID" style="font-weight:bold"></asp:Label></div>
                        <div class="col-xs-2"><asp:Label ID="Label4" runat="server" Text="Order Date" style="font-weight:bold"></asp:Label></div>
                        <div class="col-xs-2"><asp:Label ID="Label2" runat="server" Text="Customer" style="font-weight:bold"></asp:Label></div>
                        <div class="col-xs-2"><asp:Label ID="Label6" runat="server" Text="Salerpersion" style="font-weight:bold"></asp:Label></div>
                        <div class="col-xs-2"><asp:Label ID="Label5" runat="server" Text="Total Price" style="font-weight:bold"></asp:Label></div>
                        <div class="col-xs-2"><asp:Label ID="Label1" runat="server" Text="Order Status" style="font-weight:bold"></asp:Label></div>
                    </div>


                  <% 

                      List<int> record = (List<int>)this.Session["allid1"];
                      List<Cassandra.LocalDate> record1 = (List<Cassandra.LocalDate>)this.Session["alldate1"];
                      List<string> record2 = (List<string>)this.Session["allcust1"];
                      List<string> record3 = (List<string>)this.Session["allstaff1"];
                      List<double> record4 = (List<double>)this.Session["allprice1"];
                      List<string> record5 = (List<string>)this.Session["allstatus1"];

                      for (int i = 0; i < record.Count(); i++)
                      {
                          if (record5[i].Equals("canceled"))
                          {
                              orderid.Text = record[i].ToString();
                              date.Text = record1[i].ToString();
                              cust.Text = record2[i].ToString();
                              staff.Text = record3[i].ToString();
                              price.Text = string.Format("{0:0.00}", record4[i]);
                              status.Text = record5[i].ToString();



               %>
               <a href="viewcancelorderdetail.aspx?id=<%= record[i].ToString()%>" style="color:black;" >
                      <div class="col-xs-12"style="width:100%; border:solid 1px; padding:1%;" id="vieworderlist1"> 
                
                            <div class="col-xs-2"><asp:Label ID="orderid" runat="server" style="font-weight:bold" Text="order id"></asp:Label></div>
                            <div class="col-xs-2"><asp:Label ID="date" runat="server" Text="Order Date" style="font-weight:bold"></asp:Label></div>
                            <div class="col-xs-2"><asp:Label ID="cust" runat="server" Text="Customer" style="font-weight:bold"></asp:Label></div>
                            <div class="col-xs-2"><asp:Label ID="staff" runat="server" Text="Salerpersion" style="font-weight:bold"></asp:Label></div>
                            <div class="col-xs-2"><asp:Label ID="price" runat="server" Text="Total Price" style="font-weight:bold"></asp:Label></div>
                            <div class="col-xs-2"><asp:Label ID="status" runat="server" Text="Order Status" style="font-weight:bold; color:red;"></asp:Label></div>
                       </div>
               </a>
                  <%   }  }               %>
           </div>
        
     

      </div>


  </div>



</asp:Content>
