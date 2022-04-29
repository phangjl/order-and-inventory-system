<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="uploadProduct.aspx.cs" Inherits="WebApplication1.uploadProduct" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
        <div id="uploadProductMainBody" style="margin-left:15px">

            <div id="productName" style="clear:both;float:left;width:30%;margin-top:20px;">
                <asp:Label ID="lblProductName" runat="server" Text="Product Name" CssClass="specialLabel"></asp:Label> 
            </div>

             <div id="productNameValue" style="float:left;width:40%;margin-top:20px;">
                <asp:TextBox ID="txtProductNameValue" runat="server" style="width:70%"></asp:TextBox> 
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" style="color:red;clear:both;float:left;width:70%" ControlToValidate="txtProductNameValue" >*Please fill in product name
                </asp:RequiredFieldValidator>
            </div>



            <div id="category" style="clear:both;float:left;width:30%;margin-top:20px;">
                <asp:Label ID="lblCategory" runat="server" Text="Category" CssClass="specialLabel"></asp:Label> 
            </div>

             <div id="categoryValue" style="float:left;width:40%;margin-top:20px;">
                <asp:DropDownList ID="ddlCategoryValue" runat="server" style="width:70%">
                    <asp:ListItem Selected="True">Shoes</asp:ListItem>
                    <asp:ListItem>Camping Gear</asp:ListItem>
                    <asp:ListItem>Skateboards</asp:ListItem>
                    <asp:ListItem>Skis</asp:ListItem>
                    <asp:ListItem>Scubs</asp:ListItem>
                    <asp:ListItem>Energy</asp:ListItem>
                    <asp:ListItem>Water Bottles</asp:ListItem>
                    <asp:ListItem>Diving Accessories</asp:ListItem>


                </asp:DropDownList>
            </div>


             <div id="location" style="clear:both;float:left;width:30%;margin-top:20px;">
                <asp:Label ID="lblLocation" runat="server" Text="Location" CssClass="specialLabel"></asp:Label> 
            </div>

             <div id="locationValue" style="float:left;width:40%;margin-top:20px;">
                <asp:TextBox ID="txtLocationValue" runat="server" style="width:70%"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" style="color:red;clear:both;float:left;width:70%" ControlToValidate="txtLocationValue" >*Please fill in the location
                </asp:RequiredFieldValidator>
            </div>


             <div id="manufacturer" style="clear:both;float:left;width:30%;margin-top:20px;">
                <asp:Label ID="lblManufacturer" runat="server" Text="Manufacturer" CssClass="specialLabel"></asp:Label> 
            </div>

             <div id="manufacturerValue" style="float:left;width:40%;margin-top:20px;">
                <asp:TextBox ID="txtManufacturerValue" runat="server" style="width:70%"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" style="color:red;clear:both;float:left;width:70%" ControlToValidate="txtmanufacturerValue" >*Please fill in manufacturer
                </asp:RequiredFieldValidator>
            </div>

             <div id="supplier" style="clear:both;float:left;width:30%;margin-top:20px;">
                <asp:Label ID="lblSupplier" runat="server" Text="Supplier" CssClass="specialLabel"></asp:Label> 
            </div>

             <div id="supplierValue" style="float:left;width:40%;margin-top:20px;">
                <asp:TextBox ID="txtSupplierValue" runat="server" style="width:70%"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" style="color:red;clear:both;float:left;width:70%" ControlToValidate="txtSupplierValue" >*Please fill in supplier
                </asp:RequiredFieldValidator>
            </div>

             <div id="model" style="clear:both;float:left;width:30%;margin-top:20px;">
                <asp:Label ID="lblModel" runat="server" Text="Model" CssClass="specialLabel"></asp:Label> 
            </div>

             <div id="modelValue" style="float:left;width:40%;margin-top:20px;">
                <asp:TextBox ID="txtModelValue" runat="server" style="width:70%"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" style="color:red;clear:both;float:left;width:70%" ControlToValidate="txtModelValue" >*Please fill in model
                </asp:RequiredFieldValidator>
            </div>

             <div id="description" style="clear:both;float:left;width:30%;margin-top:20px;">
                <asp:Label ID="lblDescription" runat="server" Text="Description" CssClass="specialLabel"></asp:Label> 
            </div>

             <div id="descriptionValue" style="float:left;width:40%;margin-top:20px;">
                <asp:TextBox ID="txtDescriptionValue" runat="server" Height="60" TextMode="MultiLine" style="width:70%"></asp:TextBox> 
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" style="color:red;clear:both;float:left;width:70%" ControlToValidate="txtDescriptionValue" >*Please fill in the description
                </asp:RequiredFieldValidator>
            </div>


            <div id="comments" style="clear:both;float:left;width:30%;margin-top:20px;">
                <asp:Label ID="lblComments" runat="server" Text="Comments" CssClass="specialLabel"></asp:Label> 
            </div>

             <div id="commentsValue" style="float:left;width:40%;margin-top:20px;">
                <asp:TextBox ID="txtCommentsValue" runat="server" Height="60" TextMode="MultiLine" style="width:70%"></asp:TextBox> 
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" style="color:red;clear:both;float:left;width:70%" ControlToValidate="txtCommentsValue" >*Please fill in comments
                </asp:RequiredFieldValidator>
            </div>


             <div id="transaction" style="clear:both;float:left;width:30%;margin-top:20px;">
                <asp:Label ID="lblTransaction" runat="server" Text="Transaction" CssClass="specialLabel"></asp:Label> 
            </div>

             <div id="transactionValue" style="float:left;width:40%;margin-top:20px;">
                <asp:TextBox ID="txtTransactionValue" runat="server" Type="number" min="0" style="width:70%" ></asp:TextBox> 
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtTransactionValue" style="color:red;clear:both;float:left;width:70%" MinimumValue="0" TYPE="Integer" MaximumValue="100000">*The maximum quantity is 100000</asp:RangeValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" style="color:red;clear:both;float:left;width:70%" ControlToValidate="txtTransactionValue" >*Please fill in quantity value
                </asp:RequiredFieldValidator>
            </div>

             <div id="quantity" style="clear:both;float:left;width:30%;margin-top:15px;">
                <asp:Label ID="lblQuantity" runat="server" Text="Quantity" CssClass="specialLabel"></asp:Label> 
            </div>

             <div id="quantityValue" style="float:left;width:40%;margin-top:15px;">
                <asp:TextBox ID="txtQuantityValue" runat="server" style="width:70%" Type="number" min="1"></asp:TextBox> 
                 <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtQuantityValue" style="color:red;clear:both;float:left;;width:70%" MinimumValue="1" TYPE="Integer" MaximumValue="1000" >*The maximum quantity is 1000</asp:RangeValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" style="color:red;clear:both;float:left;width:70%" ControlToValidate="txtQuantityValue" >*Please fill in quantity value
                </asp:RequiredFieldValidator>
            </div>

             <div id="unitPrice" style="clear:both;float:left;width:30%;margin-top:15px;">
                <asp:Label ID="lblUnitPrice" runat="server" Text="Unit Price" CssClass="specialLabel"></asp:Label> 
            </div>

             <div id="unitPriceValue" style="float:left;width:40%;margin-top:15px;">
                <asp:TextBox ID="txtUnitPrice" runat="server" style="width:70%" Type="number"></asp:TextBox> 
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" style="color:red;clear:both;float:left;width:70%" ControlToValidate="txtUnitPrice" >*Please fill in unit price
                </asp:RequiredFieldValidator>
            </div>

             <div id="reorderLevel" style="clear:both;float:left;width:30%;margin-top:20px;">
                <asp:Label ID="lblReorderLevel" runat="server" Text="Reorder Level" CssClass="specialLabel"></asp:Label> 
            </div>

             <div id="reorderLevelValue" style="float:left;width:40%;margin-top:20px;">
                <asp:TextBox ID="txtReorderLevelValue" runat="server" style="width:70%" Type="number" min="1"></asp:TextBox> 
                <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtReorderLevelValue" style="color:red;clear:both;float:left;width:70%" MinimumValue="200" TYPE="Integer" MaximumValue="500" >*Minimum value is 200 and maximum value is 500</asp:RangeValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" style="color:red;clear:both;float:left;width:70%" ControlToValidate="txtReorderLevelValue" >*Please fill in reorder level value
                </asp:RequiredFieldValidator>
            </div>

             <div id="targetStockLevel" style="clear:both;float:left;width:30%;margin-top:15px;">
                <asp:Label ID="lblTargetStockLevel" runat="server" Text="Target Stock Level" CssClass="specialLabel"></asp:Label> 
            </div>

             <div id="targetStockLevelValue" style="float:left;width:40%;margin-top:15px;">
                <asp:TextBox ID="txtTargetStockLevelValue" runat="server" style="width:70%" Type="number" min="1" ></asp:TextBox> 
                 <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="txtTargetStockLevelValue" style="color:red;clear:both;float:left;;width:70%" MinimumValue="500" TYPE="Integer" MaximumValue="1000" >*Minimum value is 500 and maximum value is 1000</asp:RangeValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" style="color:red;clear:both;float:left;width:70%" ControlToValidate="txtTargetStockLevelValue" >*Please fill in target stock level
                </asp:RequiredFieldValidator>
            </div>

             <div id="discontinued" style="clear:both;float:left;width:30%;margin-top:15px;">
                <asp:Label ID="lblDiscontinued" runat="server" Text="Discontinued" CssClass="specialLabel"></asp:Label> 
            </div>

             <div id="discontinuedValue" style="float:left;width:40%;margin-top:15px;">
                <asp:TextBox ID="txtDiscountinuedValue" runat="server" style="width:70%"></asp:TextBox> 
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" style="color:red;clear:both;float:left;width:70%" ControlToValidate="txtDiscountinuedValue" >*Please fill in discontinued value
                </asp:RequiredFieldValidator>

            </div>

            <div style="clear:both;margin-top:30px;width:58.5%;margin-bottom:15px;height:100%">
                <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="specialbtn" OnClick="btnBack_Click" style="float:left" ValidationGroup="undo"/>
                <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="specialbtn" OnClick="btnUpload_Click" style="margin-left:15px;float:right"/>
            </div>
        </div>
    </asp:Content>