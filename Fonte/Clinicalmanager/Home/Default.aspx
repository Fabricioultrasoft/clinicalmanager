<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Home._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<link href="default.css" rel="stylesheet" type="text/css" />
    <title>Real Instituto do Pulmão</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="logo">
    <h2>
    Real Instituto do Pulmão</h2>
    </div>
    <div id="page">
    <h1>em construção</h1>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1">
        </asp:GridView>
        
    </div>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="consultarTodos" TypeName="AcessoDados.Teste">
        </asp:ObjectDataSource>
    </form>
</body>
</html>
