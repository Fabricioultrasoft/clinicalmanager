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
        DataSet dataset;
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

        public DataSet consultar(string codfat)
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
			             "FROM clinicalmanager.fatura " +
                         "WHERE codigo ilike @codigo";
            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("@codigo", codfat+'%');
            dataset = base.executeToDataset(cmd);            
            return dataset;
        }
        #endregion

        public DataSet consultarTodos()
        {
            string sql = "SELECT * FROM  clinicalmanager.fatura";
            cmd = base.conn.CreateCommand();
            return base.execute(sql);
        }

        public DataSet detalheFatura(int idfat)
        {
            string sql =    "select ifat.idfat, ifat.idint, inter.data_in as entrada, pac.nome, pac.codprontuario, " +
                            "med.nome as medico, fat.codigo as fatura, ifat.valor, conv.descricao as convenio "+
                            "from clinicalmanager.fatura fat "+
                            "inner join clinicalmanager.item_de_fatura ifat on (fat.idfat=ifat.idfat) "+
                            "inner join clinicalmanager.internacao inter on (inter.idint = ifat.idint) "+
                            "inner join clinicalmanager.paciente pac on (inter.idpac = pac.idpac) "+
                            "inner join clinicalmanager.medico med on (inter.idmed = med.idmed) "+
                            "inner join clinicalmanager.convenio conv on (inter.idcon = conv.idcon) "+
                            "where fat.idfat = @idfat";
            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("@idfat", idfat);
            dataset = base.executeToDataset(cmd);
            return dataset;
        }
        public string excluirItemFatura(int idfat, int idint)
        {
            string sql = "delete from clinicalmanager.item_de_fatura where idfat=@idfat and idint=@idint";
            try{
            conn.Open();
            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("@idfat", idfat);
            cmd.Parameters.Add("@idint", idint);
            cmd.ExecuteNonQuery();
            base.conn.Close();
            return "Item Removido";
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível remover o item de fatura " + ex.Message);
            }
            return "Erro ao remover item";
        }
        public void inserirItemFatura(int idint, int idfat, float valor)
        {
            try
            {
                string sql = "insert into clinicalmanager.item_de_fatura values(@idfat,@idint,@valor)";
                cmd = conn.CreateCommand();
                cmd.Parameters.Add("@idfat", idfat);
                cmd.Parameters.Add("@idint", idint);
                cmd.Parameters.Add("@valor", valor);
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                throw new Exception("Não foi possível adicionar o item. IDFAT = " + idfat + " IDINT = " + idint);
            }
        }
        public DataSet listarItensParaIncluir(String codProntuario)
        {
            try
            {
                cmd = conn.CreateCommand();
                string sql = "select p.nome, p.codprontuario, i.data_in, i.idint " +
                             "from internacao i " +
                             "inner join paciente p on (i.idpac = p.idpac) " +
                             "where i.faturada is null";
                cmd.CommandText = sql;
                if (codProntuario != null)
                {
                    sql = sql + " and p.codprontuario = @codprontuario";
                    cmd.CommandText = sql;
                    cmd.Parameters.Add("@codprontuario", codProntuario);
                }                
                return base.executeToDataset(cmd);
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
