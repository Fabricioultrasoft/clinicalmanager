<%@ Page Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="historicoparcial.aspx.cs" Inherits="Clinicalmanager.internacao.historicoparcial" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script language="javascript" type="text/javascript">
function pagar(idint, idpar){
window.open('pagarparcial.aspx?idint='+idint+'&idpar='+idpar,''," height = 450 , width = 400, location=no,titlebar=no" )
}
  function alertMe() {
            alert('Hello');
        }
    </script>
    
    <style type="text/css">
        .style1
        {
            width: 20em;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
<div id="historico">
<h1>parciais de Internação</h1>
    <br />
    <table style="width: 100%;text-align:justify">
        <tr>
            <td class="style1">
                &nbsp;
                Prontuário:</td>
            <td>
                &nbsp;
                <asp:Label ID="lbProntuario" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
                Paciente:</td>
            <td>
                &nbsp;
                <asp:Label ID="lbPaciente" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
                Data da Internação:</td>
            <td>
                &nbsp;
                &nbsp;
                <asp:Label ID="lbData_in" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <asp:GridView ID="grdParcial" runat="server" DataSourceID="dsHist" 
        BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
        CellPadding="4" GridLines="Horizontal" AutoGenerateColumns="False" 
        DataKeyNames="idint,idpar" onrowdatabound="grdParcial_RowDataBound" 
        style="margin-right: 0px" onrowcommand="grdParcial_RowCommand">
        <RowStyle BackColor="White" ForeColor="#333333" />
        <Columns>
            <asp:BoundField HeaderText="Parcial"/>
            <asp:BoundField DataField="data_in_par" HeaderText="Início" DataFormatString="{0:dd/MM/yyyy}"/>
            <asp:BoundField DataField="data_fim_par" HeaderText="Fim" DataFormatString="{0:dd/MM/yyyy}"/>
            <asp:BoundField DataField="qtd_visitas" HeaderText="Qtd. Visitas" />           
            <asp:CheckBoxField DataField="paga" HeaderText="Paga" />
            
            <asp:CommandField DeleteText="Excluir" ShowDeleteButton="True" />
            
            <asp:TemplateField HeaderText="Fatura">
                <ItemTemplate>
                    <asp:Button ID="btnPagar" runat="server" Text="Pagar" Enabled="false"
                        CommandArgument='<%# Bind("idpar") %> ' CommandName="pagar" />                  
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="dsHist" runat="server" 
        SelectMethod="historicoParcial" TypeName="Negocio.Fachada" 
        DeleteMethod="excluirParcial">
        <DeleteParameters>
            <asp:Parameter Name="idpar" Type="Int32" />
            <asp:Parameter Name="idint" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="idint" QueryStringField="idint" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
<br />

</div>
</asp:Content>
