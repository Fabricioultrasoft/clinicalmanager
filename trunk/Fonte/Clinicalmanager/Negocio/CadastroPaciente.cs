using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Npgsql;
using AcessoDados;
using System.Data;
namespace Negocio
{
    public class CadastroPaciente: Crud
    {
        public DataSet consultarTodos()
        {
            AcessoDados.RepositorioPaciente rep = new RepositorioPaciente();
            return rep.consultarTodos();
        }
        #region Crud Members

        public void inserir(object obj)
        {

            throw new NotImplementedException();
        }

        public void remover(object obj)
        {
            throw new NotImplementedException();
        }

        public void atualizar(object obj)
        {
            throw new NotImplementedException();
        }

        public void exluir(object obj)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}
