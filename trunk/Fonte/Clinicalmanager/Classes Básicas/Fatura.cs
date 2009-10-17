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
        public DateTime Data_inicio { get; set; }
        public DateTime Data_fim { get; set; }
        public int Mes_referencia { get; set; }
        public char Tipo { get; set; }
        public string Codigo_HP { get; set; }
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
