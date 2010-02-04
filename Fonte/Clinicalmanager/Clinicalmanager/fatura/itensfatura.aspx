<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="itensfatura.aspx.cs" Inherits="Clinicalmanager.fatura.itensfatura" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 148px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Label ID="msg" runat="server" Text=""></asp:Label>
    <div id="pesquisa">
        <table style="width:100%;">
            <tr>
                <td class="style1">
                    Prontuário Paciente:</td>
                <td>
                    <asp:TextBox ID="codProntuario" runat="server" Width="184px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="filtrar" runat="server" Text="Filtrar" />
                </td>
            </tr>
        </table>
    </div>
    <div style="text-align: center">
        <asp:GridView ID="grdItem" runat="server" BackColor="White" 
            BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
            DataSourceID="dsItensFatura" GridLines="Horizontal" DataKeyNames="codprontuario"
            AutoGenerateColumns="False">
            <RowStyle BackColor="White" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="codprontuario" HeaderText="Prontuário" />
                <asp:BoundField DataField="nome" HeaderText="Paciente" />
                <asp:BoundField DataField="data_in" DataFormatString="{0:dd/MM/yyyy}" 
                    HeaderText="Data entrada" />
                <asp:TemplateField>
                     
                    <ItemTemplate>
                        <asp:CheckBox ID="parcial" runat="server" />
                        &nbsp;
                        <asp:Button ID="btnAdd" runat="server" Text="Adicionar" 
                            oncommand="btnAdd_Command" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"idint")%>'/>
                    </ItemTemplate>
                     
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    </div>    
    <asp:ObjectDataSource ID="dsItensFatura" runat="server" 
        SelectMethod="listarItensParaIncluir" TypeName="Negocio.Fachada">
        <SelectParameters>
            <asp:ControlParameter ControlID="codProntuario" Name="codprontuario" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </form>
</body>
</html>
