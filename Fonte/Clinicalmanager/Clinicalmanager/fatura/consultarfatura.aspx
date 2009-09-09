<%@ Page Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="consultarfatura.aspx.cs"
    Inherits="Clinicalmanager.fatura.consultarfatura" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style6
        {
            width: 147px;
        }
        .style7
        {
            width: 147px;
            height: 26px;
        }
        .style8
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
    <div>
        <h1>
            Consultar Fatura</h1>
        <div id="parCons">
            <table style="width: 100%; text-align: left;">
                <tr>
                    <td class="style7" >
                        Código da fatura:
                    </td>
                    <td class="style8" >
                        <asp:TextBox ID="TextBox1" runat="server" Width="123px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6" >
                        Mês de referência:</td>
                    <td >
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="29px" Width="170px">
                            <asp:ListItem Selected="True" Value="1">Janeiro</asp:ListItem>
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
            </table>
        </div>
        <div id="result">
            <asp:Button ID="btnConsulta" runat="server" Text="Consultar" />
        </div>
    </div>
</asp:Content>
