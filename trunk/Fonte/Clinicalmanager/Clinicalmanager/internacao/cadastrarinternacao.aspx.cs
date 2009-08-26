using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using Classes_Básicas;
using Negocio;
namespace Clinicalmanager.internacao
{
    public partial class cadastrarinternacao : System.Web.UI.Page
    {
        Fachada fachada = new Fachada();
        Paciente paciente = new Paciente();
        Internacao internacao = new Internacao();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCPF.Text = DropDownList1.DataSourceObject.GetView("cpf").ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

      

    }
}
