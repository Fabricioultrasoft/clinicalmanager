<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="itensfatura.aspx.cs" 
Inherits="Clinicalmanager.fatura.itensfatura" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">
function alerta(){
window.alert('Internação incluída com sucesso');
//self.close();
}
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Clinicalmanager - Itens Fatura</title>
    <style type="text/css">
        .style1
        {
            width: 50%;
        }
        .style2
        {
            width: 50%;
        }
    </style>
    <script type="text/javascript" src="../mascara.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Label ID="msg" runat="server" Text=""></asp:Label>
    <div id="pesquisa">
        <table style="width:100%;">
            <tr>
                <td>
                    Prontuário Paciente:</td>
                <td>
                    <asp:TextBox ID="codProntuario" runat="server" Width="184px" 
                        ontextchanged="codProntuario_TextChanged" AutoPostBack="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Paciente</td>
                <td class="style2">
                    <asp:Label ID="lbPaciente" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Valor Fatura</td>
                <td>
                    <asp:TextBox ID="txtValor" runat="server" onkeyup="formataValor(this,event);"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnIncluir" runat="server" Text="Incluir" 
                        onclick="Button1_Click" OnClientClick="alerta();"/>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
