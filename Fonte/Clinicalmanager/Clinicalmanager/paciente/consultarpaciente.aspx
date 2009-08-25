<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="consultarpaciente.aspx.cs"
    Inherits="Clinicalmanager.local.consultarpaciente" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../default.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div id="logo">
        <h1>
            <a href="#">Clinical Manager</a></h1>
        <h2>
            Controle Gerencial de Clínica</h2>
    </div>
    <div id="page">
    <form id="frmConsPac" runat="server">
    <div id="sidebar">
        <asp:Menu ID="Menu1" runat="server" BackColor="#E3EAEB" DynamicHorizontalOffset="2"
            Font-Names="Verdana" Font-Size="Medium" ForeColor="#666666" StaticSubMenuIndent="10px"
            Height="105px" Style="text-align: center" Width="112px" OnMenuItemClick="Menu1_MenuItemClick">
            <StaticSelectedStyle BackColor="#1C5E55" />
            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
            <DynamicMenuStyle BackColor="#E3EAEB" />
            <DynamicSelectedStyle BackColor="#1C5E55" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticHoverStyle BackColor="#666666" ForeColor="White" />
            <Items>
                <asp:MenuItem Text="Cadastro" Value="Cadastro" 
                    Target="local/consultarlocal.aspx">
                    <asp:MenuItem Text="Medicos" Value="Medicos" Target="medico/cadastrar.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Paciente" Value="Paciente" Target="/paciente/cadastrarpaciente.aspx">
                    </asp:MenuItem>
                    <asp:MenuItem Text="Local" Value="Local" Target="/local/cadastrarlocal.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Fatura" Value="Fatura"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="Consulta" Value="Consulta">
                    <asp:MenuItem Text="Internacao" Value="Internacao"></asp:MenuItem>
                    <asp:MenuItem Text="Fatura" Value="Fatura"></asp:MenuItem>
                    <asp:MenuItem Target="/paciente/consultarpaciente.aspx" Text="Paciente" Value="Paciente">
                    </asp:MenuItem>
                    <asp:MenuItem Text="Local" Value="Local"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="Relatórios" Value="Relatórios">
                    <asp:MenuItem Text="Internacões" Value="Internacões"></asp:MenuItem>
                </asp:MenuItem>
            </Items>
        </asp:Menu>
    </div>
    <div id="content">
        <div id="paramPac">
            <table style="width: 100%;">
                <tr>
                    <td class="style2">
                        Nome:
                    </td>
                    <td class="style3">
                        <asp:TextBox ID="txtNome" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        CPF:
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="txtCPF" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Consulta" />
        </div>
        <div id="resultPac">
            <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" 
                AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="idpac">
                <Columns>
                    <asp:CommandField DeleteText="Excluir" ShowDeleteButton="True" />
                    <asp:BoundField DataField="nome" HeaderText="Nome" />
                    <asp:BoundField DataField="cpf" HeaderText="CPF" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="excluirPaciente"
                SelectMethod="getPaciente" TypeName="Negocio.Fachada" >                
                <DeleteParameters>
                    <asp:Parameter Name="idpac" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:FormParameter DefaultValue="%" FormField="txtNome" Name="nome" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
    </form>
    </div>
</body>
</html>
