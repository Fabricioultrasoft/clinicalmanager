using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Classes_Básicas
{
    public class Local
    {
        private string descricao;
        private int codloc;

        public string Descricao {
            get { return this.descricao; }
            set { this.descricao = value; }
        }
        public int Codloc {
            get { return this.codloc; }
            set { this.codloc = value; }
        }
    }
}
