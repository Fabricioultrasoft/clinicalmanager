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
using Classes_Básicas;
using Negocio;
namespace Clinicalmanager
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //this.dsMedico.SelectParameters.Add("idpac", Context.Request.Params["idpac"]);            
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Internacao inter = new Internacao();
            inter.Codint = Convert.ToInt16(GridView1.Rows[e.RowIndex].Cells[1].Text);
            Fachada fachada = new Fachada();
            fachada.excluirInternacao(inter);
        }

       
            
       
      
       
    }
}
