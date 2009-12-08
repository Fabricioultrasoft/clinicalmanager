<%@ Page Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="consultarfatura.aspx.cs"
    Inherits="Clinicalmanager.fatura.consultarfatura" Title="Untitled Page" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

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
        #parCons
        {
            height: 118px;
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
                        <asp:TextBox ID="txtCodigo" runat="server" Width="123px"></asp:TextBox>
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
            <asp:Button ID="btnConsulta" runat="server" Text="Consultar" 
                onclick="btnConsulta_Click" />
            
            

        </div>
        <div id="result">
           
            <asp:GridView ID="grdFatura" runat="server" AutoGenerateColumns="False" 
                DataSourceID="dsFatura" BackColor="White" BorderColor="#336666" 
                BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" 
                style="margin-right: 0px" oninit="grdFatura_Init">
                <RowStyle BackColor="White" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="codigo" HeaderText="Código" />
                    <asp:BoundField DataField="data_fechamento" DataFormatString="{0:dd/MM/yyyy}" 
                        HeaderText="Data Fechamento" />
                    <asp:BoundField DataField="data_inicio" DataFormatString="{0:dd/MM/yyyy}" 
                        HeaderText="Período Inicial" />
                    <asp:BoundField DataField="data_fim" DataFormatString="{0:dd/MM/yyyy}" 
                        HeaderText="Período Final" />
                    <asp:BoundField DataField="tipo" HeaderText="Tipo" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
           
            <asp:ObjectDataSource ID="dsFatura" runat="server" 
                SelectMethod="getFaturaByCodigo" TypeName="Negocio.Fachada">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtCodigo" DefaultValue="%" Name="codigo" 
                        PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
           
        </div>
        
     
    </div>
</asp:Content>
