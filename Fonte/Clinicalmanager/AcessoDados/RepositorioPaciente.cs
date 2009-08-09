using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Classes_Básicas;
using Npgsql;
using System.Data;
namespace AcessoDados
{
    public class RepositorioPaciente:Conexao, Negocio.Crud

    {
        public RepositorioPaciente():base()
        {
            
        }
        #region Crud Members

        public void inserir(object obj)
        {
            Paciente paciente = (Classes_Básicas.Paciente)obj;
           
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

  
        public void consultar(object obj)
        {
            throw new NotImplementedException();
        }

        #endregion
        public DataSet consultarTodos()
        {
            string sql = "select * from clinicalmanager.paciente";
            return base.execute(sql);
        }
    }
}
