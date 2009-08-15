using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Classes_Básicas;
using Npgsql;
using System.Data;
namespace AcessoDados
{
    public class RepositorioInternacao:Conexao
    {
        NpgsqlCommand cmd;
        NpgsqlDataReader reader;

    }
}
