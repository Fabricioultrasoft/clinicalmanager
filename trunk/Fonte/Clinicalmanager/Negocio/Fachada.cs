using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AcessoDados;
using System.Data;
using Classes_Básicas;
namespace Negocio
{
    /// <summary>
    /// Singleton para conexão com banco.
    /// </summary>
    public class Fachada
    {
        private CadastroPaciente capPac;
        private CadastroMedico cadMed;
        private CadastroLocal cadLoc;
        private CadastroInternacao cadInt;
        private CadastroFatura cadFat;
        private CadastroConvenio cadCon;
        private static Fachada instancia;
        public Fachada()
        {
            capPac = new CadastroPaciente();
            cadMed = new CadastroMedico();
            cadLoc = new CadastroLocal();
            cadCon = new CadastroConvenio();
            cadFat = new CadastroFatura();
            cadInt = new CadastroInternacao();
        }
        public static Fachada getInstancia()
        {
            if (instancia == null) return new Fachada();
            else return instancia;
        }

        #region PACIENTE
        public void excluirPaciente(int idpac)
        {
            Paciente pac = new Paciente();
            pac.Idpac=idpac;
            capPac.exluir(pac);
        }
        public void inserirPaciente(Paciente paciente)
        {
            capPac.inserir(paciente);
        }
        public DataSet getPaciente(string nome)
        {
            return capPac.consultar(nome);
        }
        public Paciente getPacientebyID(int idpac)
        {
            return capPac.consultar(idpac);
        }
        public DataSet getPacienteCpf(string cpf)
        {
            return capPac.consultarCpf(cpf);
        }

        public DataSet getAllPacientes()
        {
            return capPac.consultarTodos();
        }
        #endregion

        #region Medicos
        public DataSet getAllMedicos()
        {
            return cadMed.consultarTodos();
        }
        #endregion

        #region Localidades
        public DataSet getAllLocal()
        {
            return cadLoc.consultarTodos();
        }
        public void inserirLocal(Local local)
        {
            cadLoc.inserirLocal(local);
        }
        #endregion

        #region INTERNACAO
        public DataSet getInternacaoPaciente(int idpac)
        {
            return cadInt.consultarPorPaciente(idpac);
        }
        public void inserirInternacao(Internacao internacao)
        {
            cadInt.inserir(internacao);
        }
        public void excluirInternacao(Internacao idint)
        {
            cadInt.excluir(idint);
        }
        #endregion
    }
}
