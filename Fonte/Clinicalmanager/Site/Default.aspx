<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Site._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Real Instituto do Pulmão</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:postgresqlConnString %>"
        ProviderName="<%$ ConnectionStrings:postgresqlConnString.ProviderName %>"
        SelectCommand="SELECT * FROM clinicalmanager.paciente">
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1"
        runat="server"
        AllowPaging="True"
        AllowSorting="True"
        DataSourceID="SqlDataSource1" >
    </asp:GridView>
    </div>
    </form>
</body>
</html>
