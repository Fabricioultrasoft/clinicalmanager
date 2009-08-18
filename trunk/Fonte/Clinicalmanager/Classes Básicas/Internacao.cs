using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Classes_Básicas
{
    public class Internacao
    {
        private DateTime data_in,data_out;
        private string obs;
        private int codint;
        public Paciente Paciente { get; set; }
        public Convenio Convenio { get; set; }
        public Fatura Fatura { get; set; }
        
        public string Obs {
            get { return this.obs; }
            set { this.obs = value; }
        }
        public DateTime Data_in
        {
            get { return this.data_in; }
            set { this.data_in = value; }
        }

        public DateTime Data_out
        {
            get { return data_out; }
            set { this.data_out = value; }
        }
		
        public int Codint {
            get { return this.codint; }
            set { this.codint = value; }
        }		

    }
}
