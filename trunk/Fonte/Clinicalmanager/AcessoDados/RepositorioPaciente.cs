﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Classes_Básicas;
using Npgsql;
using System.Data;
namespace AcessoDados
{
    public class RepositorioPaciente:Conexao

    {
        NpgsqlCommand cmd;
        NpgsqlDataReader reader;

         public void inserir(Paciente paciente)
         {
            if (paciente != null)
            {
                try
                {
                    string cmdStr = "insert into clinicalmanager.paciente(nome,cpf) values (@nome,@cpf)";
                    base.conn.Open();
                    cmd = base.conn.CreateCommand();
                    cmd.CommandText = cmdStr;
                    cmd.Parameters.Add("@nome", paciente.Nome);
                    cmd.Parameters.Add("@cpf", paciente.CPF);
                    cmd.ExecuteNonQuery();
                    base.conn.Close();              
                }
                catch (Exception ex)
                {
                    throw new Exception("Erro ao incluir paciente " + ex.Message);
                }                    
            }
        }
                
        public void atualizar(Paciente paciente)
        {
            string cmdStr = "update clinicalmanager.paciente set nome=@nome where idpad = @idpac";
            try
            {
                base.conn.Open();
                cmd = base.conn.CreateCommand();
                cmd.CommandText = cmdStr;
                cmd.Parameters.Add("@idpac", paciente.Idpac);
                cmd.Parameters.Add("@nome", paciente.Nome);
                cmd.ExecuteNonQuery();
                base.conn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível remover o paciente " + ex.Message);
            }
        }

        public void excluir(Paciente paciente)
        {
            string cmdStr = "delete from clinicalmanager.paciente where idpad = @idpac";
            try
            {
                base.conn.Open();
                cmd = base.conn.CreateCommand();
                cmd.CommandText = cmdStr;
                cmd.Parameters.Add("@idpac", paciente.Idpac);
                cmd.ExecuteNonQuery();
                base.conn.Close();  
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível remover o paciente " + ex.Message);
            }
        }
          
        public Paciente consultar(string nome)
        {
            string sql = "select idpac,nome from clinicalmanager where nome like '@nome'";
            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("@nome", nome);
            reader = base.execute(cmd);
            Paciente output = new Paciente();
            output.Nome = reader.GetString(1);
            output.Idpac = reader.GetInt32(0);
            return output;
            throw new NotImplementedException();
        }

        public Paciente consultar(int idpac)
        {
            string sql = "select idpac,nome from clinicalmanager where idpac ='@idpac'";
            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("@idpac", idpac);
            reader = base.execute(cmd);
            Paciente output = new Paciente();
            output.Nome = reader.GetString(1);
            output.Idpac = reader.GetInt32(0);
            return output;
            throw new NotImplementedException();
        }

        public DataSet consultarTodos()
        {
            string sql = "select * from clinicalmanager.paciente";
            Npgsql.NpgsqlCommand cmd = base.conn.CreateCommand();
            //cmd.CommandText = 
            return base.execute(sql);
        }


    }
}