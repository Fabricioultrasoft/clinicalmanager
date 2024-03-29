﻿<%@ Page Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="historicointernacao.aspx.cs" Inherits="Clinicalmanager.internacao.historicointernacao" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
<div id="historico">
<h1>Histórico de Internação</h1>
    <br />
    <asp:GridView ID="GridView1" runat="server" DataSourceID="dsHist" 
        BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
        CellPadding="4" GridLines="Horizontal" AutoGenerateColumns="False" 
        DataKeyNames="idint,idloc,data_in_loc">
        <RowStyle BackColor="White" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="nome" HeaderText="Nome" />            
            <asp:BoundField DataField="data_in_loc" HeaderText="Entrada" DataFormatString="{0:dd/MM/yyyy}"/>
            <asp:BoundField DataField="data_out_loc" HeaderText="Saída" DataFormatString="{0:dd/MM/yyyy}"/>
            <asp:BoundField DataField="local" HeaderText="Localização" />
            <asp:BoundField DataField="obs_loc" HeaderText="Observações" />
            <asp:BoundField DataField="data_in" HeaderText="Data de Internação" DataFormatString="{0:dd/MM/yyyy}"/>
            
            <asp:CommandField DeleteText="Excluir" ShowDeleteButton="True" />
            
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="dsHist" runat="server" 
        SelectMethod="historicoMovimentacao" TypeName="Negocio.Fachada" 
        DeleteMethod="exluirMovimentacao">
        <DeleteParameters>
            <asp:Parameter Name="idint" Type="Int32" />
            <asp:Parameter Name="idloc" Type="Int32" />
            <asp:Parameter Name="data_in_loc" Type="DateTime" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="idint" QueryStringField="idint" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
<br />

</div>
</asp:Content>
