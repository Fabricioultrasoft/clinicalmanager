using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Classes_Básicas;
using Npgsql;
using System.Data;
namespace AcessoDados
{
    public class RepositorioFatura : Conexao
    {
        NpgsqlCommand cmd;
        NpgsqlDataReader reader;

        public void inserir(Fatura fatura)
        {
            if (fatura != null)
            {
                try
                {
                    string cmdStr = "INSERT INTO clinicalmanager.fatura(vl_esperado_hn, vl_recebido_hn, " +
                                    " vl_recebido_pr, idint) " + 
									"VALUES (@vl_esperado_hn, @vl_recebido_hn, @vl_recebido_pr, @idint)";
                    base.conn.Open();
                    cmd = base.conn.CreateCommand();
                    cmd.CommandText = cmdStr;
                    cmd.Parameters.Add("@vl_esperado_hn", fatura.Valor_HN_Esp);
                    cmd.Parameters.Add("@vl_recebido_hn", fatura.Valor_HN_Receb);
                    cmd.Parameters.Add("@vl_recebido_pr", fatura.Valor_PRD);
                    cmd.ExecuteNonQuery();
                    base.conn.Close();
                }
                catch (Exception ex)
                {

                    throw new Exception("Erro ao incluir fatura: " + ex.Message);
                }
            }
        }

        public void atualizar(Fatura fatura)
        {
            string cmdStr = "UPDATE clinicalmanager.fatura " + 
			                "SET vl_esperado_hn = @vl_esperado_hn, vl_recebido_hn = @vl_recebido_hn, " + 
							"vl_recebido_pr = @vl_recebido_pr " +
                            "WHERE idfat = @idfat";
            try
            {
                base.conn.Open();
                cmd = base.conn.CreateCommand();
                cmd.CommandText = cmdStr;
                cmd.Parameters.Add("@idfat", fatura.Codfat);
                cmd.Parameters.Add("@vl_esperado_hn", fatura.Valor_HN_Esp);
                cmd.Parameters.Add("@vl_recebido_hn", fatura.Valor_HN_Receb);
                cmd.Parameters.Add("@vl_recebido_pr", fatura.Valor_PRD);
                cmd.ExecuteNonQuery();
                base.conn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível atualizar a fatura " + ex.Message);
            }
        }

        public void exluir(Fatura fatura)
        {
            string cmdStr = "DELETE FROM clinicalmanager.fatura " + 
			                "WHERE idfat = @idfat";
            try
            {
                base.conn.Open();
                cmd = base.conn.CreateCommand();
                cmd.CommandText = cmdStr;
                cmd.Parameters.Add("@idfat", fatura.Codfat);
                cmd.ExecuteNonQuery();
                base.conn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível remover a fatura " + ex.Message);
            }
        }

        public Fatura consultar(int codfat)
        {
            string sql = "SELECT idfat, vl_esperado_hn, vl_recebido_hn, vl_recebido_pr " + 
			             "FROM clinicalmanager.fatura " + 
						 "WHERE idfat = @idfat";

            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("@idfat", codfat);
            reader = base.execute(cmd);
            Fatura output = new Fatura();
            //output.Nome = reader.GetString(1);
            //output.Idmed = reader.GetInt16(0);
            return output;
        }

        public DataSet consultarTodos()
        {
            string sql = "SELECT * FROM  clinicalmanager.fatura";
            Npgsql.NpgsqlCommand cmd = base.conn.CreateCommand();
            //cmd.CommandText = 
            return base.execute(sql);
        }
    }
}
