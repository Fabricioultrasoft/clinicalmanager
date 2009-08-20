using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Classes_Básicas
{
    public class Fatura
    {
        private DateTime data_fechamento;
        private bool fechada, paga;
        private int codfat;
        public DateTime Data_fechamento {
            get { return this.data_fechamento; }
            set { this.data_fechamento = value; }
        }
        public bool Fechada {
            get { return this.fechada; }
            set { this.fechada = value; }
        }
        public bool Paga {
            get { return this.paga; }
            set { this.paga = value; }
        }
        public int Codfat {
            get { return this.codfat; }
            set { this.codfat = value; }
        }
    }
}
