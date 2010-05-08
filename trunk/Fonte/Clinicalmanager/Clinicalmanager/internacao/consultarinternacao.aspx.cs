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
            string idpac = Request.Params["idpac"];
            if ( idpac != null)
            {
                dsInternacao.SelectMethod = "getInternacaoPaciente";
                dsInternacao.SelectParameters.Clear();
                dsInternacao.SelectParameters.Add("idpac",idpac);
                grdInternacao.Visible = true;
            }
        }

        #region Botões para mostrar calendário
        
      
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


        protected void grdInternacao_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "pagar")
            {
                Int32 idint = Int32.Parse(e.CommandArgument.ToString());
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "pagar(" + idint +");", true);
            }
            if (e.CommandName == "parcial")
            {
                Int32 idint = Int32.Parse(e.CommandArgument.ToString());
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "parcial(" + idint + ");", true);
            }
            if (e.CommandName == "movimentar")
            {
                Int32 idint = Int32.Parse(e.CommandArgument.ToString());
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "movimentar(" + idint + ");", true);
            }
            if (e.CommandName == "liberar")
            {
                Int32 idint = Int32.Parse(e.CommandArgument.ToString());
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alta(" + idint + ");", true);
            }
        }

        protected void grdInternacao_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView data = ((DataRowView)e.Row.DataItem);
                string data_fim = data.Row["data_out"].ToString();
                if (!data_fim.Equals(""))
                {
                    Button btnPagar = (Button)e.Row.FindControl("btnPagar");
                    btnPagar.Enabled = true;
                    Button btnParcial = (Button)e.Row.FindControl("btnParcial");
                    btnParcial.Enabled = false;
                    Button btnMovimentar = (Button)e.Row.FindControl("btnMovimentar");
                    btnMovimentar.Enabled = false;
                    Button btnLiberar = (Button)e.Row.FindControl("btnLiberar");
                    btnLiberar.Enabled = false;
                }
            }
        }
    }
}
