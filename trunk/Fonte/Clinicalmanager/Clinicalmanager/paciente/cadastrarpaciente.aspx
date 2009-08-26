﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastrarpaciente.aspx.cs"
    Inherits="Clinicalmanager.paciente.cadastrar" MasterPageFile="~/master.Master"%>

<asp:Content id="cadPac" ContentPlaceHolderID="contentHolder" runat="server">
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
</asp:Content>
