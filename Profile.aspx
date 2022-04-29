<%@ Page Language="C#" MasterPageFile="~/Site1.Master" CodeBehind="Profile.aspx.cs" Inherits="WebApplication1.Profile" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
<div id="staffProfile" >           
           <div style=""><h3 style="text-align: center;font-weight: bold;">Staff Information</h3>  </div>
            <div id="staffInfo" style="border:1.5px solid black; padding:2%; margin:1%; ">
                <asp:Label ID="Label1" runat="server" Text="Staff ID: " style="font-weight: bold;" CssClass="profitwidth"></asp:Label>
                <asp:Label ID="userName" runat="server" Text="" style="font-weight: bold;" CssClass="profitwidth"></asp:Label><br /> 
                <asp:Label ID="Label2" runat="server" Text="Email: " style="font-weight: bold;" CssClass="profitwidth"></asp:Label>
                <asp:Label ID="email" runat="server" Text="" style="font-weight: bold;" CssClass="profitwidth"></asp:Label> <br />
                <asp:Label ID="Label3" runat="server" Text="Name: " style="font-weight: bold;" CssClass="profitwidth"></asp:Label>
                <asp:Label ID="name" runat="server" Text="" style="font-weight: bold;" CssClass="profitwidth"></asp:Label>  <br />  
                <asp:Label ID="Label4" runat="server" Text="Position: " style="font-weight: bold;" CssClass="profitwidth"></asp:Label>
                <asp:Label ID="position" runat="server" Text="" style="font-weight: bold;" CssClass="profitwidth"></asp:Label> <br /> 
            </div>   

         <div id="StaffPage" style="text-align:center">                 

        <asp:Button ID="Button1" runat="server" Text="Edit Info" Font-Bold="true" OnClick="EditProfile_Click" CssClass="regbutton12"/>


        <asp:Button ID="Button2" runat="server" Text="Back" Font-Bold="true"  OnClick="back_Click" CssClass="regbutton12" />

    </div>   

          </div>

    </asp:Content>