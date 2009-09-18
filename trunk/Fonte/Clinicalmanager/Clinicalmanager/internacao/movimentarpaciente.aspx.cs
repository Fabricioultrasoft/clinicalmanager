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
namespace Clinicalmanager.internacao
{
    public partial class movimentarpaciente : System.Web.UI.Page
    {
        Fachada fachada;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnMovimentar_Click(object sender, EventArgs e)
        {
            int idint=0;
            if (Request.Params["idint"] != null)
            {
                 idint = int.Parse(Request.Params["idint"]);
            }
            int idloc = int.Parse(drpLocal.SelectedValue);
            fachada = new Fachada();
            fachada.movimentarPaciente(idint, idloc, dtIn.SelectedDate, dtIn.SelectedDate, txtObs.Text);
        }
    }
}
