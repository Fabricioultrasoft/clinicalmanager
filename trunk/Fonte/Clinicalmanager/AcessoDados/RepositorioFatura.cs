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
        public string inserir(Fatura fatura)
        {
            if (fatura != null)
            {
                try
                {
                    string cmdStr = "insert into fatura(codigo, data_fechamento, data_inicio, data_fim, tipo, mes_ref)" +
                        " values(@codigo, @data_fechamento, @data_inicio, @data_fim, @tipo, @mes_ref)";
                    base.conn.Open();
                    cmd = base.conn.CreateCommand();
                    cmd.CommandText = cmdStr;
                    cmd.Parameters.Add("@codigo", fatura.Codigo_HP);
                    cmd.Parameters.Add("@data_fechamento", fatura.Data_fechamento);
                    cmd.Parameters.Add("@data_inicio", fatura.Data_inicio);
                    cmd.Parameters.Add("@data_fim", fatura.Data_fim);
                    cmd.Parameters.Add("@tipo", fatura.Tipo);
                    cmd.Parameters.Add("@mes_ref", fatura.Mes_referencia);                    
                    cmd.ExecuteNonQuery();
                    base.conn.Close();
                    return "Fatura incluída com sucesso.";
                }
                catch (Exception ex)
                {
                    return "Falha ao incluir fatura. Verifique os parâmetros informados.\n" + ex.Message;
                    //throw new Exception("Erro ao incluir fatura: " + ex.Message);
                }               
            }
            return "Por favor informe a fatura.";
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

        public Fatura consultar(string codfat)
        {
            /*    idfat serial NOT NULL,
                  data_fechamento date,
                  paga boolean,
                  fechada boolean,
                  codigo character varying,
                  data_inicio date,
                  data_fim date,
                  tipo character(1),
                  mes_ref integer,
             * */
            string sql = "SELECT idfat, codigo, data_fechamento, data_inicio, data_fim, mes_ref, tipo " + 
			             "FROM fatura " +
                         "WHERE codigo ilike @codigo";
            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("@codigo", codfat+'%');
            reader = base.execute(cmd);
            Fatura output = new Fatura();
            output.Codfat = reader.GetInt16(0);
            output.Codigo_HP = reader.GetString(1);
            output.Data_fechamento = reader.GetDateTime(2);
            output.Data_inicio = reader.GetDateTime(3);
            output.Data_fim = reader.GetDateTime(4);
            output.Mes_referencia = reader.GetInt16(5);
            output.Tipo = reader.GetChar(6);
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
