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

        public DataSet consultarTodas()
        {
            return rep.consultarTodas();
        }
        #region CRUD

        public void inserir(Internacao inter)
        {
            rep.inserir(inter);
        }

        public void atualizar(Internacao inter)
        {
            rep.atualizar(inter);
        }

        public void exluir(Internacao inter)
        {
            rep.excluir(inter);
        }

        #endregion

        #region Crud Members


        public Internacao consultar(int id_internacao)
        {
            return rep.consultar(id_internacao);
        }
        #endregion
    }
}
