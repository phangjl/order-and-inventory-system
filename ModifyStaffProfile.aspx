<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site1.Master" CodeBehind="ModifyStaffProfile.aspx.cs" Inherits="WebApplication1.ModifyStaffProfile" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
          <div style=""><h3 style="text-align: center;font-weight: bold;">Staff Edit</h3>  </div>
    <div id="mainstaffbody"  style="border:1.5px solid black; padding:2%; margin:1%; height:500px">

 <%--username--%>
                <div id="staffUsername" style="clear:both;float:left;width:30%;margin-top:20px;">
                    <asp:Label ID="lblstaffUsername" runat="server" Text="Username" CssClass="specialLabel"></asp:Label>
                </div>

                <div id="staffUsernameValue" style="float:left;width:40%;margin-top:20px;">
                    <asp:TextBox ID="txtusernameValue" runat="server" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" ControlToValidate="txtusernameValue" >*Please fill 
                    </asp:RequiredFieldValidator>
                </div>

<%--name--%>
                <div id="staffName" style="clear:both;float:left;width:30%;margin-top:20px;">
                    <asp:Label ID="lblstaffName" runat="server" Text="Name" CssClass="specialLabel"></asp:Label>
                </div>

                <div id="staffNameValue" style="float:left;width:40%;margin-top:20px;">
                    <asp:TextBox ID="txtnameValue" runat="server" Enabled="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" ControlToValidate="txtnameValue" >*Please fill in
                    </asp:RequiredFieldValidator>
                </div>

<%--password--%>
                <div id="staffPassword" style="clear:both;float:left;width:30%;margin-top:20px;">
                    <asp:Label ID="lblstaffPassword" runat="server" Text="Password" CssClass="specialLabel"></asp:Label>
                </div>

                <div id="staffPasswordValue" style="float:left;width:40%;margin-top:20px;">
                    <asp:TextBox ID="txtpasswordValue" runat="server" Type="Password" Enabled="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" ControlToValidate="txtpasswordValue" >*Please fill in 
                    </asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="revPassword" runat="server" Type="Password" ControlToValidate="txtpasswordValue" ErrorMessage="*Minimum of 8 letters or numbers." ValidationExpression="^[0-9A-Za-z]{8,16}$" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>

<%--email--%>
                <div id="staffEmail" style="clear:both;float:left;width:30%;margin-top:20px;">
                    <asp:Label ID="lblstaffEmail" runat="server" Text="Email Adress" CssClass="specialLabel"></asp:Label>
                </div>

                <div id="staffEmailValue"  style="float:left;width:40%;margin-top:20px;">
                    <asp:TextBox ID="txtemailValue" runat="server" Enabled="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" style="color:red;clear:both;float:left;width:100%;font-size:x-small;" ControlToValidate="txtemailValue" >*Please fill in 
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" style="color:red;clear:both;float:left;width:70%" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmailValue" ErrorMessage="Invalid Email Format">
                   </asp:RegularExpressionValidator>
                </div>


        </div>
     <div style="clear:both;height:100%">
                    <div id="buttonBox1" style="float:left;margin-top:20px;">
                        <asp:Button  id="btnsBack" runat="server" Text="Back" OnClick="btnsBack_Click" CssClass="specialbtn2"/>
                     </div>

                    <div id="buttonBox2" style="float:right;margin-top:20px;">
                        <asp:Button  id="btnsSave" runat="server" Text="Save" OnClick="btnsSave_Click"  CssClass="specialbtn2"/>
                    </div>
                </div>
    </asp:Content>