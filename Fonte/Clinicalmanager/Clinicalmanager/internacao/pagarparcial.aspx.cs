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
using Negocio;


namespace Clinicalmanager.internacao
{
    public partial class pagarparcial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPagar_Click(object sender, EventArgs e)
        {
            Fachada fachada = new Fachada();
            CadastroFatura cadFat = new CadastroFatura();
            Int32 idint = Int32.Parse(Request.Params["idint"]);
            Int32 idpar = Int32.Parse(Request.Params["idpar"]);
            float valor = float.Parse(txtValor.Text);
            Int32 idfat = fachada.consultarID(txtCodFatura.Text);
            string output = fachada.pagarPacial(idint, idpar, valor, idfat);
            Response.Write("<script>alert('" + output + "')</script>");       
        }
    }
}
