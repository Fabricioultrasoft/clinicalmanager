using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AcessoDados
{
    public interface Crud
    {
         void inserir<T>(T obj);
         void consultar<T>(T obj);
         void atualizar<T>(T obj);
         void exluir<T>(T obj);
    }
}
