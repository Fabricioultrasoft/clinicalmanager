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

        public Fachada()
        {
            capPac = new CadastroPaciente();
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
    }
}
