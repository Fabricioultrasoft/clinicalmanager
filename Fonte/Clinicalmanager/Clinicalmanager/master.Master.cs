﻿using System;
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
          if (Session["login"] == null) Server.Transfer("/login.aspx");
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            Server.Transfer(e.Item.Target.ToString(),true);
        }
    }
}