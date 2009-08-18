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
                    string cmdStr = "INSERT INTO clinicalmanager.internacao(data_in, data_out,obs,idpac,idcon,idfat) " +
                                    "VALUES (@data_in, @data_out,@obs,@idpac,@idcon,@idfat)";
                    base.conn.Open();
                    cmd = base.conn.CreateCommand();
                    cmd.CommandText = cmdStr;
                    cmd.Parameters.Add("@data_in", internacao.Data_in);
                    cmd.Parameters.Add("@data_out", internacao.Data_out);
                    cmd.Parameters.Add("@obs", internacao.Obs);
                    cmd.Parameters.Add("@idpac", internacao.Paciente.Idpac);
                    cmd.Parameters.Add("@idcon", internacao.Convenio.Codcon);
                    if(internacao.Fatura!=null)
                    cmd.Parameters.Add("@idfat", internacao.Fatura.Codfat);
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
                            "obs = @obs , idpac=@idpac, idcon=@idcon, idfat=@idfat"+
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
                cmd.Parameters.Add("@idfat", internacao.Fatura.Codfat);
                cmd.ExecuteNonQuery();
                base.conn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível atualizar a internação " + ex.Message);
            }
        }

        public void excluir(Internacao internacao)
        {
            string cmdStr = "DELETE FROM clinicalmanager.internacao " + 
			                "WHERE idint = @idint";
            try
            {
                base.conn.Open();
                cmd = base.conn.CreateCommand();
                cmd.CommandText = cmdStr;
                cmd.Parameters.Add("@idint", internacao.Codint);
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
            string sql = "select a.idint, a.data_in, a.data_out, a.obs, b.*, c.*, d.* "+
                         "from clinicalmanager.paciente b,clinicalmanager.internacao a "+
                         "left join clinicalmanager.fatura c on(a.idfat=c.idfat) "+
                         "left join clinicalmanager.convenio d on (a.idcon=d.idcon) "+
                         "where a.idpac=b.idpac " + 
						 "and idint = @idint";            
            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("@idint", codint);
            reader = base.execute(cmd);
            Internacao output = new Internacao();
            Fatura fatura = new Fatura();
            Convenio convenio = new Convenio();
            Paciente paciente = new Paciente();
            output.Codint = reader.GetInt16(0);
            output.Data_in = reader.GetDateTime(1);
            output.Data_out = reader.GetDateTime(2);
            output.Obs = reader.GetString(3);
            //Recuperando informações sobre paciente.
            paciente.Idpac = reader.GetInt16(4);
            paciente.Nome= reader.GetString(5);
            paciente.CPF= reader.GetString(6);
            //Recuperando informações sobre fatura.
            fatura.Codfat = reader.GetInt16(7);
            fatura.Valor_HN_Esp = reader.GetFloat(8);
            fatura.Valor_HN_Receb = reader.GetFloat(9);
            fatura.Valor_PRD = reader.GetFloat(10);
            //Recuperando informações sobre convenio.
            convenio.Codcon = reader.GetInt16(11);
            convenio.Descricao = reader.GetString(12);
            //Atribuir tabelas referenciadas à saída.
            output.Convenio = convenio;
            output.Fatura = fatura;
            output.Paciente = paciente;
            return output;
        }

        public DataSet consultarPorPaciente(int idpac)
        {
            string sql = "select a.idint, a.data_in, a.data_out, a.obs, b.*, c.*, d.* "+
                         "from clinicalmanager.paciente b,clinicalmanager.internacao a "+
                         "left join clinicalmanager.fatura c on(a.idfat=c.idfat) "+
                         "left join clinicalmanager.convenio d on (a.idcon=d.idcon) "+
                         "where a.idpac=b.idpac " + 
						 "and a.idpac = @idpac";            
            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("@idpac", idpac);
            return base.executeToDataset(cmd);
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

