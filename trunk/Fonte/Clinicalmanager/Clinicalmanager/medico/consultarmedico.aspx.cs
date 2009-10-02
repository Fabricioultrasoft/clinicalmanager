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
namespace Clinicalmanager.medico
{
    public partial class consultarmedico : System.Web.UI.Page
    {
        Fachada fachada;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            fachada = new Fachada();
            int index = int.Parse(e.CommandArgument.ToString());
            int idmed = int.Parse(this.GridView1.DataKeys[index].Value.ToString());
            ((master)Master).StatusLabel = fachada.excluirMedico(idmed);
        }

       

    }
}
