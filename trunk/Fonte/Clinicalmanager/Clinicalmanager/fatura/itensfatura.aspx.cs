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

namespace Clinicalmanager.fatura
{
    public partial class itensfatura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        

        protected void btnAdd_Command(object sender, CommandEventArgs e)
        {
            Int32 codprontuario = Int32.Parse(e.CommandArgument.ToString());
            
        }
    }
}
