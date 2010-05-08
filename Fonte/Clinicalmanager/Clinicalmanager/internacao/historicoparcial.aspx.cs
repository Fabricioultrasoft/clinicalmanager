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

namespace Clinicalmanager.internacao
{
    public partial class historicoparcial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Fachada fachada = new Fachada();
            Int32 idint = Int32.Parse(Request.Params["idint"]);
            Internacao inter = fachada.getInformacaoInternacao(idint);
            lbProntuario.Text = inter.Paciente.CodProntuario.ToString();
            lbPaciente.Text = inter.Paciente.Nome;
            lbData_in.Text = inter.Data_in.ToShortDateString();
        }
        
        protected void btnPagar_Click(object sender, EventArgs e)
        {
            Eval("idpar");
        }

        protected void grdParcial_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow) 
            {
            DataRowView data =  ((DataRowView)e.Row.DataItem);
            bool paga = ((bool)data.Row["paga"]);
            if (!paga)
            {
                Button teste = (Button)e.Row.FindControl("btnPagar");                
                teste.Enabled = true;
            }
            }

            //((DataRowView)e.Row.DataItem)["paga"]

            
        }

        protected void grdParcial_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "pagar")
            {
                string idint = Request.Params["idint"];
                string idpar = e.CommandArgument.ToString();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "pagar("+idint+","+idpar+");", true);
            }
        }
      

    }
}
