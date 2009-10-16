<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Clinicalmanager.login" %>

<html>
<head>
    <link href="default.css" rel="stylesheet" type="text/css" />
    <title>Clinical Manager</title>
    <style type="text/css">
        .style1
        {
            width: 104px;
        }
    </style>
</head>
<body>    
    <div style="height: 77px; width: 1024px; text-align: center; margin-bottom: 0px;">
    <div id="logo">
        <h1>
            <a href="/default.aspx">Clinical Manager</a></h1>
        <h2>
            Controle Gerencial de Clínica</h2>
    </div>
    </div>
    <div id="page">
        <form runat="server">
        <table align="center">
            <tr>
                <td class="style1">
                    Login:
                </td>
                <td>
                    <asp:TextBox ID="txtLogin" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Senha:
                </td>
                <td>
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>    
            <tr>
            <td>
            <asp:Button ID="Button1" runat="server" Text="Entrar" OnClick="Button1_Click1" />    
            </td>         
            </tr>                      
        </table>       
        
        </form>
    </div>
</body>
</html>
