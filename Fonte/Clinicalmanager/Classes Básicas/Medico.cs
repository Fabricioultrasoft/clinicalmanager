using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Classes_Básicas
{
    public class Medico
    {
        private Int32 idmed;
        private string nome;
        public string Nome {
            get { return this.nome; }
            set { this.nome = value; }
        }
        public Int32 Idmed {
            get { return this.idmed; }
            set { this.idmed = value; }
        }
    }
}
