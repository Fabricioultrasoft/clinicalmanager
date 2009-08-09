using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Classes_Básicas;
using Npgsql;
namespace AcessoDados
{
    public class RepositorioPaciente:Negocio.Crud
    {
        public RepositorioPaciente()
        {

        }
        #region Crud Members

        public void inserir(object obj)
        {
            Paciente paciente = (Classes_Básicas.Paciente)obj;
           
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
