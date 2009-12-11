using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Npgsql;
using System.Data;
namespace AcessoDados
{
    public class RepositorioUsuario
    {
        NpgsqlCommand cmd;
        NpgsqlDataReader reader;
        NpgsqlConnection conn;
        public String URL { get; set; }
        public bool login(String user, String pass)
        {
            String URL_local = "server=renato-pc;User id=postgres;Password=a06r2329;Database=clinicalmanager;SearchPath=clinicalmanager, pg_catalog;";
            string sql = "select login, privilegio from usuarios where login=@user and pass=@pass";
            try
            {
                URL = "server=pgsql.realinstitutodopulmao.com.br;User id=realinstitutodopulma; Password=a06r2329;Database=realinstitutodopulma";
                conn = new NpgsqlConnection();
                conn.ConnectionString = URL;
                cmd = conn.CreateCommand();
                cmd.CommandText = sql;
                cmd.Parameters.Add("@user", user);
                cmd.Parameters.Add("@pass", pass);
                conn.Open();
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    conn.Close();
                    return true;
                }
                else
                {
                    conn.Close();
                    return false;
                }
            }
            catch (Npgsql.NpgsqlException ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
