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
using Classes_Básicas;
namespace Clinicalmanager.fatura
{
    public partial class incluirparcial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CadastroInternacao cad = new CadastroInternacao();
            Internacao inter = cad.consultar(Int32.Parse(Request.Params["idint"]));
            lbProntuario.Text = inter.Paciente.CodProntuario.ToString();
        }

        protected void btnIncluir_Click(object sender, EventArgs e)
        {
            Fachada fachada = new Fachada();
            Int32 idint = Int32.Parse(Request.Params["idint"]);
            DateTime data_in_par = DateTime.Parse(txtData_in_par.Text);
            DateTime data_fim_par = DateTime.Parse(txtData_fim_par.Text);
            Int32 qtd_visitas = Int32.Parse(txtQtd_visitas.Text);
            string ouptut = fachada.incluirParcial(idint, data_in_par, data_fim_par, qtd_visitas);
            Response.Write("<script>alert('" + ouptut +"')</script>");            
        }
    }
}
