<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="consultarlocal.aspx.cs"
    Inherits="Clinicalmanager.local.consultarlocal" MasterPageFile="~/master.Master"%>


<asp:Content ID="consLoc" ContentPlaceHolderID="contentHolder" runat="server">


    <div id="parCons">
        <table style="width: 100%; text-align: left;">
            <tr>
                <td class="style1">
                    <asp:Label ID="lblDesc" runat="server" Text="Descrição"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDesc" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="lblAndar" runat="server" Text="Andar"></asp:Label>
                </td>
                <td>
                    <asp:ListBox ID="lstAndar" runat="server" Height="116px" 
                        SelectionMode="Multiple" Width="116px">
                        <asp:ListItem Value="todos">&lt;todos&gt;</asp:ListItem>
                        <asp:ListItem Value="1">1º</asp:ListItem>
                        <asp:ListItem Value="2">2º</asp:ListItem>
                        <asp:ListItem Value="3">3º</asp:ListItem>
                        <asp:ListItem Value="4">4º</asp:ListItem>
                        <asp:ListItem Value="5">5º</asp:ListItem>
                        <asp:ListItem Value="6">6º</asp:ListItem>
                        <asp:ListItem Value="7">7º</asp:ListItem>
                        <asp:ListItem Value="8">8º</asp:ListItem>
                        <asp:ListItem Value="9">9º</asp:ListItem>
                        <asp:ListItem Value="10">10º</asp:ListItem>
                    </asp:ListBox>
                </td>
            </tr>
            </table>
        <asp:Button ID="btnConsulta" runat="server" Text="Consulta" 
            onclick="btnConsulta_Click" />
    </div>
    <div id="result">
        <asp:GridView ID="grdLocal" runat="server" DataSourceID="dsLocal" 
            BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
            CellPadding="4" GridLines="Horizontal" AutoGenerateColumns="False" DataKeyNames="idloc">            
            <RowStyle BackColor="White" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="idloc" HeaderText="ID" />
                <asp:BoundField DataField="nome" HeaderText="Desc" />
                <asp:BoundField DataField="andar" HeaderText="Andar" />
                <asp:CheckBoxField DataField="gera_prd" HeaderText="Produtividade" />
                <asp:CommandField DeleteText="excluir" ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:ObjectDataSource ID="dsLocal" runat="server" SelectMethod="getLocalbyDesc" 
            TypeName="Negocio.Fachada" DeleteMethod="excluirLocal">
            <DeleteParameters>
                <asp:Parameter Name="idloc" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtDesc" Name="desc" PropertyName="Text" 
                    Type="String" DefaultValue="%"/>
                <asp:ControlParameter ControlID="lstAndar" Name="andar" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>


</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">

    <style type="text/css">
        .style1
        {
            width: 95px;
        }
    </style>

</asp:Content>

