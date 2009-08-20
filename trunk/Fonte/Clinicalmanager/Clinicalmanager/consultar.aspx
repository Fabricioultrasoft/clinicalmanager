<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="consultar.aspx.cs" Inherits="Clinicalmanager.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>Untitled Page</title>
</head>
<body>
    

<form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" 
        DataSourceID="dsMedico" AllowPaging="True" onrowdeleting="GridView1_RowDeleting" 
          >
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        
    </asp:GridView>
    <asp:ObjectDataSource ID="dsMedico" runat="server" 
        SelectMethod="getInternacaoPaciente" TypeName="Negocio.Fachada" 
        DeleteMethod="excluirInternacao" DataObjectTypeName="Classes_Básicas.Internacao">              
      <SelectParameters>
      <asp:QueryStringParameter Name="idpac" DbType="Int16" DefaultValue="1" QueryStringField="idpac" />
      </SelectParameters>        
    </asp:ObjectDataSource>
    </form>
</body>
</html>
