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

        protected void dsMedico_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
        {
            ((master)Master).StatusLabel = e.ReturnValue.ToString();
        }

        

       

    }
}
