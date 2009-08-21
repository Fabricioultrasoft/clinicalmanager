<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="../master.Master" CodeBehind="consultarpaciente.aspx.cs"
    Inherits="Clinicalmanager.local.consultarpaciente" %>

<asp:Content ID="consPac" ContentPlaceHolderID="contentHolder" runat="server">
    <div id="paramPac">
        <table style="width:100%;">
            <tr>
                <td class="style2">
                    Nome:</td>
                <td class="style3">
                    <asp:TextBox ID="txtNome" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    CPF:</td>
                <td class="style4">
                    <asp:TextBox ID="txtCPF" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>

        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Consulta" />

    </div>
    <div id="resultPac">
        <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1">
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            DeleteMethod="excluirPaciente" SelectMethod="getPaciente" 
            TypeName="Negocio.Fachada">
            <DeleteParameters>
                <asp:Parameter Name="idpac" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:FormParameter  DefaultValue="%" FormField="txtNome" Name="nome" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">

    <style type="text/css">
        #paramPac
        {
            height: 90px;
            text-align: left;
        }
        #resultPac
        {
            height: 222px;
        }
        .style1
        {
            width: 71px;
            text-align: left;
        }
        .style2
        {
            width: 71px;
            height: 24px;
            text-align: left;
        }
        .style3
        {
            height: 24px;
            text-align: left;
        }
        .style4
        {
            text-align: left;
        }
    </style>

</asp:Content>

