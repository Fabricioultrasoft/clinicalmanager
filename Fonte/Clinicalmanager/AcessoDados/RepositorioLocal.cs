using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Classes_Básicas;
using Npgsql;
using System.Data;
namespace AcessoDados
{
    public class RepositorioLocal:Conexao
    {
        NpgsqlCommand cmd;
        NpgsqlDataReader reader;
        public void inserir(Local local)
        {
            if (local != null)
            {
                try
                {
                    string cmdStr = "insert into clinicalmanager.local(nome,gera_prd) values (@nome,@geraprd)";
                    base.conn.Open();
                    cmd = base.conn.CreateCommand();
                    cmd.CommandText = cmdStr;
                    cmd.Parameters.Add("@nome", local.Descricao);
                    cmd.Parameters.Add("@geraprd", local.Geraprd);
                    cmd.ExecuteNonQuery();
                    base.conn.Close();
                }
                catch (Exception ex)
                {

                    throw new Exception("Erro ao incluir paciente " + ex.Message);
                }
            }
        }

        public void atualizar(Local local)
        {
            string cmdStr = "update clinicalmanager.local set nome=@nome, gera_prd=@geraprd where idloc = @idloc";
            try
            {
                base.conn.Open();
                cmd = base.conn.CreateCommand();
                cmd.CommandText = cmdStr;
                cmd.Parameters.Add("@idloc", local.Codloc);
                cmd.Parameters.Add("@nome", local.Descricao);
                cmd.Parameters.Add("@geraprd", local.Geraprd);
                cmd.ExecuteNonQuery();
                base.conn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível remover o paciente " + ex.Message);
            }
        }

        public void exluir(Local local)
        {
            string cmdStr = "delete from clinicalmanager.local where idloc = @idloc";
            try
            {
                base.conn.Open();
                cmd = base.conn.CreateCommand();
                cmd.CommandText = cmdStr;
                cmd.Parameters.Add("@idloc", local.Codloc);
                cmd.ExecuteNonQuery();
                base.conn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível remover o paciente " + ex.Message);
            }
        }

        public Local consultar(string nome)
        {
            string sql = "select idloc, nome, gera_prd from clinicalmanager.local where nome like '@nome'";
            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("@nome", nome);
            reader = base.execute(cmd);
            Local output = new Local();
            output.Descricao = reader.GetString(1);
            output.Geraprd=reader.GetBoolean(2);
            output.Codloc = reader.GetInt16(0);
            return output;
        }

        public DataSet consultarTodos()
        {
            string sql = "select * from clinicalmanager.local";
            Npgsql.NpgsqlCommand cmd = base.conn.CreateCommand();
            //cmd.CommandText = 
            return base.execute(sql);
        }
    }
    }

