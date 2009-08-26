<%@ Page Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="cadastrarinternacao.aspx.cs" Inherits="Clinicalmanager.internacao.cadasatrarinternacao" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 166px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style1">
                    Paciente:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        DataSourceID="ObjectDataSource1" DataTextField="nome" DataValueField="cpf" 
                                        AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    CPF:</td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" Enabled="false"></asp:TextBox>
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
        </table>
    </p>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="getAllPacientes" TypeName="Negocio.Fachada">
    </asp:ObjectDataSource>
</asp:Content>
