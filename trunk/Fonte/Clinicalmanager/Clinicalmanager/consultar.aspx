<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="consultar.aspx.cs" Inherits="Clinicalmanager.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>Untitled Page</title>
</head>
<body>
    

<form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" 
        DataSourceID="dsMedico">
    </asp:GridView>
    <asp:ObjectDataSource ID="dsMedico" runat="server" 
        SelectMethod="getInternacaoPaciente" TypeName="Negocio.Fachada">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="idpac" 
                QueryStringField="idpac" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </form>
</body>
</html>
