using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AcessoDados;
using System.Data;
using System.Configuration;
using Negocio;
using AcessoDados;
using Npgsql;
namespace Teste
{
    class Program
    {
        static void Main(string[] args)
        {
            Fachada fachada = new Fachada();
            
                System.Console.WriteLine(fachada.getPacientebyID(10).CPF);

            System.Console.Read();
        }
    }
}
