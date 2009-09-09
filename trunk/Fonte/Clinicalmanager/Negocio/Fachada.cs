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
        public string inserirPaciente(Paciente paciente)
        {
            return capPac.inserir(paciente);
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
        public string inserirMedico(Medico medico)
        {
            return cadMed.inserirMedico(medico);
        }
        #endregion

        #region Localidades
        public DataSet getAllLocal()
        {
            return cadLoc.consultarTodos();
        }
        public string inserirLocal(Local local)
        {
            return cadLoc.inserirLocal(local);
        }
        #endregion

        #region INTERNACAO
        public DataSet getInternacaoPacienteNome(string nome, string andamento)
        {
            return cadInt.consultarPorPacienteNome(nome, andamento);
        }
        public DataSet getInternacaoPaciente(int idpac)
        {
            return cadInt.consultarPorPaciente(idpac);
        }
        public string inserirInternacao(Internacao internacao)
        {
            return cadInt.inserir(internacao);
        }
        public void excluirInternacao(Internacao idint)
        {
            cadInt.excluir(idint);
        }
        public void liberarInternacao(Internacao internacao, DateTime data_saida, float valor_hn)
        {
            cadInt.liberarInternacao(internacao, data_saida, valor_hn);
        }
        #endregion
        #region Convênio
        public DataSet getAllConvenio()
        {
            return cadCon.getAllConenio();
        }
        public Convenio getConveniobyId(int idconv)
        {
            return cadCon.getConveniobyId(idconv);
        }
        public void inserirConvenio(Convenio convenio)
        {
        }
        #endregion
    }
}
