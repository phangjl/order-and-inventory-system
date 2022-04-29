<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="modifyProduct.aspx.cs" Inherits="WebApplication1.modifyProduct" %>


<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
        <div id="mainbody">
            <div id="header" style="background-color:lightgray">
                <span style="float:left;color:black;margin-left:10px;height:100%" class="glyphicon glyphicon-list-alt"></span><h4 style="color:black;"><b style="margin-left:10px;">ITEM</b></h4>
            </div>

            <div style="float:left;margin-top:10px;height:100%;width:100%;">

                <div id="productName" style="float:left;width:30%;">
                    <asp:Label ID="lblProductName" runat="server" Text="Product Name" CssClass="specialLabel"></asp:Label>
                </div>

                <div id="productNameValue" style="float:left;width:30%;">
                    <asp:TextBox ID="txtProductNameValue" runat="server" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" ControlToValidate="txtProductNameValue" >*Please fill in product name
                    </asp:RequiredFieldValidator>
                </div>


                <div id="reorderLevel" style="float:left;width:20%;">
                    <asp:Label ID="lblReorderLevel" runat="server" Text="Reorder Level" CssClass="specialLabel"></asp:Label>
                </div>

                <div id="reorderLevelValue" style="float:left;width:20%;">
                    <asp:TextBox ID="txtReorderLevelValue" runat="server" Enabled="False" Type="number" min="1"></asp:TextBox>
                     <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtReorderLevelValue" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" MinimumValue="200" TYPE="Integer" MaximumValue="500" >*Minimum value is 200 and maximum value is 500</asp:RangeValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" ControlToValidate="txtReorderLevelValue" >*Please fill in reorder level value
                    </asp:RequiredFieldValidator>
                </div>



                 <div id="category" style="float:left;width:30%;margin-top:20px;">
                    <asp:Label ID="lblCategory" runat="server" Text="Category" CssClass="specialLabel"></asp:Label>
                </div>

                <div id="categoryValue" style="float:left;width:30%;margin-top:20px;">
                <asp:DropDownList ID="ddlCategoryValue" runat="server" style="width:30%" Enabled="false">
                    <asp:ListItem>Shoes</asp:ListItem>
                    <asp:ListItem>Camping Gear</asp:ListItem>
                    <asp:ListItem>Skateboards</asp:ListItem>
                    <asp:ListItem>Skis</asp:ListItem>
                    <asp:ListItem>Scubs</asp:ListItem>
                    <asp:ListItem>Energy</asp:ListItem>
                    <asp:ListItem>Water Bottles</asp:ListItem>
                    <asp:ListItem>Diving Accessories</asp:ListItem>


                </asp:DropDownList>
            </div>

                <div id="targetStockLevel" style="float:left;width:20%;margin-top:20px;">
                    <asp:Label ID="lblTargetStockLevel" runat="server" Text="Target Stock Level" CssClass="specialLabel"></asp:Label>
                </div>

                <div id="targetStockLevelValue" style="float:left;width:20%;margin-top:20px;">
                    <asp:TextBox ID="txtTargetStockLevelValue" runat="server" Enabled="False" Type="number" min="1"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtTargetStockLevelValue" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" MinimumValue="500" TYPE="Integer" MaximumValue="1000" >*Minimum value is 500 and maximum value is 1000</asp:RangeValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" ControlToValidate="txtTargetStockLevelValue" >*Please fill in target stock level
                    </asp:RequiredFieldValidator>
                </div>


                <div id="location" style="float:left;width:30%;margin-top:20px;">
                    <asp:Label ID="lblLocation" runat="server" Text="Location" CssClass="specialLabel"></asp:Label>
                </div>

                <div id="locationValue" style="float:left;width:30%;margin-top:20px;">
                    <asp:TextBox ID="txtLocationValue" runat="server" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" ControlToValidate="txtLocationValue" >*Please fill in the location
                    </asp:RequiredFieldValidator>
                </div>


                <div id="discontinued" style="float:left;width:20%;margin-top:20px;">
                    <asp:Label ID="lblDiscontinued" runat="server" Text="Discontinued" CssClass="specialLabel"></asp:Label>
                </div>

                <div id="discontinuedValue" style="float:left;width:20%;margin-top:20px;">
                    <asp:TextBox ID="txtDiscontinuedValue" runat="server" Enabled="False"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" ControlToValidate="txtDiscontinuedValue" >*Please fill in discontinued value
                    </asp:RequiredFieldValidator>
                </div>


                 <div id="manufacturerBox" style="clear:both;">

                    <div id="manufacturer" style="float:left;width:30%;margin-top:20px;">
                        <asp:Label ID="lblManufacturer" runat="server" Text="Manufacturer" CssClass="specialLabel"></asp:Label>
                     </div>

                    <div id="manufacturerValue" style="float:left;width:30%;margin-top:20px;">
                        <asp:TextBox ID="txtManufacturerValue" runat="server" Enabled="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" ControlToValidate="txtManufacturerValue" >*Please fill in manufacturer
                        </asp:RequiredFieldValidator>
                    </div>
                </div>


                <div id="supplierBox" style="clear:both;">

                    <div id="supplier" style="float:left;width:30%;margin-top:20px;">
                        <asp:Label ID="lblSupplier" runat="server" Text="Supplier" CssClass="specialLabel"></asp:Label>
                     </div>

                    <div id="supplierValue" style="float:left;width:30%;margin-top:20px;">
                        <asp:TextBox ID="txtSupplierValue" runat="server" Enabled="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" ControlToValidate="txtSupplierValue" >*Please fill in supplier
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                

                <div id="modelBox" style="clear:both;">

                    <div id="model" style="float:left;width:30%;margin-top:20px;">
                        <asp:Label ID="lblModel" runat="server" Text="Model" CssClass="specialLabel"></asp:Label>
                     </div>

                    <div id="modelValue" style="float:left;width:30%;margin-top:20px;">
                        <asp:TextBox ID="txtModelValue" runat="server" Enabled="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" ControlToValidate="txtModelValue" >*Please fill in model
                        </asp:RequiredFieldValidator>
                    </div>
                </div>

                <div id="idBox" style="clear:both;">

                    <div id="id" style="float:left;width:30%;margin-top:20px;">
                        <asp:Label ID="lblId" runat="server" Text="Id" CssClass="specialLabel"></asp:Label>
                     </div>

                    <div id="idValue" style="float:left;width:30%;margin-top:20px;">
                        <asp:TextBox ID="txtIdValue" runat="server" Enabled="False"></asp:TextBox>
                    </div>
                </div>

               
                 <div id="descriptionBox" style="clear:both;">

                    <div id="description" style="float:left;width:30%;margin-top:20px;">
                        <asp:Label ID="lblDescription" runat="server" Text="Description" CssClass="specialLabel"></asp:Label>
                     </div>

                    <div id="descriptionValue" style="float:left;width:30%;margin-top:20px;">
                        <asp:TextBox ID="txtDescriptionValue" runat="server" Height="60" style="width:100%;" Enabled="False" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" ControlToValidate="txtDescriptionValue" >*Please fill in the description
                        </asp:RequiredFieldValidator>
                    </div>
                </div>


                 <div id="commentsBox" style="clear:both;">

                    <div id="comments" style="float:left;width:30%;margin-top:20px">
                        <asp:Label ID="lblComments" runat="server" Text="Comments" CssClass="specialLabel"></asp:Label>
                     </div>

                    <div id="commentsValue" style="float:left;width:30%;margin-top:20px;">
                        <asp:TextBox ID="txtCommentsValue" runat="server" Height="60" style="width:100%;" Enabled="False" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" ControlToValidate="txtCommentsValue" >*Please fill in the comments
                        </asp:RequiredFieldValidator>
                    </div>
                </div>

                <div id="transactionBox" style="clear:both;">

                    <div id="transcation" style="float:left;width:30%;margin-top:20px;">
                        <asp:Label ID="lblTransaction" runat="server" Text="Transaction" CssClass="specialLabel"></asp:Label>
                     </div>

                    <div id="transactionValue" style="float:left;width:30%;margin-top:20px;">
                        <asp:TextBox ID="txtTransactionValue" runat="server" Enabled="False" Type="number" min="1"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtTransactionValue" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" MinimumValue="0" TYPE="Integer" MaximumValue="100000" >*Maximum quantity is 100000</asp:RangeValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" ControlToValidate="txtTransactionValue" >*Please fill in transaction 
                        </asp:RequiredFieldValidator>
                    </div>
                </div>

                <div id="currentStockBox" style="clear:both;">

                    <div id="currentStock" style="float:left;width:30%;margin-top:20px;">
                        <asp:Label ID="lblCurrentStock" runat="server" Text="Current Stock" CssClass="specialLabel"></asp:Label>
                     </div>

                    <div id="currentStockValue" style="float:left;width:30%;margin-top:20px;">
                        <asp:TextBox ID="txtCurrentStockValue" runat="server" Enabled="False" Type="number" min="1"></asp:TextBox>
                         <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="txtCurrentStockValue" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" MinimumValue="0" TYPE="Integer" MaximumValue="1000" >*Maximum quantity is 1000</asp:RangeValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" ControlToValidate="txtCurrentStockValue" >*Please fill in current stock value
                        </asp:RequiredFieldValidator>
                    </div>
                </div>

                <div style="clear:both;height:100%">
                    <div id="buttonBox1" style="float:left;margin-top:20px;">
                        <asp:Button  id="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="specialbtn2"/>
                     </div>

                    <div id="buttonBox2" style="float:right;margin-top:20px;">
                        <asp:Button  id="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" CssClass="specialbtn2"/>
                        <asp:Button  id="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Visible="false"  CssClass="specialbtn2"/>
                        <asp:Button  id="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" CssClass="specialbtn2"/>
                    </div>
                </div>
                


                

            </div>


        </div>
</asp:Content>