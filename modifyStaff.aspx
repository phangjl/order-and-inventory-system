<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="modifyStaff.aspx.cs" Inherits="WebApplication1.modifyStaff" %>


<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
        <div id="mainstaffbody">
            <div id="header" style="background-color:lightgray">
                <span style="float:left;color:black;margin-left:10px;height:100%" class="glyphicon glyphicon-list-alt"></span><h4 style="color:black;"><b style="margin-left:10px;">STAFF PROFILE</b></h4>
            </div>

            <div style="float:left;margin-top:10px;height:100%;width:100%;">
                <table border="3" style="margin-left: auto;margin-right: auto;">
                    <tr>
                        <td>
                <div id="staffUsername" style="float:left;width:20%;">
                    <asp:Label ID="lblstaffUsername" runat="server" Text="Username" CssClass="specialLabel"></asp:Label>
                </div>
                </td>
                        <td>
                <div id="staffUsernameValue" style="float:left;width:20%;">
                    <asp:TextBox ID="txtusernameValue" runat="server" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" ControlToValidate="txtusernameValue" >*Please fill 
                    </asp:RequiredFieldValidator>
                </div>
                        </td>
                    </tr>
                     <tr>
                         <td>
                <div id="staffName" style="float:left;width:20%;">
                    <asp:Label ID="lblstaffName" runat="server" Text="Name" CssClass="specialLabel"></asp:Label>
                </div>
                         </td>
                         <td>
                <div id="staffNameValue" style="float:left;width:20%;">
                    <asp:TextBox ID="txtnameValue" runat="server" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" ControlToValidate="txtnameValue" >*Please fill in
                    </asp:RequiredFieldValidator>
                </div>
                         </td>
                    </tr>
                     <tr>
                         <td>
                <div id="staffPassword" style="float:left;width:20%;margin-top:20px;">
                    <asp:Label ID="lblstaffPassword" runat="server" Text="Password" CssClass="specialLabel"></asp:Label>
                </div>
                         </td>
                         <td>
                <div id="staffPasswordValue" style="float:left;width:20%;margin-top:20px;">
                    <asp:TextBox ID="txtpasswordValue" runat="server" Type="Password" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" ControlToValidate="txtpasswordValue" >*Please fill in 
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtpasswordValue" ErrorMessage="*Minimum of 8 letters or numbers." ValidationExpression="^[0-9A-Za-z]{8,16}$" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
                         </td>
                    </tr>
                     <tr>
                         <td>
                <div id="staffEmail" style="float:left;width:20%;margin-top:20px;">
                    <asp:Label ID="lblstaffEmail" runat="server" Text="Email Address" CssClass="specialLabel"></asp:Label>
                </div>
                         </td>
                         <td>
                <div id="staffEmailValue" style="float:left;width:20%;margin-top:20px;">
                    <asp:TextBox ID="txtemailValue" runat="server" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" ControlToValidate="txtemailValue" >*Please fill in 
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" style="color:red;clear:both;float:left;width:70%" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmailValue" ErrorMessage="Invalid Email Format">
                   </asp:RegularExpressionValidator>
                </div>
                         </td>
                    </tr>
                     <tr>
                         <td>
                <div id="staffPosition" style="float:left;width:20%;margin-top:20px;">
                    <asp:Label ID="lblstaffPosition" runat="server" Text="Position" CssClass="specialLabel"></asp:Label>
                </div>
                         </td>
                         <td>
                <div id="staffPositionValue" style="float:left;width:30%;margin-top:20px;">
                <asp:DropDownList ID="ddlpositionValue" runat="server"  Enabled="false">
                    <asp:ListItem>Staff</asp:ListItem>
                    <asp:ListItem>Manager</asp:ListItem>
                </asp:DropDownList>
            </div></td>
                    </tr>
                    </table>
                <div style="clear:both;height:100%">
                    <div id="buttonBox1" style="float:left;margin-top:20px;">
                        <asp:Button  id="btnsBack" runat="server" Text="Back" OnClick="btnsBack_Click" CssClass="specialbtn2"/>
                     </div>

                    <div id="buttonBox2" style="float:right;margin-top:20px;">
                        <asp:Button  id="btnsEdit" runat="server" Text="Edit" OnClick="btnsEdit_Click" CssClass="specialbtn2"/>
                        <asp:Button  id="btnsSave" runat="server" Text="Confirm" OnClick="btnsSave_Click" Visible="false"  CssClass="specialbtn2"/>
                        <asp:Button  id="btnsDelete" runat="server" Text="Deactivate" OnClick="btnsDelete_Click" CssClass="specialbtn2" Style="width: 8em/*;background-color:black;height:5vh;margin-top:20px;color:white;*/"/>
                    </div>
                </div>

            </div>


        </div>
</asp:Content>