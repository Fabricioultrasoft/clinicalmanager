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

         public string inserir(Paciente paciente)
         {
            if (paciente != null)
            {
                try
                {
                    string cmdStr = "insert into clinicalmanager.paciente(nome,cpf,codprontuario) values (@nome,@cpf,@codprontuario)";
                    base.conn.Open();
                    cmd = base.conn.CreateCommand();
                    cmd.CommandText = cmdStr;
                    cmd.Parameters.Add("@nome", paciente.Nome);
                    cmd.Parameters.Add("@cpf", paciente.CPF);
                    cmd.Parameters.Add("@codprontuario", paciente.CodProntuario);
                    cmd.ExecuteNonQuery();
                    base.conn.Close();              
                }
                catch (Exception ex)
                {
                    return "Erro ao incluir paciente: "+ex.Message;   
                }                    
            }
            return "Paciente incluído com sucesso.\nAjuda: Para Cadastrar uma internação ir no menu Cadastro->Internação.";
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

        public string excluir(Paciente paciente)
        {
            string cmdStr = "delete from clinicalmanager.paciente where idpac = @idpac";
            try
            {
                base.conn.Open();
                cmd = base.conn.CreateCommand();
                cmd.CommandText = cmdStr;
                cmd.Parameters.Add("@idpac", paciente.Idpac);
                cmd.ExecuteNonQuery();
                base.conn.Close();
                return "Paciente Removido com sucesso.";
            }
            catch (NpgsqlException ex)
            {
                if (ex.Code.Equals("23503"))
                    return "Não foi possível remover o paciente. O Paciente está associado a uma internação";
                else return "Não foi possível remover o paciente. Erro Código: " + ex.Code;
            }
        }
          
        public DataSet consultar(string nome)
        {
            string sql = "select idpac,nome,codprontuario, cpf from clinicalmanager.paciente where nome like @nome";
            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("@nome", nome);
            return base.executeToDataset(cmd); 
        }
        public DataSet consultarCpf(string cpf)
        {

            string sql = "select idpac,nome, cpf, codprontuario from clinicalmanager.paciente where cpf like @cpf";
            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("@cpf", cpf);
            return base.executeToDataset(cmd); 
        }
        public Paciente consultar(int idpac)
        {
            string sql = "select idpac,nome,cpf, codprontuario from clinicalmanager.paciente where idpac = @idpac";
            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("@idpac", idpac);
            reader = base.execute(cmd);
            Paciente output = new Paciente();
            if (reader.Read())
            {
                output.Nome = reader.GetString(1);
                output.Idpac = reader.GetInt32(0);
                output.CodProntuario = reader.GetInt32(3);
                if (!reader.IsDBNull(2))
                {
                    output.CPF = reader.GetString(2);
                }
            }
                conn.Close();
            return output;
        }

        public DataSet consultarTodos()
        {
            string sql = "select idpac, nome, cpf, codprontuario from clinicalmanager.paciente order by nome";
            Npgsql.NpgsqlCommand cmd = base.conn.CreateCommand();
            //cmd.CommandText = 
            return base.execute(sql);
        }


    }
}
