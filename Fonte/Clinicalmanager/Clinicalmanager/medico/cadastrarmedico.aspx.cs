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
using Negocio;
using Classes_Básicas;
namespace Clinicalmanager.medico
{
    public partial class cadastrarmedico : System.Web.UI.Page
    {
        Fachada fachada;
        Medico medico;
        protected void Page_Load(object sender, EventArgs e)
        {
            fachada = new Fachada();
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            medico = new Medico();
            medico.Nome = txtNome.Text;
            ((master)Master).StatusLabel = fachada.inserirMedico(medico);
        }
    }
}
