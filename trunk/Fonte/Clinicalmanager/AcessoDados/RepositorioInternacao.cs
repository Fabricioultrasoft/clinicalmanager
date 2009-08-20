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
    /// Esta classe representa o repositório para buscar as internações no banco de dados.
    /// </summary>
    public class RepositorioInternacao : Conexao
    {
        NpgsqlCommand cmd;
        NpgsqlDataReader reader;
        #region CRUD
        public void inserir(Internacao internacao)
        {
            if (internacao != null)
            {
                try
                {
                    string cmdStr = "INSERT INTO clinicalmanager.internacao(data_in, data_out,obs,idpac,idcon) " +
                                    "VALUES (@data_in, @data_out,@obs,@idpac,@idcon)";
                    base.conn.Open();
                    cmd = base.conn.CreateCommand();
                    cmd.CommandText = cmdStr;
                    cmd.Parameters.Add("@data_in", internacao.Data_in);
                    cmd.Parameters.Add("@data_out", internacao.Data_out);
                    cmd.Parameters.Add("@obs", internacao.Obs);
                    cmd.Parameters.Add("@idpac", internacao.Paciente.Idpac);
                    cmd.Parameters.Add("@idcon", internacao.Convenio.Codcon);
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
                            "obs = @obs , idpac=@idpac, idcon=@idcon "+
                            "WHERE idint = @idint";
            try
            {
                base.conn.Open();
                cmd = base.conn.CreateCommand();
                cmd.CommandText = cmdStr;
                cmd.Parameters.Add("@idint", internacao.Codint);
                cmd.Parameters.Add("@data_in", internacao.Data_in);
                cmd.Parameters.Add("@data_out", internacao.Data_out);
                cmd.Parameters.Add("@obs", internacao.Obs);
                cmd.Parameters.Add("@idpac", internacao.Paciente.Idpac);
                cmd.Parameters.Add("@idcon", internacao.Convenio.Codcon);
                cmd.ExecuteNonQuery();
                base.conn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível atualizar a internação " + ex.Message);
            }
        }

        public void excluir(Internacao idint)
        {
            string cmdStr = "DELETE FROM clinicalmanager.internacao " + 
			                "WHERE idint = @idint";
            try
            {
                if (idint == null) throw new Exception("Argumento idint encontra-se NULO");
                else
                {
                    base.conn.Open();
                    cmd = base.conn.CreateCommand();
                    cmd.CommandText = cmdStr;
                    cmd.Parameters.Add("@idint", idint.Codint);
                    cmd.ExecuteNonQuery();
                    base.conn.Close();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível remover a internação. "+ex.Message);
            }
        }
        /// <summary>
        /// Método para conultar um internação específica pelo código de internação.
        /// </summary>
        /// <param name="codint">Código da internação a ser buscada</param>
        /// <returns>Um objeto do tipo internação.</returns>
        public Internacao consultar(int codint)
        {
            string sql = "select a.idint, a.data_in , a.data_out, a.obs, a.vl_esperado_hn,"+
                         " a.vl_recebido_hn, a.vl_produtividade, b.*, c.*, d.* "+
                         " from clinicalmanager.paciente b,clinicalmanager.internacao a "+
                         " left join clinicalmanager.fatura c on(c.idfat=a.idfat) "+
                         " left join clinicalmanager.convenio d on (a.idcon=d.idcon)"+ 
                         " where a.idpac=b.idpac and a.idint=@idint";            

            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("@idint", codint);
            reader = base.execute(cmd);
            Internacao internacao = new Internacao();
            Fatura fatura = new Fatura();
            Convenio convenio = new Convenio();
            Paciente paciente = new Paciente();
            internacao.Codint = reader.GetInt16(0);
            internacao.Data_in = reader.GetDateTime(1);
            internacao.Data_out = reader.GetDateTime(2);
            internacao.Obs = reader.GetString(3);
            internacao.Vl_Esperado_HN = reader.GetDouble(4);
            internacao.Vl_Recebido_HN = reader.GetDouble(5);
            internacao.Vl_Produtividade = reader.GetDouble(6);
            
            ///<remarks> Trecho de código que recupera informações sobre o paciente.</remarks>
            //Recuperando informações sobre paciente.
            paciente.Idpac = reader.GetInt16(7);
            paciente.Nome= reader.GetString(8);
            paciente.CPF= reader.GetString(9);

            //Recuperando informações sobre fatura.
            fatura.Codfat = reader.GetInt16(10);
            fatura.Data_fechamento = reader.GetDateTime(11);
            fatura.Paga = reader.GetBoolean(12);
            fatura.Fechada = reader.GetBoolean(13);

            //Recuperando informações sobre convenio.
            convenio.Codcon = reader.GetInt16(14);
            convenio.Descricao = reader.GetString(15);

            //Atribuir tabelas referenciadas à saída.
            internacao.Convenio = convenio;
            internacao.Fatura = fatura;
            internacao.Paciente = paciente;
            return internacao;
        }
        #endregion
        public DataSet consultarPorPaciente(int idpac)
        {
            string sql = "select a.idint, a.data_in , a.data_out, a.obs, a.vl_esperado_hn," +
                         " a.vl_recebido_hn, a.vl_produtividade, b.*, c.*, d.* " +
                         " from clinicalmanager.paciente b,clinicalmanager.internacao a " +
                         " left join clinicalmanager.fatura c on(c.idfat=a.idfat) " +
                         " left join clinicalmanager.convenio d on (a.idcon=d.idcon)" +
                         " where a.idpac=b.idpac and a.idpac=@idpac";
            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("@idpac", idpac);
            return base.executeToDataset(cmd);
        }
        
        /// <summary>
        /// Método que busca todas as internações, para todos os pacientes.
        /// </summary>
        /// <returns></returns>
        public DataSet consultarTodos()
        {
            string sql = "SELECT * FROM  clinicalmanager.internacao";
            Npgsql.NpgsqlCommand cmd = base.conn.CreateCommand();
            return base.execute(sql);
        }
    }
}

