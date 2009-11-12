<%@ Page Language="C#"  AutoEventWireup="true" CodeBehind="movimentarpaciente.aspx.cs" 
Inherits="Clinicalmanager.internacao.movimentarpaciente" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
<script language="javascript" type="text/javascript">
function movPac(){
window.alert('Movimentação cadastrada');
//self.close();
}
</script>
</head>
<body>
 <form id="Form1" runat="server">
 <div>

        <table style="width:100%; text-align: left;">
            <tr>
                <td class="style1">
                    Local:</td>
                <td>
                    <asp:DropDownList ID="drpLocal" runat="server" DataSourceID="dsLocal" 
                        DataTextField="nome" DataValueField="idloc">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Observação:</td>
                <td>
                    <asp:TextBox ID="txtObs" runat="server" Height="60px" style="margin-left: 0px" 
                        TextMode="MultiLine" Width="193px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Data de Entrada:</td>
                <td>
                    <asp:Calendar ID="dtIn" runat="server" BackColor="White" BorderColor="#999999" 
                        CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
                        ForeColor="Black" Height="45px" Width="90px">
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    </asp:Calendar>
&nbsp;</td>
            </tr>
        </table>
    </div>
    <div style="text-align: center">
        <asp:Button ID="btnMovimentar"  runat="server" Text="Movimentar Paciente" 
          OnClientClick="movPac();" OnClick="btnMovimentar_Click"  />
            
    </div>
    <asp:ObjectDataSource ID="dsLocal" runat="server" SelectMethod="getAllLocal" 
     TypeName="Negocio.Fachada"></asp:ObjectDataSource>
    </form>
    </body>
</html>
   

