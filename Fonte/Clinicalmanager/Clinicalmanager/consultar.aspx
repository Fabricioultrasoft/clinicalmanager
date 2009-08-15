<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="consultar.aspx.cs" Inherits="Clinicalmanager.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>Untitled Page</title>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
</head>
<body>


<form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="dsMedico">
        <Columns>
            <asp:BoundField DataField="nome" HeaderText="Nome" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="dsMedico" runat="server" 
        SelectMethod="getAllMedicos" TypeName="Negocio.Fachada">
    </asp:ObjectDataSource>
    </form>
</body>
</html>
