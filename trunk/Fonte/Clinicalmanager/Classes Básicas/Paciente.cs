using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Classes_Básicas
{
    public class Paciente
    {
        private string nome;
        private Int32 idpac;
        public string CPF { get; set; }
        public string Nome
        {
            get { return this.nome; }
            set { nome = value; }
        }
        public int Idpac { 
            get { return this.idpac; }
        set{this.idpac=value; }
        }
        public string ToString()
        {
            return nome;
        }
    }
}
