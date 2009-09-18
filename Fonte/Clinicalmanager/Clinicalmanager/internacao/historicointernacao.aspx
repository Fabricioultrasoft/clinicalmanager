<%@ Page Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="historicointernacao.aspx.cs" Inherits="Clinicalmanager.internacao.historicointernacao" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
<div id="historico">
<h1>Histórico de Internação</h1>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="dsHist">
    </asp:GridView>
    <asp:ObjectDataSource ID="dsHist" runat="server"></asp:ObjectDataSource>
<br />

</div>
</asp:Content>
