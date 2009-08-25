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
using Classes_Básicas;
using Negocio;
namespace Clinicalmanager.paciente
{
    public partial class cadastrar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            Fachada fachada = Fachada.getInstancia();
            Paciente paciente = new Paciente();
            paciente.CPF = txtCPF.Text;
            paciente.Nome = txtNome.Text;
            fachada.inserirPaciente(paciente);
            txtNome.Text = "";
            txtCPF.Text = "";
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            Response.Redirect(e.Item.Target.ToString());
            //Server.Transfer(e.Item.Target.ToString(), true);
        }
    }
}
