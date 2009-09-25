<%@ Page Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="consultarinternacao.aspx.cs" Inherits="Clinicalmanager.internacao.consultarinternacao" Title="Untitled Page" %>
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
        <table style="width:121%;">
        <tr>
                <td class="style2">
                    Cód. Internação</td>
                <td class="style3" colspan="3">
                    <asp:TextBox ID="txtCodInt" runat="server" Width="62px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Paciente</td>
                <td class="style3" colspan="3">
                    <asp:TextBox ID="txtNomePac" runat="server" Width="393px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    Data de entrada</td>
                <td class="style8">
                    <asp:TextBox ID="txtDataEntrada" runat="server" Width="85px"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="..." onclick="Button1_Click" 
                        Width="24px" />
                     
                    <div>
                        <asp:Calendar ID="cldDataEntrada" runat="server" BackColor="White" 
                            BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                            Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" 
                            Width="200px" onselectionchanged="cldDataEntrada_SelectionChanged" 
                            Visible="False">
                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <NextPrevStyle VerticalAlign="Bottom" />
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        </asp:Calendar>
                    </div>
                </td>
                <td class="style4">
                    Data de Saída</td>
                <td class="style7" style="text-align: left">
                    <asp:TextBox ID="txtDataSaida" runat="server" Width="75px"></asp:TextBox>
                    <asp:Button ID="Button2" runat="server" Text="..." Width="22px" 
                        CssClass="links" onclick="Button2_Click" />
                    <div>
                        <asp:Calendar ID="cldDataSaida" runat="server" BackColor="White" 
                            BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                            Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" 
                            onselectionchanged="cldDataSaida_SelectionChanged" Visible="False" 
                            Width="200px">
                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <NextPrevStyle VerticalAlign="Bottom" />
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        </asp:Calendar>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    Médico Responsável</td>
                <td class="style6" colspan="3">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="18px" Width="227px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    Status</td>
                <td class="style6" colspan="3">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                        <asp:ListItem Selected="True" Value="Em andamento">Em andamento</asp:ListItem>
                        <asp:ListItem Value="Finalizadas">Finalizadas</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
        <asp:Button ID="btnConsulta" runat="server" Text="Consulta" 
            onclick="btnConsulta_Click" />    
    </div>
    <div id="resultPesq">
        <asp:GridView ID="grdInternacao" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
            CellPadding="4" DataSourceID="dsInternacao" GridLines="Horizontal" 
            oninit="grdInternacao_Init" AllowPaging="True">
            <RowStyle BackColor="White" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="data_in" HeaderText="Data de Entrada" />
                <asp:BoundField DataField="data_out" HeaderText="Data de Saída" />
                <asp:BoundField DataField="nome" HeaderText="Paciente" />
                <asp:BoundField DataField="cpf" HeaderText="CPF" />
                <asp:BoundField DataField="obs" HeaderText="Observações" />
                <asp:BoundField DataField="local" HeaderText="Localização atual" />
                <asp:TemplateField HeaderText="Liberação">
                <ItemTemplate>
                <a href="#" onclick="alta('<%# Eval("idint")%>')">Liberar</a>
                </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Movimentação">
                <ItemTemplate>
                <a href="#" onclick="movimentar('<%# Eval("idint")%>')">Movimentar</a>
                </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Histórico">
                <ItemTemplate>
                <a href="historicointernacao.aspx?idint=<%# Eval("idint")%>">Histórico</a>
                </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <PagerStyle BackColor="#336666" ForeColor="Blue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="Aqua" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:ObjectDataSource ID="dsInternacao" runat="server" SelectMethod="getInternacaoPacienteNome" 
            TypeName="Negocio.Fachada">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtNomePac" Name="nome" PropertyName="Text" 
                    Type="String" />
                <asp:ControlParameter ControlID="RadioButtonList1" Name="andamento" 
                    PropertyName="SelectedValue" Type="String" />
              
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
