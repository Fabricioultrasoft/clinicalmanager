<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="liberarinternacao.aspx.cs"
    Inherits="Clinicalmanager.internacao.liberarinternacao" Title="Untitled Page" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">
function close(){
window.close();
}
</script>

<html>
<head></head>
<body>
 <form id="Form1" runat="server">
 <div>

        <table style="width:100%; text-align: left;">
            <tr>
                <td class="style1">
                    Data de Saída:</td>
                <td>
                    <asp:TextBox ID="txtDataSaida" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Valor esperado de Honorário:</td>
                <td>
                    <asp:TextBox ID="txtValorHn" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    <div style="text-align: center">
        <asp:Button ID="Button1"  runat="server" Text="Liberar Paciente" 
            onclick="Button1_Click" />
            
    </div>
    </form>
    </body>
</html>
   

