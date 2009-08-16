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
                                    " vl_recebido_pr, idint) values (@vl_esperado_hn, @vl_recebido_hn, " +
                                    " @vl_recebido_pr, @idint)";
                    base.conn.Open();
                    cmd = base.conn.CreateCommand();
                    cmd.CommandText = cmdStr;
                    cmd.Parameters.Add("@nome", medico.Nome);
                    cmd.ExecuteNonQuery();
                    base.conn.Close();
                }
                catch (Exception ex)
                {

                    throw new Exception("Erro ao incluir paciente: " + ex.Message);
                }
            }
        }








        public void atualizar(Medico medico)
        {
            string cmdStr = "update clinicalmanager.medico set nome=@nome where idmed = @idmed";
            try
            {
                base.conn.Open();
                cmd = base.conn.CreateCommand();
                cmd.CommandText = cmdStr;
                cmd.Parameters.Add("@idmed", medico.Idmed);
                cmd.Parameters.Add("@nome", medico.Nome);
                cmd.ExecuteNonQuery();
                base.conn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível remover o paciente " + ex.Message);
            }
        }

        public void exluir(Medico medico)
        {
            string cmdStr = "delete from clinicalmanager.paciente where idpad = @idpac";
            try
            {
                base.conn.Open();
                cmd = base.conn.CreateCommand();
                cmd.CommandText = cmdStr;
                //cmd.Parameters.Add("@idpac", medico.Idpac);
                cmd.ExecuteNonQuery();
                base.conn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível remover o paciente " + ex.Message);
            }
        }

        public Medico consultar(string nome)
        {
            string sql = "select idmed, nome from clinicalmanager.medico where nome like '@nome'";
            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("?nome", nome);
            reader = base.execute(cmd);
            Medico output = new Medico();
            output.Nome = reader.GetString(1);
            output.Idmed = reader.GetInt16(0);
            return output;
        }

        public DataSet consultarTodos()
        {
            string sql = "select * from clinicalmanager.medico";
            Npgsql.NpgsqlCommand cmd = base.conn.CreateCommand();
            //cmd.CommandText = 
            return base.execute(sql);
        }
    }
}
