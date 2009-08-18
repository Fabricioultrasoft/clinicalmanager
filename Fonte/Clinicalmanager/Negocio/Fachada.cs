using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AcessoDados;
using System.Data;
using Classes_Básicas;
namespace Negocio
{
    public class Fachada
    {
        private CadastroPaciente capPac;
        private CadastroMedico cadMed;
        private CadastroLocal cadLoc;
        private CadastroInternacao cadInt;
        private CadastroFatura cadFat;
        private CadastroConvenio cadCon;
               
        public Fachada()
        {
            capPac = new CadastroPaciente();
            cadMed = new CadastroMedico();
            cadLoc = new CadastroLocal();
            cadCon = new CadastroConvenio();
            cadFat = new CadastroFatura();
            cadInt = new CadastroInternacao();
        }
        
        public void excluirPaciente(int idpac)
        {

        }
        public void inserirPaciente(Paciente paciente)
        {
            capPac.inserir(paciente);
        }
        public Paciente getPaciente(string nome)
        {
            return capPac.consultar(nome);
        }

        public DataSet getAllPacientes()
        {
            return capPac.consultarTodos();
        }
        public DataSet getAllMedicos()
        {
            return cadMed.consultarTodos();
        }

        public DataSet getAllLocal()
        {
            return cadLoc.consultarTodos();
        }

        public DataSet getInternacaoPaciente(int idpac)
        {
            return cadInt.consultarPorPaciente(idpac);
        }
    }
}
