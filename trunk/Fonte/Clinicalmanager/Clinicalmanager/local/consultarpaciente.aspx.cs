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

namespace Clinicalmanager.local
{
    public partial class consultarpaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConsPac_Click(object sender, EventArgs e)
        {
            Request.QueryString["nome"] = "R%";
            this.ObjectDataSource1.Select();
        }
    }
}
