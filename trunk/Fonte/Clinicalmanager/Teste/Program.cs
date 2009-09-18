using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AcessoDados;
using System.Data;
using System.Configuration;
using Negocio;
using AcessoDados;
using Classes_Básicas;
using Npgsql;
namespace Teste
{
    class Program
    {
        static void Main(string[] args)
        {
            /*Fachada fachada = new Fachada();            
            System.Console.WriteLine(fachada.getPacientebyID(10).CPF);*/
            IList<Paciente> list = new List<Paciente>();
            Paciente p1 = new Paciente();
            Paciente p2 = new Paciente();
            p1.Nome = "renato";
            p2.Nome = "renata";
            list.Add(p1);
            list.Add(p2);
            Console.WriteLine(list.ToList<Paciente>()[0].ToString());
            System.Console.Read();
        }
    }
}
