using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Npgsql;
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
            URL = "server=localhost;User id=clinicalmanager;Password=cl1n1c4lm4n4g3r;Database=clinicalmanager";
            conn = new NpgsqlConnection(URL);
            conn.Open();            
        }
        public static Conexao getInstancia()
        {
            if (instancia==null)
            {
                instancia = new Conexao();
            }
            return instancia;
        }
        
        public System.Data.DataSet execute(string sql)
        {
            Npgsql.NpgsqlCommand cmd = conn.CreateCommand();
            Npgsql.NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd);
            cmd.CommandText = sql;
            
            System.Data.DataSet ds = new System.Data.DataSet("Exec");
            da.Fill(ds);
            return ds;
        }
    }
}
