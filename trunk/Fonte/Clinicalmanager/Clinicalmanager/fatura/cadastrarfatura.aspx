<%@ Page Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="cadastrarfatura.aspx.cs"
    Inherits="Clinicalmanager.fatura.cadastrarfatura" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 152px;
        }
        .style2
        {
            width: 152px;
            height: 22px;
        }
        .style3
        {
            height: 22px;
        }
        .style4
        {
            width: 152px;
            height: 26px;
        }
        .style5
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
<div style="width: 492px">
    <div id="tabela">
    <h1> Cadastrar Fatura</h1>
        <table style="width: 100%; text-align: left;">
            <tr>
                <td class="style1">
                    Código da fatura:</td>
                <td colspan="3">
                    <asp:TextBox ID="txtCodFat" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    Data de recebimento:</td>
                <td class="style5" colspan="3">
                    <asp:TextBox ID="txtDataRec" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Período de referência de:</td>
                <td class="style3">
                
                    <asp:TextBox ID="txtDataInicio" runat="server"></asp:TextBox>
                
                </td>
                <td class="style3">
                
                    até</td>
                <td class="style3">
                
                    <asp:TextBox ID="txtDataFim" runat="server"></asp:TextBox>
                
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Mês de referência:</td>
                <td colspan="3">
                    <asp:DropDownList ID="drpMes" runat="server">
                        <asp:ListItem Value="1">Janeiro</asp:ListItem>
                        <asp:ListItem Value="2">Fevereiro</asp:ListItem>
                        <asp:ListItem Value="3">Março</asp:ListItem>
                        <asp:ListItem Value="4">Abril</asp:ListItem>
                        <asp:ListItem Value="5">Maio</asp:ListItem>
                        <asp:ListItem Value="6">Junho</asp:ListItem>
                        <asp:ListItem Value="7">Julho</asp:ListItem>
                        <asp:ListItem Value="8">Agosto</asp:ListItem>
                        <asp:ListItem Value="9">Setembro</asp:ListItem>
                        <asp:ListItem Value="10">Outubro</asp:ListItem>
                        <asp:ListItem Value="11">Novembro</asp:ListItem>
                        <asp:ListItem Value="12">Dezembro</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Tipo de Fatura:</td>
                <td colspan="3">
                    <asp:DropDownList ID="drpTipo" runat="server">
                        <asp:ListItem Value="H">Honorário</asp:ListItem>
                        <asp:ListItem Value="P">Produtividade</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    </div>
    <div id="btn">
        <asp:Button ID="btnSalvar" runat="server" Text="Cadastrar" 
            onclick="btnSalvar_Click" />
    </div>
    </div>
</asp:Content>
