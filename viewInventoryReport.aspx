<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewInventoryReport.aspx.cs" Inherits="WebApplication1.viewInventoryReport" %>


   
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
        <div id="inventoryReportMainForm">

             <div>
               <asp:Button ID="Button1" runat="server" Text="< Back" Font-Bold="true" CssClass="backInventoryMenu" OnClick="Button1_Click" />
             </div>

             <div style="text-align:center;">
                <h3 style="text-align:center; font-weight:bold"> Inventory Report </h3>
             </div>
          
            <div style="width:100%;margin-bottom: 10%;margin-top:10px;  " >
                <div class="col-xs-12" style="width:100%; border:solid 1px;background-color:black;color:white;font-weight:bolder " >
                     <div class="col-xs-2" style="float:left;width:5%"><asp:Label ID="lblProductIdHeader" runat="server" style="font-weight:bold;" Text="ID"></asp:Label></div>
                    <div class="col-xs-2" style="float:left;width:17%"><asp:Label ID="lblProductNameHeader" runat="server" style="font-weight:bold;" Text="Name"></asp:Label></div>
                    <div class="col-xs-2" style="float:left;width:11%"><asp:Label ID="lblModelHeader" runat="server" style="font-weight:bold;" Text="MODEL"></asp:Label></div>
                    <div class="col-xs-2" style="float:left;width:11%"><asp:Label ID="lblCategoryHeader" runat="server" style="font-weight:bold;" Text="CATEGORY"></asp:Label></div>
                    <div class="col-xs-2" style="float:left;width:14%"><asp:Label ID="lblManufacturerHeader" runat="server" style="font-weight:bold;" Text="MANUFACTURER"></asp:Label></div>
                    <div class="col-xs-2"  style="float:left;width:14%"><asp:Label ID="lblSupplierHeader" runat="server" style="font-weight:bold;" Text="SUPPLIER"></asp:Label></div>
                    <div class="col-xs-2"  style="float:left;width:11%"><asp:Label ID="lblQuantityHeader" runat="server" style="font-weight:bold;" Text="QUANTITY"></asp:Label></div>
                    <div class="col-xs-2"  style="float:left;width:11%"><asp:Label ID="lblUnitPriceHeader" runat="server" style="font-weight:bold;" Text="PRICE"></asp:Label></div>

                </div>

          
                    <%
                        List<int> record0 = (List<int>)this.Session["allProductId"];
                        List<string> record1 = (List<string>)this.Session["allProductName"];
                        List<string> record2 = (List<string>)this.Session["allModel"];
                        List<string> record3 = (List<string>)this.Session["allCategory"];
                        List<string> record4 = (List<string>)this.Session["allManufacturer"];
                        List<string> record5 = (List<string>)this.Session["allSupplier"];
                        List<int> record6 = (List<int>)this.Session["allQuantity"];
                        List<double> record7 = (List<double>)this.Session["allUnitPrice"];

                        for (int i = 0; i < record0.Count(); i++)
                        {
                            lblProductId.Text = record0[i].ToString();
                            lblProductName.Text = record1[i].ToString();
                            lblProductModel.Text = record2[i].ToString();
                            lblCategory.Text = record3[i].ToString();
                            lblManufacturer.Text = record4[i].ToString();
                            lblSupplier.Text = record5[i].ToString();
                            lblQuantity.Text = record6[i].ToString();
                            lblUnitPrice.Text = string.Format("{0:0.00}",record7[i]);


                     %>
                <a href="modifyProduct.aspx?id=<%=record0[i].ToString() %>" style="color:black;">
                    <div class="col-xs-12"style="width:100%; border:solid 1px; padding:1%;font-weight:bolder" id="productList">
                        <div class="col-xs-2" style="float:left;width:5%"><asp:Label ID="lblProductId" runat="server" ></asp:Label></div>
                         <div class="col-xs-2" style="float:left;width:17%"><asp:Label ID="lblProductName" runat="server" ></asp:Label></div>
                         <div class="col-xs-2" style="float:left;width:11%"><asp:Label ID="lblProductModel" runat="server" ></asp:Label></div>
                         <div class="col-xs-2" style="float:left;width:11%"><asp:Label ID="lblCategory" runat="server" ></asp:Label></div>
                         <div class="col-xs-2" style="float:left;width:14%"><asp:Label ID="lblManufacturer" runat="server" ></asp:Label></div>
                         <div class="col-xs-2" style="float:left;width:14%"><asp:Label ID="lblSupplier" runat="server" ></asp:Label></div>
                         <div class="col-xs-2" style="float:left;width:11%"><asp:Label ID="lblQuantity" runat="server" ></asp:Label></div>
                         <div class="col-xs-2" style="float:left;width:11%"><asp:Label ID="lblUnitPrice" runat="server" ></asp:Label></div>
                    </div>
                         
                     
                </a>
                <%
                    }

                %>
                </div>
            
        </div>
</asp:Content>
