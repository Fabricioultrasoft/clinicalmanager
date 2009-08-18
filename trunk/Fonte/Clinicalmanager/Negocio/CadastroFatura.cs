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
    public class CadastroFatura
    {
        private RepositorioFatura rep;
        public CadastroFatura()
        {
            rep = new RepositorioFatura();
        }

        public DataSet consultarTodos()
        {
            return rep.consultarTodos();
        }
        #region CRUD

        public void inserir(Fatura fat)
        {
            rep.inserir(fat);
        }

        public void atualizar(Fatura fat)
        {
            rep.atualizar(fat);
        }

        public void exluir(Fatura fat)
        {
            rep.exluir(fat);
        }

        #endregion

        #region Crud Members


        public Fatura consultar(int id_fatura)
        {
            return rep.consultar(id_fatura);
        }
        #endregion
    }
}
