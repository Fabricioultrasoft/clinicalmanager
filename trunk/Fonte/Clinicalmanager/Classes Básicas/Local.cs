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
        private bool geraprd;

        public bool Geraprd {
            get { return this.geraprd; }
            set { this.geraprd = value; }
        }
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
