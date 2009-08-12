<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Clinicalmanager._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataSourceID="dsPac" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="nome" HeaderText="Nome" />
            </Columns>
        </asp:GridView>
    </div>
    
    <asp:ObjectDataSource ID="dsPac" runat="server" onselecting="dsPac_Selecting" TypeName="Negocio.Fachada"
     SelectMethod="getAllPacientes">
    </asp:ObjectDataSource>
    </form>
</body>
</html>
