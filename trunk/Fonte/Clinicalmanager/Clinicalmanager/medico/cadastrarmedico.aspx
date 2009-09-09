<%@ Page Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="cadastrarmedico.aspx.cs"
    Inherits="Clinicalmanager.medico.cadastrarmedico" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 111px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
    <div>
        <div id="tabela">
        <h1>Cadastrar Médico</h1>
            <table style="width: 100%; text-align: left;">
                <tr>
                    <td class="style1">
                        &nbsp;
                        Nome:</td>
                    <td>
                        &nbsp;
                        <asp:TextBox ID="txtNome" runat="server" Width="233px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;
                        CRM</td>
                    <td>
                        &nbsp;
                        <asp:TextBox ID="txtCRM" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div id="btn">
            <asp:Button ID="btnSalvar" runat="server" Text="Salvar" 
                onclick="btnSalvar_Click" />
        </div>
    </div>
</asp:Content>
