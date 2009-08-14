using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AcessoDados;
using System.Data;
namespace Negocio
{
    public class CadastroLocal
    {
        RepositorioLocal rep;
        public CadastroLocal()
        {
            rep = new RepositorioLocal();
        }
        public DataSet consultarTodos()
        {
            return rep.consultarTodos();
        }
    }
}
