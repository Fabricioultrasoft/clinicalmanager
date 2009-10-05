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
            internacao = fachada.getInformacaoInternacao(int.Parse(Request.Params["idint"]));
            txtDataEntrada.Text = internacao.Data_in.ToShortDateString();
            txtPlano.Text = internacao.Convenio.Descricao;
            if (!IsPostBack)
            {
                txtDataSaida.Text = DateTime.Now.ToShortDateString();
            }
            DateTime dataOut = DateTime.Parse(txtDataSaida.Text);
            int qtdDias = (dataOut - internacao.Data_in).Days;
            lbQtdDias.Text = qtdDias.ToString();
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
