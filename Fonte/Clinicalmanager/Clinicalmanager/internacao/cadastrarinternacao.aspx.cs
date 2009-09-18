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
using Classes_Básicas;
using Negocio;
namespace Clinicalmanager.internacao
{
    public partial class cadastrarinternacao : System.Web.UI.Page
    {
        Fachada fachada = new Fachada();
        static Paciente paciente = new Paciente();
        Internacao internacao = new Internacao();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        private void clearForm()
        {
            TextBox2.Text = "";
            txtCPF.Text = "";
            DropDownList1.ClearSelection();
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                paciente = fachada.getPacientebyID(Int16.Parse(DropDownList1.SelectedValue));
                if (paciente.CPF != null)
                {
                    txtCPF.Text = paciente.CPF;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (paciente != null)
            {
                internacao.Paciente = paciente;
                Convenio conv = new Convenio();
                conv.Codcon =  Int16.Parse(drpConvenio.SelectedValue);
                internacao.Obs = TextBox2.Text;
                internacao.Convenio = conv;
                internacao.Data_in = Calendar1.SelectedDate;
                master resultado = (master)this.Master;
                resultado.StatusLabel = fachada.inserirInternacao(internacao);
                clearForm();                
            }
            
        }

      

    }
}
