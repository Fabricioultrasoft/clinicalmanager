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
    public class CadastroPaciente
    {
        private RepositorioPaciente rep;
        public CadastroPaciente()
        {
            rep = new RepositorioPaciente();
        }

        public DataSet consultarTodos()
        {            
            return rep.consultarTodos();
        }
        #region CRUD

        public void inserir(Paciente pac)
        {
            rep.inserir(pac);
        }

        public void remover(object obj)
        {

        }

        public void atualizar(object obj)
        {

        }

        public void exluir(object obj)
        {

        }

        #endregion

        #region Crud Members


        public Paciente consultar(string nome)
        {
            return rep.consultar(nome);
        }

        #endregion
    }
}
