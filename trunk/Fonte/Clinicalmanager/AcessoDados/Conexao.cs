using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Npgsql;
using System.Configuration;
using System.Data;

namespace AcessoDados
{
    public class Conexao
    {
        protected NpgsqlConnection conn;
        static Conexao instancia;
        private string url;
        public string URL {
            get { return this.url; }
            set { this.url = value; }
        }
        
        public Conexao()
        {
            //URL = ConfigurationManager.ConnectionStrings["conn"].ConnectionString; 
            URL = "server=localhost;User id=clinicalmanager;Password=cl1n1c4lm4n4g3r;Database=clinicalmanager";
            conn = new NpgsqlConnection(URL);
            //conn.Open();            
        }
        public static Conexao getInstancia()
        {
            if (instancia==null)
            {
                instancia = new Conexao();
            }
            return instancia;
        }

        public NpgsqlDataReader execute(NpgsqlCommand cmd)
        {
            conn.Open();
            NpgsqlDataReader output = cmd.ExecuteReader();
            conn.Close();
            return output;
        }
        public DataSet execute(string sql)
        {
            conn.Open();
            Npgsql.NpgsqlCommand cmd = conn.CreateCommand();
            Npgsql.NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd);
            cmd.CommandText = sql;            
            System.Data.DataSet ds = new System.Data.DataSet("Exec");
            da.Fill(ds);
            conn.Close();
            return ds;
        }
    }
}
