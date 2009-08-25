﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastrarpaciente.aspx.cs"
    Inherits="Clinicalmanager.paciente.cadastrar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../default.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div id="logo">
        <h1>
            <a href="#">Clinical Manager</a></h1>
        <h2>
            Controle Gerencial de Clínica</h2>
    </div>
    <div id="page">
        <form id="frmConsPac" runat="server">
        <div id="sidebar">
            <asp:Menu ID="Menu1" runat="server" BackColor="#E3EAEB" DynamicHorizontalOffset="2"
                Font-Names="Verdana" Font-Size="Medium" ForeColor="#666666" StaticSubMenuIndent="10px"
                Height="105px" Style="text-align: center" Width="112px" OnMenuItemClick="Menu1_MenuItemClick">
                <StaticSelectedStyle BackColor="#1C5E55" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
                <DynamicMenuStyle BackColor="#E3EAEB" />
                <DynamicSelectedStyle BackColor="#1C5E55" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticHoverStyle BackColor="#666666" ForeColor="White" />
                <Items>
                    <asp:MenuItem Text="Cadastro" Value="Cadastro">
                        <asp:MenuItem Text="Medicos" Value="Medicos" Target="medico/cadastrar.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Paciente" Value="Paciente" Target="/paciente/cadastrarpaciente.aspx">
                        </asp:MenuItem>
                        <asp:MenuItem Text="Local" Value="Local" Target="/local/cadastrarlocal.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Fatura" Value="Fatura"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Consulta" Value="Consulta">
                        <asp:MenuItem Text="Internacao" Value="Internacao"></asp:MenuItem>
                        <asp:MenuItem Text="Fatura" Value="Fatura"></asp:MenuItem>
                        <asp:MenuItem Target="/paciente/consultarpaciente.aspx" Text="Paciente" Value="Paciente">
                        </asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Relatórios" Value="Relatórios">
                        <asp:MenuItem Text="Internacões" Value="Internacões"></asp:MenuItem>
                    </asp:MenuItem>
                </Items>
            </asp:Menu>
        </div>
        <div id="content">
            <h1 style="margin: 5px">
                Cadastro de Paciente</h1>
            <table style="margin: 4px; width: 100%;">
                <tr>
                    <td class="style2">
                        Nome:
                    </td>
                    <td class="style3">
                        &nbsp;
                        <asp:TextBox ID="txtNome" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        CPF
                    </td>
                    <td>
                        &nbsp;
                        <asp:TextBox ID="txtCPF" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:Button ID="btnSalvar" runat="server" OnClick="btnSalvar_Click" Text="Salvar" />
        </div>
        </form>
    </div>
</body>
</html>
