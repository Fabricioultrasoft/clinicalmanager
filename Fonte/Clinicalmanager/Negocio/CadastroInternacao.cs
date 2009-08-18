using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Npgsql;
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

        public DataSet consultarTodos()
        {
            return rep.consultarTodos();
        }

        public void inserir(Internacao inter)
        {
            rep.inserir(inter);
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
    }
}
