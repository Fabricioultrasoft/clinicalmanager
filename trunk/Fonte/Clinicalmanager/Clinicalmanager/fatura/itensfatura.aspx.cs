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


namespace Clinicalmanager.fatura
{
    public partial class itensfatura : System.Web.UI.Page
    {
        Int32 idint;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        

        protected void btnAdd_Command(object sender, CommandEventArgs e)
        {
            Int32 codprontuario = Int32.Parse(e.CommandArgument.ToString());
            
        }

        protected void codProntuario_TextChanged(object sender, EventArgs e)
        {
            CadastroInternacao cad = new CadastroInternacao();
            Int32 codprontuario = Int32.Parse(codProntuario.Text);
            lbPaciente.Text = cad.getNomeProntuario(codprontuario);
        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            Int32 idfat = Int32.Parse(Request.Params["idfat"]);
            CadastroFatura cadFat = new CadastroFatura();
            Int32 codprontuario = Int32.Parse(codProntuario.Text);
            idint = cadFat.getUltimaInternacao(codprontuario).Codint;
            float valor = float.Parse(txtValor.Text);
                cadFat.inserirItemFatura(idint, idfat, valor);
                
        }

        protected void grdItem_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
