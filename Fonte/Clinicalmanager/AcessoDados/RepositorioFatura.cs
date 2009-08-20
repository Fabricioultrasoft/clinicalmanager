using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Classes_Básicas;
using Npgsql;
using System.Data;
namespace AcessoDados
{
    /// <summary>
    /// Esta classe representa o repositório de faturas e sua ligação com o banco de dados.
    /// </summary>
    public class RepositorioFatura : Conexao
    {
        NpgsqlCommand cmd;
        NpgsqlDataReader reader;
        #region CRUD
        public void inserir(Fatura fatura)
        {
            if (fatura != null)
            {
                try
                {
                    string cmdStr = "insert into fatura(data_fechamento,paga,fechada)"+
                        " values(@data_fechamento,@paga,@fechada)";
                    base.conn.Open();
                    cmd = base.conn.CreateCommand();
                    cmd.CommandText = cmdStr;
                    cmd.Parameters.Add("@data_fechamento", fatura.Data_fechamento);
                    cmd.Parameters.Add("@paga", fatura.Paga);
                    cmd.Parameters.Add("@fechada", fatura.Fechada);
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
                            "SET data_fechamento = @data_fechamento, paga = @paga, " +
                            "fechada = @fechada " +
                            "WHERE idfat = @idfat";
            try
            {
                base.conn.Open();
                cmd = base.conn.CreateCommand();
                cmd.CommandText = cmdStr;
                cmd.Parameters.Add("@idfat", fatura.Codfat);
                cmd.Parameters.Add("@data_fechamento", fatura.Data_fechamento);
                cmd.Parameters.Add("@paga", fatura.Paga);
                cmd.Parameters.Add("@fechada", fatura.Fechada);
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
            string sql = "SELECT idfat, data_fechamento, paga, fechada " + 
			             "FROM clinicalmanager.fatura " + 
						 "WHERE idfat = @idfat";

            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("@idfat", codfat);
            reader = base.execute(cmd);
            Fatura output = new Fatura();
            output.Codfat = reader.GetInt16(0);
            output.Data_fechamento = reader.GetDateTime(1);
            output.Paga= reader.GetBoolean(2);
            output.Fechada = reader.GetBoolean(3);
            return output;
        }
        #endregion

        public DataSet consultarTodos()
        {
            string sql = "SELECT * FROM  clinicalmanager.fatura";
            Npgsql.NpgsqlCommand cmd = base.conn.CreateCommand();
            return base.execute(sql);
        }
    }
}
