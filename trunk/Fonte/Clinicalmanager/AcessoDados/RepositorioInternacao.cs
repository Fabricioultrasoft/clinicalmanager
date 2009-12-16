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
        public string inserir(Internacao internacao)
        {
            if (internacao != null)
            {
                try
                {
                    string cmdStr = "INSERT INTO clinicalmanager.internacao(data_in,obs,idpac,idcon, idmed) " +
                                    "VALUES (@data_in, @obs,@idpac,@idcon, @idmed)";
                    base.conn.Open();
                    cmd = base.conn.CreateCommand();
                    cmd.CommandText = cmdStr;
                    cmd.Parameters.Add("@data_in", internacao.Data_in);                   
                    cmd.Parameters.Add("@obs", internacao.Obs);
                    cmd.Parameters.Add("@idpac", internacao.Paciente.Idpac);
                    cmd.Parameters.Add("@idcon", internacao.Convenio.Codcon);
                    cmd.Parameters.Add("@idmed", internacao.Idmed);
                    cmd.ExecuteNonQuery();
                    base.conn.Close();
                }
                catch (Exception ex)
                {
                    return "Erro ao incluir internação: "+ex.Message;
                }                
            }
            return "Internação incluída com sucesso";
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
            /*
             * Adicionado condição li.data_in_loc = select max ... Para não repetir a mesma internação. 
             * */

            string sql =    "select i.idint, i.idpac, i.idcon, i.data_in, i.data_out, "+ 
                            "i.obs, p.nome, p.cpf, li.idloc, li.data_in_loc, li.obs_loc as local_obs, l.nome as local  "+
                            "from clinicalmanager.internacao i  "+
                            "inner join clinicalmanager.paciente p on (i.idpac=p.idpac)  "+
                            "left join clinicalmanager.local_internacao li on (li.idint=i.idint)  "+
                            "left join clinicalmanager.local l on (li.idloc=l.idloc)  "+
                            "where  p.idpac=@idpac "+
                            "and  li.data_in_loc =  (select max(li.data_in_loc) "+
                            "from clinicalmanager.local_internacao li where li.idint = i.idint)";
            try{
            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("@idpac", idpac);
                 }
             catch (Npgsql.NpgsqlException ex)
             {
                 throw new Exception(ex.Message);
             }
            return base.executeToDataset(cmd);
        }
        
        /// <summary>
        /// Método que busca todas as internações, para todos os pacientes.
        /// </summary>
        /// <returns></returns>
        public DataSet consultarTodos()
        {
            string sql = "SELECT * FROM  clinicalmanager.internacao";
            try{
            Npgsql.NpgsqlCommand cmd = base.conn.CreateCommand();
            }
            catch (Npgsql.NpgsqlException ex)
            {
                throw new Exception(ex.Message);
            }
            return base.execute(sql);
        }

        public DataSet consultarPorPacienteNome(string nome, string andamento)
        {
            /*===============================================
            Autor: Renato Campelo
            Data: 15/10/2009
            String para ConsultaPorPacienteNome Não liberados
             ===============================================*/
            string sql_internacao_andamento =
            "select i.idint, i.idpac, i.idcon, i.data_in, i.data_out, " +
             "i.obs, p.nome, p.cpf, li.idloc, li.data_in_loc, li.obs_loc as local_obs, l.nome as local " +
             "from clinicalmanager.internacao i " +
             "inner join clinicalmanager.paciente p on (i.idpac=p.idpac) " +
             "left join clinicalmanager.local_internacao li on (li.idint=i.idint) " +
             "left join clinicalmanager.local l on (li.idloc=l.idloc) " +
             "where  p.nome like @nome " +
             "and i.data_out is null " +
             "and li.data_out_loc is null " +
             "order by i.data_in desc ";

             /*===============================================
            Autor: Renato Campelo
            Data: 15/10/2009
            String para ConsultaPorPacienteNome que receberam alta
             ===============================================*/
            string sql_internacao_finalizada =
             "select i.idint, i.idpac, i.idcon, i.data_in, i.data_out, "+
             "i.obs, p.nome, p.cpf, l.nome as local "+
             "from clinicalmanager.internacao i, (select li.idint, max(li.data_out_loc) from clinicalmanager.local_internacao li group by li.idint) li_max, "+
             "clinicalmanager.paciente p, clinicalmanager.local l,  clinicalmanager.local_internacao li " +
             "where  p.nome like @nome  " +
             "and i.idpac=p.idpac "+
             "and i.idint=li_max.idint "+
             "and li.idloc=l.idloc "+
             "and li_max.idint=li.idint and li.data_out_loc=li_max.max ";
            
            try{
                cmd = conn.CreateCommand();
                switch (andamento)
                {
                    case "Finalizadas":
                        cmd.CommandText = sql_internacao_finalizada;
                        break;
                    default:
                        cmd.CommandText = sql_internacao_andamento;
                        break;
                }            
            cmd.Parameters.Add("@nome", nome+'%');
            return base.executeToDataset(cmd);
            }
             catch (Npgsql.NpgsqlException ex)
             {
                 throw new Exception(ex.Message);
             }
        }
        public void liberarInternacao(Internacao internacao, DateTime data_saida, float valor)
        {
            string sql = "update clinicalmanager.internacao set data_out=@data_out,"+
                       "  vl_esperado_hn=@valor where idint=@idint";
            string sql2 = "update clinicalmanager.local_internacao" +
                " set data_out_loc = @data_out_loc " +
                " where idint = @idint and data_out_loc is null";
            try{
            conn.Open();
            //Comando do sql2
            NpgsqlCommand cmd1 = conn.CreateCommand();
            cmd1.CommandText = sql2;
            cmd1.Parameters.Add("@idint", internacao.Codint);
            cmd1.Parameters.Add("@data_out_loc", data_saida);
            cmd1.ExecuteNonQuery();


            cmd = conn.CreateCommand();
            cmd.CommandText=sql;
            cmd.Parameters.Add("@data_out", data_saida);
            cmd.Parameters.Add("@valor",valor);
            cmd.Parameters.Add("@idint", internacao.Codint);
            cmd.ExecuteNonQuery();
            conn.Close();
            }
            catch (Npgsql.NpgsqlException ex)
            {
                throw new Exception(ex.Message);
            }
        }
        public string movimentarPaciente(int idint, int idloc, DateTime data_in_loc, DateTime data_out_loc, string obs_loc)
        {
            //SQL que inclui a data da saída na última movimentação
            string sql2 = "update clinicalmanager.local_internacao" +
                " set data_out_loc = @data_out_loc " +
                " where idint = @idint and data_out_loc is null";
            string sql = "insert into clinicalmanager.local_internacao" +
                "(idint, idloc, data_in_loc,  obs_loc) " +
                "values (@idint, @idloc, @data_in_loc, @obs_loc)";
            conn.Open();
            NpgsqlCommand cmd1 = conn.CreateCommand();
            cmd1.CommandText = sql2;
            cmd1.Parameters.Add("@idint", idint);
            cmd1.Parameters.Add("@data_out_loc", data_out_loc);
            cmd1.ExecuteNonQuery();

            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("@idint", idint);
            cmd.Parameters.Add("@idloc", idloc);
            cmd.Parameters.Add("@data_in_loc", data_in_loc);
            //cmd.Parameters.Add("@data_out_loc", data_out_loc);
            cmd.Parameters.Add("@obs_loc", obs_loc);
            cmd.ExecuteNonQuery();
            base.conn.Close();
            return "Movimentação cadastrada com sucesso";
        }
        public DataSet historicoMovimentacao(int idint)
        {
            string sql = "select p.nome, i.data_in, l.nome as Local, li.data_in_loc, li.data_out_loc, " +
                "li.obs_loc from clinicalmanager.local_internacao li " +
                "inner join clinicalmanager.internacao i on (i.idint=li.idint) " +
                "inner join clinicalmanager.local l on (li.idloc=l.idloc) " +
                "inner join clinicalmanager.paciente p on (i.idpac=p.idpac) where li.idint = @idint";
            try{
            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("@idint", idint);
            }
            catch (Npgsql.NpgsqlException ex)
            {
                throw new Exception(ex.Message);
            }
            return base.executeToDataset(cmd);
        }
        public Internacao preLiberarInternacao(int idint)
        {
            string sql = "select i.data_in, c.descricao "+
                " from clinicalmanager.internacao i"+
                " inner join clinicalmanager.convenio c on (i.idcon=c.idcon)"+
                " where i.idint=@idint";
             try{
            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("@idint", idint);
            reader = base.execute(cmd);
            reader.Read();
            Internacao output = new Internacao();
            output.Data_in = reader.GetDateTime(0);
            Convenio convenio = new Convenio();
            convenio.Descricao=reader.GetString(1);
            output.Convenio = convenio;
            conn.Close();
            return output;
            }
            catch (Npgsql.NpgsqlException ex)
            {
                 throw new Exception(ex.Message);
            }
        }
        public DataSet listaPacienteSemFatura()
        {
            string sql = "select pac.idpac, pac.codprontuario, pac.nome, "+
            "to_char(it.data_in,'dd/mm/yyyy') as entrada, to_char(it.data_out,'dd/mm/yyyy') as saida,"+
            "it.vl_esperado_hn,itf.valor as valor_recebido  from clinicalmanager.internacao it "+
            "left join clinicalmanager.item_de_fatura itf on (itf.idint = it.idint), "+
            "clinicalmanager.paciente pac  where itf.valor is null and it.idpac = pac.idpac and "+
            "data_out is not null";
            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            return base.executeToDataset(cmd);
        }
    }
}

