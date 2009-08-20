﻿using System;
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
               
        public void atualizar(Paciente pac)
        {
            rep.atualizar(pac);
        }

        public void exluir(Paciente pac)
        {
            rep.excluir(pac);
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