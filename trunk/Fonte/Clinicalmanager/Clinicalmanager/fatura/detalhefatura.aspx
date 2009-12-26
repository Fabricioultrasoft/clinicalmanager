<%@ Page Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="detalhefatura.aspx.cs" Inherits="Clinicalmanager.fatura.detalhefatura" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
<h1>itens de fatura</h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
        CellPadding="4" DataSourceID="dsDetalheFatura" GridLines="Horizontal" 
        DataKeyNames="idfat,idint"  >
        <RowStyle BackColor="White" ForeColor="#333333" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="entrada" DataFormatString="{0:dd/MM/yyyy}" 
                HeaderText="Data Entrada" />
            <asp:BoundField DataField="nome" HeaderText="Paciente" />
            <asp:BoundField DataField="codprontuario" HeaderText="Prontuário" />
            <asp:BoundField DataField="medico" HeaderText="Médico" />
            <asp:BoundField DataField="fatura" HeaderText="Fatura" />
            <asp:BoundField DataField="valor" HeaderText="Valor" />
            <asp:BoundField DataField="convenio" HeaderText="Convênio" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="dsDetalheFatura" runat="server" 
        SelectMethod="getDetalheFatura" TypeName="Negocio.Fachada" 
        DeleteMethod="excluirItemFatura" ondeleted="dsDetalheFatura_Deleted">
        <DeleteParameters>
            <asp:Parameter Name="idfat" Type="Int32" />
            <asp:Parameter Name="idint" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="idfat" QueryStringField="idfat" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
