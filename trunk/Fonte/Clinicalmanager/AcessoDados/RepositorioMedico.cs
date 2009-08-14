using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Classes_Básicas;
using Npgsql;
using System.Data;
namespace AcessoDados
{
    public class RepositorioMedico:Conexao
    {
        NpgsqlCommand cmd;
        NpgsqlDataReader reader;

        public void inserir(Medico medico)
        {
            if (medico != null)
            {
                try
                {
                    string cmdStr = "insert into clinicalmanager.medico(nome) values (@nome)";
                    base.conn.Open();
                    cmd = base.conn.CreateCommand();
                    cmd.CommandText = cmdStr;
                    cmd.Parameters.Add("@nome", medico.Nome);
                    cmd.ExecuteNonQuery();
                    base.conn.Close();
                }
                catch (Exception ex)
                {

                    throw new Exception("Erro ao incluir paciente");
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
                cmd.Parameters.Add("@idpac", medico.Idmed);
                cmd.Parameters.Add("@nome", medico.Nome);
                cmd.ExecuteNonQuery();
                base.conn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível remover o paciente");
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
                throw new Exception("Não foi possível remover o paciente");
            }
        }

        public Paciente consultar(string nome)
        {
            string sql = "select idmed, nome from clinicalmanager.medico where nome like '?nome'";
            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("?nome", nome);
            reader = base.execute(cmd);
            Paciente output = new Paciente();
            output.Nome = reader.GetString(1);
            output.Idpac = reader.GetInt16(0);
            return output;
            throw new NotImplementedException();
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
