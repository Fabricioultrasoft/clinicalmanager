<%@ Page Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="cadastrarinternacao.aspx.cs" Inherits="Clinicalmanager.internacao.cadastrarinternacao" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 166px;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
    <h1>Cadastrar Internação</h1>
        <table style="width:100%; text-align: left;">
            <tr>
                <td class="style1">
                    Paciente:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        DataSourceID="dsPaciente" DataTextField="nome" DataValueField="idpac" 
                                        AutoPostBack="True" 
                                        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    CPF:</td>
                                <td>
                                    <asp:TextBox ID="txtCPF" runat="server" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    Data de Entrada:</td>
                <td>
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
                        BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" 
                        ForeColor="Black" Height="76px" NextPrevFormat="FullMonth" Width="334px">
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                            VerticalAlign="Bottom" />
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" 
                            Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                    </asp:Calendar>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Observações:</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Height="59px" 
                        Width="333px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Convênio:</td>
                <td>
                    <asp:DropDownList ID="drpConvenio" runat="server" DataSourceID="dsConvenio" 
                        DataTextField="descricao" DataValueField="idcon">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Médico Responsável</td>
                <td>
                    <asp:DropDownList ID="drpMed" runat="server" DataSourceID="dsMedico" 
                        DataTextField="nome" DataValueField="idmed">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    <asp:Button ID="Button1" runat="server" Text="Salvar" onclick="Button1_Click" 
            Height="28px" />
    
    <asp:ObjectDataSource ID="dsPaciente" runat="server" 
        SelectMethod="getAllPacientes" TypeName="Negocio.Fachada" 
        DataObjectTypeName="Classes_Básicas.Paciente">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsConvenio" runat="server" SelectMethod="getAllConvenio" 
        TypeName="Negocio.Fachada"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsMedico" runat="server" SelectMethod="getAllMedicos" 
        TypeName="Negocio.Fachada"></asp:ObjectDataSource>
</asp:Content>
