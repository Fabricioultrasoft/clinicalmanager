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
        public bool login(String user, String pass)
        {
            RepositorioUsuario rep = new RepositorioUsuario();
            return rep.login(user, pass);
        }

        #region PACIENTE
        public string excluirPaciente(int idpac)
        {
            Paciente pac = new Paciente();
            pac.Idpac=idpac;
            return capPac.exluir(pac);
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
        public string excluirMedico(Int32 idmed)
        {
            return cadMed.excluirMedico(idmed);
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
        public DataSet getLocalbyDesc(string desc, string andar)
        {
            return cadLoc.getLocalbyDesc(desc, andar);
        }
        public string excluirLocal(int idloc)
        {
            Local local = new Local();
            local.Codloc = idloc;
            return cadLoc.excluirLocal(local);
        }
        #endregion

        #region INTERNACAO
        public DataSet historicoMovimentacao(int idint)
        {
            return cadInt.historicoMovimentacao(idint);
        }
        public string movimentarPaciente(int idint, int idloc, DateTime data_in_loc, DateTime data_out_loc, string obs_loc)
        {
           return cadInt.movimentarPaciente(idint, idloc, data_in_loc, data_out_loc, obs_loc);
        }
        public string exluirMovimentacao(Int32 idint, Int32 idloc, DateTime data_in_loc)
        {
            return cadInt.excluirMovimentacao(idint,idloc,data_in_loc);
        }
        public DataSet getInternacaoPacienteNome(string nome, string andamento)
        {
            return cadInt.consultarPorPacienteNome(nome, andamento);
        }
        public DataSet getInternacaoPaciente(string idpac)
        {
            return cadInt.consultarPorPaciente(idpac);
        }
        public string inserirInternacao(Internacao internacao)
        {
            return cadInt.inserir(internacao);
        }
        public void excluirInternacao(Int32 idint)
        {
            cadInt.excluir(idint);
        }
        public void liberarInternacao(Internacao internacao, DateTime data_saida, float valor_hn)
        {
            cadInt.liberarInternacao(internacao, data_saida, valor_hn);
        }
        public Internacao getInformacaoInternacao(int idint)
        {
            return cadInt.getInformacaoInternacao(idint);
        }
        public string incluirParcial(Int32 idint, DateTime data_in_par, DateTime data_fim_par, Int32 qtd_visitas)
        {
            return cadInt.incluirParcial(idint, data_in_par, data_fim_par, qtd_visitas);
        }
        public string excluirParcial(Int32 idpar, Int32 idint)
        {
            return cadInt.excluirParcial(idpar, idint);
        }
        public DataSet historicoParcial(Int32 idint)
        {
            return cadInt.historicoParcial(idint);
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

        #region Fatura

        public string inserirFatura(Fatura fatura)
        {
            return cadFat.inserir(fatura);
        }
        public DataSet getFaturaByCodigo(string codigo)
        {
            return cadFat.consultar(codigo);
        }

        public DataSet getDetalheFatura(int idfat)
        {
            RepositorioFatura repFat = new RepositorioFatura();
            return repFat.detalheFatura(idfat);
        }

        public string excluirItemFatura(int idfat, int idint)
        {
            RepositorioFatura repFat = new RepositorioFatura();
            return repFat.excluirItemFatura(idfat, idint);
        }
        public void incluirItemFatura(int idfat, int idint, float valor)
        {
            RepositorioFatura repFat = new RepositorioFatura();
            repFat.inserirItemFaturaTotal(idint, idfat, valor);
        }
        public DataSet listarItensParaIncluir(String codprontuario)
        {
            RepositorioFatura repFat = new RepositorioFatura();
            return repFat.listarItensParaIncluir(codprontuario);
        }
        public string pagarPacial(Int32 idint, Int32 idpar, float valor, Int32 idfat)
        {
            return cadFat.pagarPacial(idint, idpar, valor, idfat);
        }
        public Int32 consultarID(string codfat)
        {
            return cadFat.consultarID(codfat);
        }
        #endregion
        #region Relatorios
        public DataSet relatorioPacienteSemInternacao()
        {
            RepositorioInternacao rep = new RepositorioInternacao();
            return rep.listaPacienteSemFatura();
        }
        #endregion
    }
}
