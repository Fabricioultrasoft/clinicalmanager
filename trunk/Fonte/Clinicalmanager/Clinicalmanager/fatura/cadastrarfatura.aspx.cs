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
namespace Clinicalmanager.fatura
{
    public partial class cadastrarfatura : System.Web.UI.Page
    {
        Fachada fachada;
        Fatura fatura;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            fachada = new Fachada();
            fatura = new Fatura();
            fatura.Codigo_HP = txtCodFat.Text;
            fatura.Data_fechamento = DateTime.Parse(txtDataRec.Text);
            fatura.Data_inicio = DateTime.Parse(txtDataInicio.Text);
            fatura.Data_fim = DateTime.Parse(txtDataFim.Text);
            fatura.Mes_referencia = int.Parse(drpMes.SelectedValue);
            fatura.Tipo = drpTipo.SelectedValue.ToCharArray()[0];
            ((master)Master).StatusLabel = fachada.inserirFatura(fatura);
        }
    }
}
