<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="consultarpaciente.aspx.cs"
    Inherits="Clinicalmanager.local.consultarpaciente" MasterPageFile="~/master.Master" %>



<asp:Content ID="consPac" ContentPlaceHolderID="contentHolder" runat="server">
<script language="javascript" type="text/javascript">
var oldgridSelectedColor;

function setMOverColor(element)
{
    oldgridSelectedColor = element.style.backgroundColor;
    element.style.backgroundColor='#FFFFCA';
}

function setmOutColor(element)
{
    element.style.backgroundColor=oldgridSelectedColor;
}
</script>
    <h1>
        Consultar Paciente</h1>
    <div id="paramPac">
        <table style="width: 100%; text-align: left;">
            <tr>
                <td >
                    Nome: &nbsp;
                </td>
                <td >
                    <asp:TextBox ID="txtNome" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    CPF:
                </td>
                <td >
                    <asp:TextBox ID="txtCPF" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Consulta" />
    </div>
    <div id="resultPac">
        <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" AllowPaging="True"
            AutoGenerateColumns="False" DataKeyNames="idpac" Style="margin-right: 8px"
            BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px"
            CellPadding="4" GridLines="Horizontal" 
            OnRowDataBound="GridView1_RowDataBound" >
            <RowStyle BackColor="White" ForeColor="#333333" />
            <Columns>
                <asp:CommandField DeleteText="Excluir" ShowDeleteButton="True" />
                <asp:BoundField DataField="codprontuario" HeaderText="Prontuário"  />
                <asp:BoundField DataField="nome" HeaderText="Nome"  />
                <asp:BoundField DataField="cpf" HeaderText="CPF" />
                <asp:HyperLinkField DataNavigateUrlFields="idpac" DataNavigateUrlFormatString="~/internacao/consultarinternacao.aspx?idpac={0}"
                    NavigateUrl="~/internacao/consultarinternacao.aspx" Text="ver internações" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="excluirPaciente"
            SelectMethod="getPaciente" TypeName="Negocio.Fachada">
            <DeleteParameters>
                <asp:Parameter Name="idpac" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtNome" DefaultValue="%" Name="nome" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
