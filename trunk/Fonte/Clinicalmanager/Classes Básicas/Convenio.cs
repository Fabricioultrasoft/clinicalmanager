using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Classes_Básicas
{
    public class Convenio
    {
        private string descricao;
        private int codcon;
        public string Descricao {
            get { return this.descricao; }
            set { this.descricao = value; }
        }
        public int Codcon {
            get { return this.codcon; }
            set { this.codcon = value; }
        }
    }
}
