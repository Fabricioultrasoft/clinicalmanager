using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AcessoDados;
using System.Data;
using Classes_Básicas;
namespace Negocio
{
    public class CadastroMedico
    {
        RepositorioMedico rep;
        public CadastroMedico()
        {
            rep = new RepositorioMedico();
        }
        public DataSet consultarTodos()
        {
            return rep.consultarTodos();
        }
        public string inserirMedico(Medico medico)
        {
            return rep.inserir(medico);
        }
    }
}
