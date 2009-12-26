<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="itensfatura.aspx.cs" Inherits="Clinicalmanager.fatura.itensfatura" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" DataSourceID="dsItensFatura">
            <Columns>
                <asp:TemplateField></asp:TemplateField>
            </Columns>
        </asp:GridView>
    
    </div>
    <asp:ObjectDataSource ID="dsItensFatura" runat="server"></asp:ObjectDataSource>
    </form>
</body>
</html>
