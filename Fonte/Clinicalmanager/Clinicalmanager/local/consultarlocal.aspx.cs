using System;
using System.Collections.Generic;
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
using System.Net.Mail;
using System.Net;
using Negocio;
namespace Clinicalmanager.local
{
    public partial class consultarlocal : System.Web.UI.Page
    {
        //Fachada fachada;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            Response.Redirect(e.Item.Target.ToString());
        }

        protected void btnConsulta_Click(object sender, EventArgs e)
        {

            IList<ListItem> selectedItens = new List<ListItem>();
            foreach (ListItem item in lstAndar.Items)
            {
                if (item.Selected)
                {
                    selectedItens.Add(item);
                }
            }
            
            ((master)Master).StatusLabel = "";
        }

        protected void dsLocal_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
        {
            ((master)Master).StatusLabel = e.ReturnValue.ToString();
        }

    }
}
