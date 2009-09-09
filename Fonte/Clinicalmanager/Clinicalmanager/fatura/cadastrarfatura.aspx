<%@ Page Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="cadastrarfatura.aspx.cs"
    Inherits="Clinicalmanager.fatura.cadastrarfatura" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 127px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
<div style="width: 414px">
    <div id="tabela">
    <h1> Cadastrar Fatura</h1>
        <table style="width: 100%; text-align: left;">
            <tr>
                <td class="style1">
                    Data da fatura</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    <div id="btn">
        <asp:Button ID="btnSalvar" runat="server" Text="Cadastrar" />
    </div>
    </div>
</asp:Content>
