
<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="createorder.aspx.cs" Inherits="WebApplication1.createorder" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
  <div id="createorder">
      <div>
           <asp:Button ID="Button1" runat="server" Text="< Back" Font-Bold="true" CssClass="backordermenu" OnClick="Button1_Click" />
      </div>

      <div style="text-align:center;">
         <h3 style="text-align:center; font-weight:bold"> Create Customer Order </h3>
      </div>


        <%-- store customer and salespsersion info  --%>
      <div id="createorder1" style="float:left; width:100%;  border:solid 1px; padding:1%; margin-bottom: 5%; margin-left:2%;">
          <table  class="createordertable">
              <tr>
                   <td> <asp:Label ID="Label1" runat="server" Text="Order ID: "></asp:Label> </td>
                   <td> <asp:TextBox ID="txtordid" runat="server" CssClass="createorderinput" Enabled="false" ></asp:TextBox>
                   </td>
              </tr>
              <tr>
                   <td> <asp:Label ID="Label3" runat="server" Text="Customer : "></asp:Label> </td>
                   <td> <asp:DropDownList ID="drpcus" runat="server" CssClass="createorderinput" AutoPostBack="True" OnSelectedIndexChanged="drpcus_SelectedIndexChanged" >
                       <asp:ListItem>none</asp:ListItem>
                        </asp:DropDownList> </td>
              </tr>
                <tr>
                   <td> <asp:Label ID="Label4" runat="server" Text="E-mail Address : "></asp:Label> </td>
                   <td> <asp:TextBox ID="txtemail" runat="server" CssClass="createorderinput" Enabled="false" ></asp:TextBox> </td>
              </tr>
              <tr>
                   <td> <asp:Label ID="Label5" runat="server" Text="Salesperson : "></asp:Label> </td>
                   <td> <asp:TextBox ID="txtsaleperson" runat="server" CssClass="createorderinput" ></asp:TextBox> </td>
              </tr>
              <tr>
                   <td> <asp:Label ID="Label6" runat="server" Text="Order data : "></asp:Label> </td>
                   <td> <asp:TextBox ID="txtdate" runat="server" placeholder="yyyy-mm-dd" CssClass="createorderinput"></asp:TextBox> </td>
              </tr>
              <tr>
                   <td> <asp:Label ID="Label7" runat="server" Text="From : "></asp:Label> </td>
                   <td> <asp:TextBox ID="txtfrom" runat="server" CssClass="createorderinput" ></asp:TextBox> </td>
              </tr>
               <tr>
                   <td> <asp:Label ID="Label8" runat="server" Text="Ship To : "></asp:Label> </td>
                   <td> <asp:TextBox ID="txtto" runat="server" CssClass="createorderinput"  ></asp:TextBox> </td>
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

             <div class="col-xs-12"style="width:100%; ">
                
                <div class="col-xs-3" style="padding:0">  
                    <asp:DropDownList ID="DropDownList1" runat="server"  CssClass="orderinsert1">
                       
                    </asp:DropDownList>
                </div>

                <div class="col-xs-2" style="padding:0"> <asp:TextBox ID="qty1" runat="server" TextMode="Number" min="1" CssClass="orderinsert" OnTextChanged="dics1_TextChanged" AutoPostBack="true"></asp:TextBox>     </div>
                <div class="col-xs-2" style="padding:0"> <asp:TextBox ID="price1" runat="server" TextMode="Number" step="0.01" min="0"  CssClass="orderinsert" OnTextChanged="dics1_TextChanged" AutoPostBack="true" ></asp:TextBox> </div>
                <div class="col-xs-2" style="padding:0"> <asp:TextBox ID="dics1" runat="server" TextMode="Number" step="1" min="0" max ="100"  CssClass="orderinsert" OnTextChanged="dics1_TextChanged" AutoPostBack="true" ></asp:TextBox> </div>
                <div class="col-xs-2" style="padding:0"> <asp:TextBox ID="subtotal1" runat="server"  CssClass="orderinsert"  Enabled="false" ></asp:TextBox> </div>
           
            </div>
           <%  if ((int)this.Session["noOfprocd"]>=2)       { %>
               <%-- add product 2  --%>
             <div class="col-xs-12"style="width:100%; ">
                
              <div class="col-xs-3" style="padding:0">  
                    <asp:DropDownList ID="DropDownList2" runat="server"  CssClass="orderinsert1">
                        
                    </asp:DropDownList>
                </div>
               <div class="col-xs-2" style="padding:0"> <asp:TextBox ID="qty2" runat="server" TextMode="Number" min="1" CssClass="orderinsert" OnTextChanged="dics2_TextChanged" AutoPostBack="true"></asp:TextBox>     </div>
                <div class="col-xs-2" style="padding:0"> <asp:TextBox ID="price2" runat="server" TextMode="Number" step="0.01" min="0"  CssClass="orderinsert" OnTextChanged="dics2_TextChanged" AutoPostBack="true" ></asp:TextBox> </div>
                <div class="col-xs-2" style="padding:0"> <asp:TextBox ID="dics2" runat="server" TextMode="Number" step="1" min="0" max ="100"  CssClass="orderinsert" OnTextChanged="dics2_TextChanged" AutoPostBack="true" ></asp:TextBox> </div>
                <div class="col-xs-2" style="padding:0"> <asp:TextBox ID="subtotal2" runat="server"  CssClass="orderinsert"  Enabled="false" ></asp:TextBox> </div>
           
            </div>
                 <% } %>  
           
            <%  if ((int)this.Session["noOfprocd"]>=3)       { %>
            <%-- add product 3  --%>
             <div class="col-xs-12"style="width:100%; ">
                
              <div class="col-xs-3" style="padding:0">  
                    <asp:DropDownList ID="DropDownList3" runat="server"  CssClass="orderinsert1">
                       
                    </asp:DropDownList>
                </div>
                 <div class="col-xs-2" style="padding:0"> <asp:TextBox ID="qty3" runat="server" TextMode="Number" min="1" CssClass="orderinsert" OnTextChanged="dics3_TextChanged" AutoPostBack="true"></asp:TextBox>     </div>
                <div class="col-xs-2" style="padding:0"> <asp:TextBox ID="price3" runat="server" TextMode="Number" step="0.01" min="0"  CssClass="orderinsert" OnTextChanged="dics3_TextChanged" AutoPostBack="true" ></asp:TextBox> </div>
                <div class="col-xs-2" style="padding:0"> <asp:TextBox ID="dics3" runat="server" TextMode="Number" step="1" min="0" max ="100"  CssClass="orderinsert" OnTextChanged="dics3_TextChanged" AutoPostBack="true" ></asp:TextBox> </div>
                <div class="col-xs-2" style="padding:0"> <asp:TextBox ID="subtotal3" runat="server"  CssClass="orderinsert"  Enabled="false" ></asp:TextBox> </div>
           

            </div>
              <% } %>    
            
             <%  if ((int)this.Session["noOfprocd"]>=4)       { %>
            <%-- add product 4  --%>
             <div class="col-xs-12"style="width:100%; ">
                
              <div class="col-xs-3" style="padding:0">  
                    <asp:DropDownList ID="DropDownList4" runat="server"  CssClass="orderinsert1">
                         
                    </asp:DropDownList>
                </div>

                <div class="col-xs-2" style="padding:0"> <asp:TextBox ID="qty4" runat="server" TextMode="Number" min="1" CssClass="orderinsert" OnTextChanged="dics4_TextChanged" AutoPostBack="true"></asp:TextBox>     </div>
                <div class="col-xs-2" style="padding:0"> <asp:TextBox ID="price4" runat="server" TextMode="Number" step="0.01" min="0"  CssClass="orderinsert" OnTextChanged="dics4_TextChanged" AutoPostBack="true" ></asp:TextBox> </div>
                <div class="col-xs-2" style="padding:0"> <asp:TextBox ID="dics4" runat="server" TextMode="Number" step="1" min="0" max ="100"  CssClass="orderinsert" OnTextChanged="dics4_TextChanged" AutoPostBack="true" ></asp:TextBox> </div>
                <div class="col-xs-2" style="padding:0"> <asp:TextBox ID="subtotal4" runat="server"  CssClass="orderinsert"  Enabled="false" ></asp:TextBox> </div>
           

            </div>
               <% } %>    
            
             <%  if ((int)this.Session["noOfprocd"]>=5)       { %>
            <%-- add product 5  --%>
             <div class="col-xs-12"style="width:100%; ">
                
              <div class="col-xs-3" style="padding:0">  
                    <asp:DropDownList ID="DropDownList5" runat="server"  CssClass="orderinsert1">
                        
                    </asp:DropDownList>
                </div>
                <div class="col-xs-2" style="padding:0"> <asp:TextBox ID="qty5" runat="server" TextMode="Number" min="1" CssClass="orderinsert" OnTextChanged="dics5_TextChanged" AutoPostBack="true"></asp:TextBox>     </div>
                <div class="col-xs-2" style="padding:0"> <asp:TextBox ID="price5" runat="server" TextMode="Number" step="0.01" min="0"  CssClass="orderinsert" OnTextChanged="dics5_TextChanged" AutoPostBack="true" ></asp:TextBox> </div>
                <div class="col-xs-2" style="padding:0"> <asp:TextBox ID="dics5" runat="server" TextMode="Number" step="1" min="0" max ="100"  CssClass="orderinsert" OnTextChanged="dics5_TextChanged" AutoPostBack="true" ></asp:TextBox> </div>
                <div class="col-xs-2" style="padding:0"> <asp:TextBox ID="subtotal5" runat="server"  CssClass="orderinsert"  Enabled="false" ></asp:TextBox> </div>
           
            </div>
                 <% } %> 
            
            <%-- Total  --%>
             <div class="col-xs-12"style="width:100%; ">
                
              <div class="col-xs-3" style="padding:0">  
                   
                </div>
                <div class="col-xs-2" style="padding:0">     </div>
                <div class="col-xs-2" style="padding:0">  </div>
                <div class="col-xs-2" style="padding:0"> <asp:Label ID="Label14" runat="server" Text="Total (RM)" Font-Bold="true"></asp:Label>  </div>
                <div class="col-xs-2" style="padding:0"> <asp:TextBox ID="totalamount" runat="server"  Enabled="false" CssClass="orderinsert" ></asp:TextBox> </div>
           
            </div>

        </div>
          
           <div>
               <asp:Button ID="Button2" runat="server" Text="+ Product" CssClass="addproduct" OnClick="Button2_Click"/>
              <asp:Button ID="Button5" runat="server" Text="- Product" CssClass="addproduct" OnClick="Button5_Click"/>


                 <asp:Button ID="Button4" runat="server" Text="Complete Order & generate PDF" CssClass="addproduct1" OnClick="Button4_Click"/>
                <asp:Button ID="Button3" runat="server" Text=" Complete Order" CssClass="addproduct1" OnClick="Button3_Click" />
              
           </div>
           

      </div>
         
    
     


  </div>



</asp:Content>

