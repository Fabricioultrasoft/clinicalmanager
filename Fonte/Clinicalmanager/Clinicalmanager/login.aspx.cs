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
namespace Clinicalmanager
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

 
        protected void Button1_Click1(object sender, EventArgs e)
        {
            string login = txtLogin.Text;
            string pass = txtPass.Text;
            Fachada fachada = new Fachada();
            bool logado = fachada.login(login, pass);
            if (logado)
                FormsAuthentication.RedirectFromLoginPage("admin", false);
            else FormsAuthentication.RedirectToLoginPage();
        }
    }
}
