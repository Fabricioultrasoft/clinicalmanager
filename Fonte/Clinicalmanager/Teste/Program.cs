using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AcessoDados;
using System.Data;
namespace Teste
{
    class Program
    {
        static void Main(string[] args)
        {
            Conexao prg = Conexao.getInstancia();
            DataSet ds = prg.execute("select * from clinicalmanager.paciente");
            
            System.Console.Read();
        }
    }
}
