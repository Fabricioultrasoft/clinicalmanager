<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="liberarinternacao.aspx.cs"
    Inherits="Clinicalmanager.internacao.liberarinternacao" Title="Untitled Page" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">
function alta(){
window.alert('Internação Liberada');
self.close();
}
</script>

<html>
<head>
<script type="text/javascript" src="../mascara.js"></script>
    <style type="text/css">
        .style1
        {
            width: 278px;
        }
    </style>
</head>
<body>
 <form id="Form1" runat="server">
 <div>

        <table style="width:100%; text-align: left;">
            <tr>
                <td class="style1">
                    Data de Entrada:</td>
                <td>
                    <asp:TextBox ID="txtDataEntrada" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Data de Saída:</td>
                <td>
                    <asp:TextBox ID="txtDataSaida" runat="server" 
                        onkeyup="formataData(this,event);" AutoPostBack="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Quantidade de Dias internados:</td>
                <td>
                    <asp:Label ID="lbQtdDias" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Plano de Saúde:</td>
                <td>
                    <asp:TextBox ID="txtPlano" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Valor esperado de Honorário:</td>
                <td>
                    <asp:TextBox ID="txtValorHn" runat="server"  onkeyup="formataValor(this,event);></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    <div style="text-align: center">
        <asp:Button ID="Button1"  runat="server" Text="Liberar Paciente" 
            onclick="Button1_Click" OnClientClick="alta();"/>
            
    </div>
    </form>
    </body>
</html>
   

