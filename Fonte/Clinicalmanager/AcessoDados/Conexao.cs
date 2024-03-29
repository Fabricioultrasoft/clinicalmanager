﻿using System;
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
            URL = "server=pgsql.realinstitutodopulmao.com.br;User id=realinstitutodopulma; Password=a06r2329;Database=realinstitutodopulma;SearchPath=clinicalmanager, pg_catalog;";
            String URL_mydom = "server=renatocampelo.gotdns.com;User id=postgres;Password=a06r2329;Database=clinicalmanager;SearchPath=clinicalmanager, pg_catalog;";
            String URL_local = "server=localhost;User id=postgres;Password=a06r2329;Database=clinicalmanager;SearchPath=clinicalmanager, pg_catalog;";
            conn = new NpgsqlConnection(URL_local);
            
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
            //conn.Close();
            return output;
        }
        public NpgsqlDataReader executeSQL(string sql)
        {
            conn.Open();
            Npgsql.NpgsqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            NpgsqlDataReader output = cmd.ExecuteReader();
            output.Read();
            conn.Close();
            return output;
        }
        public DataSet executeToDataset(NpgsqlCommand cmd)
        {
            try
            {
                conn.Open();
                Npgsql.NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd);
                System.Data.DataSet ds = new System.Data.DataSet("Exec");
                da.Fill(ds);
                conn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);           
            }
            
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
