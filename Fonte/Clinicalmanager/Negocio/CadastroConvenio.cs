using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AcessoDados;
using Classes_Básicas;
using System.Data;
namespace Negocio
{
    public class CadastroConvenio
    {
        private RepositorioConvenio rep;
        public CadastroConvenio()
        {
            rep = new RepositorioConvenio();
        }
        public Convenio getConveniobyId(int idconv)
        {
            return rep.getConveniobyId(idconv);
        }

        public DataSet getAllConenio()
        {
            return rep.getAllConenio();
        }
    }
}
