using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Classes_Básicas
{
    public class Fatura
    {
        private float valor_esperado_honorario, valor_lancado_honorario, valor_recebido_honorario,
            valor_produtividade;
        private int codfat;

        public float Valor_HN_Esp {
            get { return this.valor_esperado_honorario; }
            set { this.valor_esperado_honorario = value; }
        }
        public float Valor_HN_Lanc
        {
            get { return this.valor_lancado_honorario; }
            set { this.valor_lancado_honorario = value; }
        }

        public float Valor_HN_Receb
        {
            get { return this.valor_recebido_honorario; }
            set { this.valor_recebido_honorario = value; }
        }

        public float Valor_PRD
        {
            get { return this.valor_produtividade; }
            set { this.valor_produtividade = value; }
        }
        public int Codfat {
            get { return this.codfat; }
            set { this.codfat = value; }
        }
    }
}
