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
namespace Clinicalmanager.internacao
{
    public partial class liberarinternacao : System.Web.UI.Page
    {
        Fachada fachada;
        Internacao internacao;

        protected void Page_Load(object sender, EventArgs e)
        {
            fachada = new Fachada();
            txtDataSaida.Text = DateTime.Now.ToShortDateString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            internacao = new Internacao();
            internacao.Codint = int.Parse( Request.Params["idint"]);
            fachada.liberarInternacao(internacao, DateTime.Parse(txtDataSaida.Text),
                float.Parse(txtValorHn.Text));
        }
    }
}
