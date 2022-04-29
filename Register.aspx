<%@ Page Language="C#" MasterPageFile="~/Site1.Master" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register" %>


<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
        <div style=""><h3 style="text-align: center;font-weight: bold;">Staff Register</h3>  </div>
    
    <div id="RegisterBody" style="border:1.5px solid black; padding:2%; margin:1%; height:500px">
 <%--username--%>
          <div id="username" style="clear:both;float:left;width:30%;margin-top:20px;">
                <asp:Label ID="lblUserName" runat="server" Text="UserName: " CssClass="specialLabel"></asp:Label> 
            </div>

             <div id="userNameValue" style="float:left;width:40%;margin-top:20px;">
                <asp:TextBox ID="txtUserNameValue" runat="server" style="width:70%"></asp:TextBox> 
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" style="color:red;clear:both;float:left;width:70%" ControlToValidate="txtUserNameValue" >*Please fill in the user name
                </asp:RequiredFieldValidator>
            </div>

<%--email--%>
          <div id="email" style="clear:both;float:left;width:30%;margin-top:20px;">
                <asp:Label ID="lblemail" runat="server" Text="Email: " CssClass="specialLabel"></asp:Label> 
            </div>

             <div id="emailValue" style="float:left;width:40%;margin-top:20px;">
                <asp:TextBox ID="txtEmailValue" runat="server" style="width:70%"></asp:TextBox> 
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" style="color:red;clear:both;float:left;width:70%" ControlToValidate="txtEmailValue" >*Please fill in the Email
                </asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" style="color:red;clear:both;float:left;width:70%" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmailValue" ErrorMessage="Invalid Email Format">
                   </asp:RegularExpressionValidator>
            </div>
      

<%--name--%>
            <div id="name" style="clear:both;float:left;width:30%;margin-top:20px;">
                <asp:Label ID="lblName" runat="server" Text="Name: " CssClass="specialLabel"></asp:Label> 
            </div>

             <div id="nameValue" style="float:left;width:40%;margin-top:20px;">
                <asp:TextBox ID="txtNameValue" runat="server" style="width:70%"></asp:TextBox> 
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" style="color:red;clear:both;float:left;width:70%" ControlToValidate="txtNameValue" >*Please fill in the name
                </asp:RequiredFieldValidator>
            </div>

<%--password--%>
          <div id="password" style="clear:both;float:left;width:30%;margin-top:20px;">
                <asp:Label ID="lblPassword" runat="server" Text="Password: " CssClass="specialLabel"></asp:Label> 
            </div>

             <div id="passwordValue" style="float:left;width:40%;margin-top:20px;">
                <asp:TextBox ID="txtPasswordValue" TextMode="Password" runat="server" style="width:70%"></asp:TextBox> 
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" style="color:red;clear:both;float:left;width:70%" ControlToValidate="txtPasswordValue" >*Please fill in the password
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPasswordValue" ErrorMessage="*Minimum of 8 letters or numbers." ValidationExpression="^[0-9A-Za-z]{8,16}$" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>

<%--confirm password--%>
          <div id="confirmPassword" style="clear:both;float:left;width:30%;margin-top:20px;">
                <asp:Label ID="lblconfrimPass" runat="server" Text="Confrim Password: " CssClass="specialLabel"></asp:Label> 
            </div>

             <div id="confirmPassValue" style="float:left;width:40%;margin-top:20px;">
                <asp:TextBox ID="txtconfirmPassValue" TextMode="Password" runat="server" style="width:70%"></asp:TextBox> 
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" style="color:red;clear:both;float:left;width:70%" ControlToValidate="txtconfirmPassValue" >*Please fill in the confirm password
                </asp:RequiredFieldValidator>
                 
       <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtconfirmPassValue" style="color:red;clear:both;float:left;width:70%" CssClass="ValidationError" Display="Dynamic"  ControlToCompare="txtPasswordValue" Text="Password and Confirm Password is not match" ForeColor="Red"></asp:CompareValidator>
                    <asp:Label ID="msg" runat="server" Text="" ForeColor="Red" ></asp:Label>
            </div>


<%--position--%>
         <div id="position" style="clear:both;float:left;width:30%;margin-top:20px;">
                <asp:Label ID="lblPosition" runat="server" Text="Category" CssClass="specialLabel"></asp:Label> 
            </div>

             <div id="positionValue" style="float:left;width:40%;margin-top:20px;">
                <asp:DropDownList ID="ddlpositionValue" runat="server" style="width:70%">
                    <asp:ListItem Selected="True">Staff</asp:ListItem>
                    <asp:ListItem>Manager</asp:ListItem>
                </asp:DropDownList>
            </div>


        </div>
             <div id="buttonCategory" style="text-align:center">                 

        <asp:Button ID="Button1" runat="server" Text="Confrim" Font-Bold="true" OnClick="Confirm_Click"  CssClass="regbutton12"/>


        <asp:Button ID="Button2" runat="server" Text="Cancel" Font-Bold="true" OnClick="Cancel_Click" ValidationGroup="a"  CssClass="regbutton12"/>

    </div>   
      </asp:Content>
