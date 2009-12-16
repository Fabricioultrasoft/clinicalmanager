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

namespace Clinicalmanager
{
    public partial class master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         // if (Session["login"] == null) Server.Transfer("/login.aspx");
        }
        public String StatusLabel {
            set 
            {
                this.statusLabel.Text = value;
            }
        }
        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            Response.Redirect(e.Item.Target.ToString());
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("http://realinstitutodopulmao.com.br");
        }

        protected void help_click(object sender, EventArgs e)
        {
            String manual = Server.MapPath("~/manual.pdf");
            Response.ClearContent();
            Response.ClearHeaders();
            Response.ContentType = "application/pdf";
            Response.WriteFile(manual);
            Response.Flush();
            Response.Close();

        }
    }
}
