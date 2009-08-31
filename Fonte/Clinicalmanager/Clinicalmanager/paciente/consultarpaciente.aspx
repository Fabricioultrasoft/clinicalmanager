<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="consultarpaciente.aspx.cs"
    Inherits="Clinicalmanager.local.consultarpaciente" MasterPageFile="~/master.Master"%>
<asp:Content ID="consPac" ContentPlaceHolderID="contentHolder" runat="server">
<h1>Consultar Paciente</h1>
        <div id="paramPac">
            <table style="width: 100%;">
                <tr>
                    <td class="style2">
                        Nome:
            &nbsp;</td>
                    <td class="style3">
                        <asp:TextBox ID="txtNome" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        CPF:
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="txtCPF" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Consulta" />
        </div>
        <div id="resultPac">
        <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" 
                AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="idpac" 
                style="margin-right: 8px">
                <Columns>
                    <asp:CommandField DeleteText="Excluir" ShowDeleteButton="True" />
                    <asp:BoundField DataField="nome" HeaderText="Nome" />
                    <asp:BoundField DataField="cpf" HeaderText="CPF" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="excluirPaciente"
                SelectMethod="getPaciente" TypeName="Negocio.Fachada" >                
                <DeleteParameters>
                    <asp:Parameter Name="idpac" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtNome" DefaultValue="%" Name="nome" 
                        PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>

</asp:Content>