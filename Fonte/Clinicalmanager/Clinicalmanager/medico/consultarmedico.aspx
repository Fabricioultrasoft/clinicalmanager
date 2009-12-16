<%@ Page Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="consultarmedico.aspx.cs" Inherits="Clinicalmanager.medico.consultarmedico" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
    <div id="parCons">
</div>
<div id="resCons">

    <asp:GridView ID="GridView1" runat="server" BackColor="White" 
        BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
        DataSourceID="dsMedico" GridLines="Horizontal" DataKeyNames="idmed"
        AutoGenerateColumns="False" >
        <RowStyle BackColor="White" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="idmed" HeaderText="ID" />
            <asp:BoundField DataField="nome" HeaderText="Nome" />            
            <asp:CommandField ShowDeleteButton="True" DeleteText="excluir" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="dsMedico" runat="server" SelectMethod="getAllMedicos" 
        TypeName="Negocio.Fachada" DeleteMethod="excluirMedico" 
        ondeleted="dsMedico_Deleted" >
        <DeleteParameters>
            <asp:Parameter Name="idmed" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>
</div>
</asp:Content>
