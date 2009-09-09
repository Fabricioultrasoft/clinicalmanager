using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Classes_Básicas;
using Npgsql;
using System.Data;
namespace AcessoDados
{
    public class RepositorioConvenio:Conexao
    {
        NpgsqlCommand cmd;
        NpgsqlDataReader reader;

        #region CRUD
        public Convenio getConveniobyId(int idconv)
        {
            string sql = "select idcon, descricao from clinicalmanager.convenio" +
                         " where idcon = @idcon";
            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.Add("@idcon", idconv);
            reader = base.execute(cmd);
            Convenio output = new Convenio();
            output.Codcon = reader.GetInt16(0);
            output.Descricao = reader.GetString(1);
            return output;
        }
        public DataSet getAllConenio()
        {
            string sql = "select idcon, descricao from clinicalmanager.convenio";
            cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            return base.executeToDataset(cmd);
        }

        #endregion
    }
}
