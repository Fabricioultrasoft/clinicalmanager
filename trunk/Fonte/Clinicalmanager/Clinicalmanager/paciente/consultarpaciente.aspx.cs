using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Drawing;

namespace Clinicalmanager.local
{
    public partial class consultarpaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!txtCPF.Text.Equals(""))
            {
                ObjectDataSource1.SelectParameters.RemoveAt(0);
                ObjectDataSource1.SelectParameters.Add("cpf", txtCPF.Text);
                ObjectDataSource1.SelectMethod = "getPacienteCpf";
            }
            else
            {
                ObjectDataSource1.SelectParameters.RemoveAt(0);
                ObjectDataSource1.SelectParameters.Add("nome", txtNome.Text);
                ObjectDataSource1.SelectMethod = "getPaciente";
            }
                
        }

        protected void ObjectDataSource1_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
        {
            ((master)Master).StatusLabel = e.ReturnValue.ToString();
        }

   
   

       
    }
}
