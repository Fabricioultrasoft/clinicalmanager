using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Classes_Básicas
{
    public class Fatura
    {
        public DateTime Data_inicio { get; set; }
        public DateTime Data_fim { get; set; }
        public Int32 Mes_referencia { get; set; }
        public char Tipo { get; set; }
        public string Codigo_HP { get; set; }
        public DateTime Data_fechamento{get;set;}
        public bool Fechada { get; set; }
        public bool Paga { get; set; }
        public Int32 Codfat { get; set; }
    }
}
