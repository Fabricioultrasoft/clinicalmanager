using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Negocio
{
    public interface Crud
    {
         void inserir(Object obj);
         void consultar(Object obj);
         void atualizar(Object obj);
         void exluir(Object obj);
    }
}
