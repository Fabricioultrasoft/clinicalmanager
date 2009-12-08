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
    public partial class consultarfatura : System.Web.UI.Page
    {
        Fachada facade;
        protected void Page_Load(object sender, EventArgs e)
        {
            facade = new Fachada();
        }

        protected void btnConsulta_Click(object sender, EventArgs e)
        {
            grdFatura.Visible = true;
        }

        protected void grdFatura_Init(object sender, EventArgs e)
        {
            grdFatura.Visible = false;
        }
    }
}
