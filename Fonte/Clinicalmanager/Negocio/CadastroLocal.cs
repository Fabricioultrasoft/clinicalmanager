﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AcessoDados;
using System.Data;
using Classes_Básicas;
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
        public string inserirLocal(Local local)
        {
            return rep.inserir(local);
        }
        public DataSet getLocalbyDesc(string desc, string andar)
        {
            return rep.getLocalbyDesc(desc, andar);
        }
        public string excluirLocal(Local local)
        {
            return rep.exluir(local);
        }
    }
}
