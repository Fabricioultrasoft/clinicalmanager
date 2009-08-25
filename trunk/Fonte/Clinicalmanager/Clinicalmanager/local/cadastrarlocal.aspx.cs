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
namespace Clinicalmanager.local
{
    public partial class cadastrarlocal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            Fachada fachada = Fachada.getInstancia();
            Local local = new Local();
            local.Descricao = txtDescricao.Text;
            local.Geraprd = chkPrd.Checked;
            local.Andar = Convert.ToInt16(drpAndar.SelectedValue);
            fachada.inserirLocal(local);
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            Response.Redirect(e.Item.Target.ToString());
        }
    }
}
