<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastrar.aspx.cs" Inherits="Clinicalmanager.paciente.cadastrar" MasterPageFile="../master.Master" %>

<asp:Content ID="pacCadastro" ContentPlaceHolderID="contentHolder" runat="server">
    Nome:
<asp:TextBox ID="txtNome" runat="server"></asp:TextBox>
<br />
CPF:
<asp:TextBox ID="txtCPF" runat="server"></asp:TextBox>
<br />
<asp:Button ID="btnSalvar" runat="server" onclick="btnSalvar_Click" 
    Text="Salvar" />
</asp:Content>