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
using Classes_Básicas;
using Negocio;
namespace Clinicalmanager
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dsPac_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {

        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            /*Paciente paciente = new Paciente();
            paciente.Nome = txtPessoa.Text;
            paciente.CPF = txtCPF.Text;
            Fachada facade = new Fachada();
            facade.inserirPaciente(paciente);*/
            Response.Redirect("consultar.aspx?idpac="+txtPessoa.Text);
        }
    }
}
