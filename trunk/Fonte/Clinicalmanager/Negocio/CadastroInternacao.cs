using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AcessoDados;
using System.Data;
using Classes_Básicas;
namespace Negocio
{
    public class CadastroInternacao
    {
        private RepositorioInternacao rep;
        public CadastroInternacao()
        {
            rep = new RepositorioInternacao();
        }
        public void liberarInternacao(Internacao internacao, DateTime data_saida, float valor)
        {
            rep.liberarInternacao(internacao, data_saida, valor);
        }
        public DataSet consultarTodos()
        {
            return rep.consultarTodos();
        }

        public string inserir(Internacao inter)
        {
            return rep.inserir(inter);
        }

        public void atualizar(Internacao inter)
        {
            rep.atualizar(inter);
        }

        public void excluir(Int32 inter)
        {
            rep.excluir(inter);
        }

        public Internacao consultar(int idint)
        {
            return rep.consultar(idint);
        }
        public DataSet consultarPorPaciente(string param)
        {
            Int32 idpac = Int32.Parse(param);
            return rep.consultarPorPaciente(idpac);
        }
        public DataSet consultarPorPacienteNome(string nome, string andamento)
        {
            return rep.consultarPorPacienteNome(nome, andamento);
        }
        public string movimentarPaciente(int idint, int idloc, DateTime data_in_loc, DateTime data_out_loc, string obs_loc)
        {
            return rep.movimentarPaciente(idint, idloc, data_in_loc, data_out_loc, obs_loc);

        }
        public DataSet historicoMovimentacao(int idint)
        {
            return rep.historicoMovimentacao(idint);
        }
        public Internacao getInformacaoInternacao(int idint)
        {
            return rep.preLiberarInternacao(idint);
        }
        public String getNomeProntuario(Int32 codprontuario)
        {
            return rep.getNomePaciente(codprontuario);
        }
        public string excluirMovimentacao(Int32 idint, Int32 idloc, DateTime data_in_loc)
        {
            return rep.excluirMovimentacao(idint, idloc, data_in_loc);
        }
        public string incluirParcial(Int32 idint, DateTime data_in_par, DateTime data_fim_par, Int32 qtd_visitas)
        {
            return rep.incluirParcial(idint, data_in_par, data_fim_par, qtd_visitas);
        }
        public string excluirParcial(Int32 idpar, Int32 idint)
        {
            return rep.excluirParcial(idpar, idint);
        }
        public DataSet historicoParcial(Int32 idint)
        {
            return rep.historicoParcial(idint);   
        }
    }
}
