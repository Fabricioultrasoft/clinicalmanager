<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="incluirparcial.aspx.cs" Inherits="Clinicalmanager.fatura.incluirparcial" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    
    <style type="text/css">
        .style1
        {
            width: 5em;
        }
    </style>
    <script type="text/javascript" src="../mascara.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="style1">
                    Prontuário:</td>
                <td>
                    <asp:Label ID="lbProntuario" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Período de:
                    
                </td>
                <td>
                <asp:TextBox ID="txtData_in_par" onkeyup="formataData(this,event);" runat="server"></asp:TextBox>
                &nbsp;a
                    <asp:TextBox ID="txtData_fim_par"  onkeyup="formataData(this,event);" runat="server" Width="128px"></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td >
                    Qtd. Visitas:
                </td>
                <td> <asp:TextBox ID="txtQtd_visitas" runat="server"></asp:TextBox></td>
                
            </tr>
            <tr>
                <td >
                    <asp:Button ID="btnIncluir" runat="server" Text="Incluir" 
                        onclick="btnIncluir_Click" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
