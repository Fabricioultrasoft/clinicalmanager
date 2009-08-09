using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AcessoDados;
namespace Negocio
{
    public class Fachada
    {
        private CadastroPaciente capPac;

        public Fachada()
        {
            capPac = new CadastroPaciente();
        }
        public System.Data.DataSet getAllPacientes()
        {
            return capPac.consultarTodos();
        }
    }
}
