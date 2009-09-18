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
    public partial class consultarinternacao : System.Web.UI.Page
    {
        Fachada fachada = new Fachada();
        //Internacao internacao;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["idpac"] != null)
            {
                dsInternacao.SelectMethod = "getInternacaoPaciente";
                dsInternacao.SelectParameters.Clear();
                dsInternacao.SelectParameters.Add("idpac",Request.Params["idpac"]);
                grdInternacao.Visible = true;
            }
        }

        #region Botões para mostrar calendário
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (cldDataEntrada.Visible == false)
            {                
                cldDataEntrada.Visible = true;
            }
            else cldDataEntrada.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (cldDataSaida.Visible == false)

                cldDataSaida.Visible = true;
            else cldDataSaida.Visible = false;
        }
        protected void cldDataEntrada_SelectionChanged(object sender, EventArgs e)
        {
            txtDataEntrada.Text = cldDataEntrada.SelectedDate.ToShortDateString();
            cldDataEntrada.Visible = false;
        }

        protected void cldDataSaida_SelectionChanged(object sender, EventArgs e)
        {
            txtDataSaida.Text = cldDataSaida.SelectedDate.ToShortDateString();
            cldDataSaida.Visible = false;
        }
        #endregion
              

        protected void btnConsulta_Click(object sender, EventArgs e)
        {
            if (!txtDataEntrada.Text.Equals(""))
            {
                DateTime entrada = DateTime.Parse(txtDataEntrada.Text);
            }
            if (!txtDataSaida.Text.Equals(""))
            {
                DateTime saida = DateTime.Parse(txtDataSaida.Text);
            }
            grdInternacao.Visible = true;
        }

        protected void grdInternacao_Init(object sender, EventArgs e)
        {
            grdInternacao.Visible = false;
        }


    }
}
