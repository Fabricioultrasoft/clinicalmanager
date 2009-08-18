<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Clinicalmanager._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="default.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="logo">
	<h1><a href="#">Subordinate</a></h1>
	<h2> Design by Free Css Templates</h2>
</div>
<div id="page">
<div id="content">
    <form id="form1" runat="server">
    <div>    
        <asp:Menu ID="Menu1" runat="server" BackColor="#E3EAEB" 
            DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" 
            ForeColor="#666666" StaticSubMenuIndent="10px">
            <StaticSelectedStyle BackColor="#1C5E55" />
            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
            <DynamicMenuStyle BackColor="#E3EAEB" />
            <DynamicSelectedStyle BackColor="#1C5E55" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticHoverStyle BackColor="#666666" ForeColor="White" />
            <Items>
                <asp:MenuItem Text="Cadastro" Value="Cadastro">
                    <asp:MenuItem NavigateUrl="~/consultar.aspx" Text="Medicos" Value="Medicos">
                    </asp:MenuItem>
                </asp:MenuItem>
            </Items>
        </asp:Menu>
    
    </div>    
    <div>
        Nome:
        <asp:TextBox ID="txtPessoa" runat="server"></asp:TextBox>
    </div>
    
    
    <p>
        CPF:
        <asp:TextBox ID="txtCPF" runat="server"></asp:TextBox>
        </p>
    <p>
        <asp:Button ID="btnConsultar"
            runat="server" Text="Inserir" onclick="btnConsultar_Click" />
    </p>
    
    
    </form>
    </div>
    </div>
</body>
</html>
