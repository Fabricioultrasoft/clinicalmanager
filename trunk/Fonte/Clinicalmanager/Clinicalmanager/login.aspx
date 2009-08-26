<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Clinicalmanager.login"
    MasterPageFile="~/master2.Master" %>

<asp:Content ID="loginForm" ContentPlaceHolderID="login" runat="server">

    <div style="height: 89px; width: 356px":
    Login
</div>
        <table style="width: 100%; height: 48px;">
            <tr>
                <td>
                    Login:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Senha:</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:Button ID="Button1" runat="server" Text="Entrar" 
            onclick="Button1_Click1" />
</div>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style1
        {
            width: 75px;
        }
        .style2
        {
            width: 178px;
        }
    </style>
   </asp:Content>

