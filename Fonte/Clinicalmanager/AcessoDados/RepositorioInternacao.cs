using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Classes_Básicas;
using Npgsql;
using System.Data;
namespace AcessoDados
{
    public class RepositorioInternacao : Conexao
    {
        NpgsqlCommand cmd;
        NpgsqlDataReader reader;

        public void inserir(Internacao internacao)
        {
            if (internacao != null)
            {
                try
                {
                    string cmdStr = "INSERT INTO clinicalmanager.internacao(data_in, data_out) " +
                                    "VALUES (@data_in, @data_out)";
									
                    base.conn.Open();
                    cmd = base.conn.CreateCommand();
                    cmd.CommandText = cmdStr;
                    cmd.Parameters.Add("@data_in", internacao.data_in);
                    cmd.Parameters.Add("@data_out", internacao.data_out);
                    cmd.ExecuteNonQuery();
                    base.conn.Close();
                }
                catch (Exception ex)
                {

                    throw new Exception("Erro ao incluir internacao: " + ex.Message);
                }
            }
        }

        public void atualizar(Internacao internacao)
        {
            string cmdStr = "UPDATE clinicalmanager.internacao " + 
			                "SET data_in = @data_in, data_out = @data_out " +
                            "WHERE idint = @idint";
            try
            {
                base.conn.Open();
                cmd = base.conn.CreateCommand();
                cmd.CommandText = cmdStr;
                cmd.Parameters.Add("@idint", internacao.codint);
                cmd.Parameters.Add("@data_in", internacao.data_in);
                cmd.Parameters.Add("@data_out", internacao.data_out);
                cmd.ExecuteNonQuery();
                base.conn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível atualizar a internação " + ex.Message);
            }
        }

        public void exluir(Fatura fatura)
        {
            string cmdStr = "DELETE FROM clinicalmanager.internacao " + 
			                "WHERE idint = @idint";
            try
            {
                base.conn.Open();
                cmd = base.conn.CreateCommand();
                cmd.CommandText = cmdStr;
                cmd.Parameters.Add("@idint", internacao.codint);
                cmd.ExecuteNonQuery();
                base.conn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível remover a internação " + ex.Message);
            }
        }

        public Internacao consultar(int codint)
        {
            string sql = "SELECT idint, data_in, data_out " + 
			             "FROM clinicalmanager.internacao " + 
						 "WHERE idint = @idint";

            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("@idint", codint);
            reader = base.execute(cmd);
            Fatura output = new Fatura();
            //output.Nome = reader.GetString(1);
            //output.Idmed = reader.GetInt16(0);
            return output;
        }

        public DataSet consultarTodos()
        {
            string sql = "SELECT * FROM  clinicalmanager.internacao";
            Npgsql.NpgsqlCommand cmd = base.conn.CreateCommand();
            //cmd.CommandText = 
            return base.execute(sql);
        }
    }
}

