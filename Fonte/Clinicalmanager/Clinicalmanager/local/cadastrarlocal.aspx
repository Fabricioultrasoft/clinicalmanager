<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="cadastrarlocal.aspx.cs"
    Inherits="Clinicalmanager.local.cadastrarlocal" MasterPageFile="~/master.Master"%>
<asp:Content ID="cadLoc" ContentPlaceHolderID="contentHolder" runat="server">
            <h1 style="margin: 5px">
                Cadastro de localidades</h1>
            <table style="margin: 4px; width: 100%;">
                <tr>
                    <td class="style1">
                        Descrição:
                    </td>
                    <td class="style3">
                        &nbsp;
                        <asp:TextBox ID="txtDescricao" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Andar:
                    </td>
                    <td>
                        &nbsp;
                        <asp:DropDownList ID="drpAndar" runat="server">
                            <asp:ListItem Value="1">1º</asp:ListItem>
                            <asp:ListItem Value="2">2º</asp:ListItem>
                            <asp:ListItem Value="3">3º</asp:ListItem>
                            <asp:ListItem Value="4">4º</asp:ListItem>
                            <asp:ListItem Value="5">5º</asp:ListItem>
                            <asp:ListItem Value="6">6º</asp:ListItem>
                            <asp:ListItem Value="7">7º</asp:ListItem>
                            <asp:ListItem Value="8">8º</asp:ListItem>
                            <asp:ListItem Value="9">9º</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Produtividade:
                    </td>
                    <td>
                        <asp:CheckBox ID="chkPrd" runat="server" />
                    </td>
                </tr>
            </table>
            <asp:Button ID="btnSalvar" runat="server" OnClick="btnSalvar_Click" Text="Salvar" />
        </div>
        </form>
    </div>
</asp:Content>
