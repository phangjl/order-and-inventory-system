<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="loginpage.aspx.cs" Inherits="WebApplication1.loginpage" %>


<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
        <div  id="log" >
             
            <table >
                 <tr>                    
                     <td colspan="2"><asp:Label ID="Label1" runat="server" Text="UserID :"></asp:Label><br />
                         <asp:TextBox ID="txtuser" runat="server"  placeholder=" User ID.."  CssClass="inpt"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email Required" CssClass="ValidationError" SetFocusOnError="True" Display="Dynamic"  ControlToValidate="txtuser"  ToolTip="required"  ForeColor="Red">*</asp:RequiredFieldValidator></td>
                 </tr>
                 
                 <tr>
                    
                     <td  colspan="2"><asp:Label ID="Label2" runat="server" Text="Password :"></asp:Label><br />
                         <asp:TextBox ID="TxtPsw" runat="server" TextMode="Password" placeholder=" Password.."  CssClass="inpt"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Password Required" CssClass="ValidationError" SetFocusOnError="True" Display="Dynamic"  ControlToValidate="TxtPsw"  ToolTip="required"  ForeColor="Red">*</asp:RequiredFieldValidator></td>
                 </tr>
                
                <tr>
                      <td colspan="2"><asp:Label ID="ErrorMsg" runat="server" Text="" ForeColor="red"></asp:Label></td>

                  </tr>

                  <tr>
                      <td colspan="2"><asp:CheckBox ID="Remember" runat="server"  />Remember Me</td>

                  </tr>

     <tr>
         <td colspan="2">
             <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
         </td>
     </tr>
                   <tr style="text-align:center">
                                       
                        <td><asp:Button ID="txtLgIn" runat="server" Text="Login" style="height: 26px"  CssClass="dgbtn" OnClick="txtLgIn_Click"/></td>
                     
                 </tr>

             </table>

        </div>
   </asp:Content>