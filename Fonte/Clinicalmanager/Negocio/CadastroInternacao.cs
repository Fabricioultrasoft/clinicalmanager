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

        public void excluir(Internacao inter)
        {
            rep.excluir(inter);
        }

        public Internacao consultar(int idint)
        {
            return rep.consultar(idint);
        }
        public DataSet consultarPorPaciente(int idpac)
        {
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
    }
}
