<%@ Page Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="consultarinternacao.aspx.cs"
    Inherits="Clinicalmanager.internacao.consultarinternacao" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script language="javascript" type="text/javascript">
function alta(idint){
window.open('liberarinternacao.aspx?idint='+idint,'',"status=no, height = 350 , width = 350, location=no,menubar=no,titlebar=no, directories=no" )
/*status=yes/no,  Barra de menu: menubar=yes/no ,  Barra de ferramentas: toolbar=yes/no ,  Barra de título: titlebar=yes/no
Barra de endereços:location=yes/no ,  Tela cheia:fullscreen=yes/no ,  Barra de diretórios:directories=yes/no*/
}
function movimentar(idint){
window.open('movimentarpaciente.aspx?idint='+idint,''," height = 450 , width = 400, location=no,titlebar=no" )
}
function parcial(idint){
window.open('/fatura/incluirparcial.aspx?idint='+idint,''," height = 350 , width = 500, location=no,titlebar=no" )
}
function pagar(idint){
window.open('/fatura/itensfatura.aspx?idint='+idint,''," height = 350 , width = 500, location=no,titlebar=no" )
}

    </script>

    <style type="text/css">
        .style2
        {
            width: 117px;
            height: 22px;
            text-align: left;
        }
        .style3
        {
            height: 22px;
            text-align: left;
        }
        .style4
        {
            width: 78px;
            text-align: left;
        }
        .style6
        {
            text-align: left;
        }
        .style7
        {
            width: 115px;
        }
        .style8
        {
            width: 164px;
            text-align: left;
        }
        .style9
        {
            width: 117px;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
    <div id="paramPesq">
        <table style="width: 121%;">
            <tr>
                <td class="style2">
                    Cód. Internação
                </td>
                <td class="style3" colspan="3">
                    <asp:TextBox ID="txtCodInt" runat="server" Width="62px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Paciente
                </td>
                <td class="style3" colspan="3">
                    <asp:TextBox ID="txtNomePac" runat="server" Width="393px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Data de entrada
                </td>
                <td class="style8">
                    <asp:TextBox ID="txtDataEntrada" runat="server" Width="85px"></asp:TextBox>
                    <div>
                    </div>
                </td>
                <td class="style4">
                    Data de Saída
                </td>
                <td class="style7" style="text-align: left">
                    <asp:TextBox ID="txtDataSaida" runat="server" Width="75px"></asp:TextBox>
                    <div>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    Médico Responsável
                </td>
                <td class="style6" colspan="3">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="18px" Width="227px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    Status
                </td>
                <td class="style6" colspan="3">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                        <asp:ListItem Selected="True" Value="Em andamento">Em andamento</asp:ListItem>
                        <asp:ListItem Value="Finalizadas">Finalizadas</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
        <asp:Button ID="btnConsulta" runat="server" Text="Consulta" OnClick="btnConsulta_Click" />
    </div>
    <div id="resultPesq">
        <asp:GridView ID="grdInternacao" runat="server" AutoGenerateColumns="False" BackColor="White"
            BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4"
            DataSourceID="dsInternacao" GridLines="Horizontal" DataKeyNames="idint" OnInit="grdInternacao_Init"
            AllowPaging="True" onrowcommand="grdInternacao_RowCommand" 
            onrowdatabound="grdInternacao_RowDataBound">
            <RowStyle BackColor="White" ForeColor="#333333" />
            <Columns>
                <asp:CommandField DeleteText="Excluir" ShowDeleteButton="True" />
                <asp:BoundField DataField="data_in" HeaderText="Data de Entrada" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="data_out" HeaderText="Data de Saída" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="nome" HeaderText="Paciente" />
                <asp:BoundField DataField="cpf" HeaderText="CPF" />
                <asp:BoundField DataField="obs" HeaderText="Observações" />
                <asp:BoundField DataField="local" HeaderText="Última localização" />
                <asp:TemplateField HeaderText="Liberação">
                    <ItemTemplate>
                        <asp:Button ID="btnLiberar" Text="Liberar" CommandArgument='<%# Bind("idint") %>'
                        CommandName="liberar" Enabled="true" runat="server"/>
                        
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Movimentação">
                    <ItemTemplate>
                        <a href="historicointernacao.aspx?idint=<%# Eval("idint")%>">Histórico</a>
                        <asp:Button ID="btnMovimentar" Text="Movimentar" CommandArgument='<%# Bind("idint") %>'
                        CommandName="movimentar" Enabled="true" runat="server"/>
                        
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Parcial">
                    <ItemTemplate>
                    <a href="historicoparcial.aspx?idint=<%# Eval("idint")%>">Histórico</a>
                    <asp:Button ID="btnParcial" Text="Gerar" CommandArgument='<%# Bind("idint") %>'
                        CommandName="parcial" Enabled="true" runat="server"/>
                    
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Fatura">
                    <ItemTemplate>
                        <asp:Button ID="btnPagar" Text="Pagar" CommandArgument='<%# Bind("idint") %>'
                        CommandName="pagar" Enabled="false" runat="server"/>
                    </ItemTemplate>
                </asp:TemplateField>
                
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <PagerStyle BackColor="#336666" ForeColor="Blue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="Aqua" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:ObjectDataSource ID="dsInternacao" runat="server" SelectMethod="getInternacaoPacienteNome"
            TypeName="Negocio.Fachada" DeleteMethod="excluirInternacao">
            <DeleteParameters>
                <asp:Parameter Name="idint" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtNomePac" Name="nome" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="RadioButtonList1" Name="andamento" PropertyName="SelectedValue"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    </asp:Content>
