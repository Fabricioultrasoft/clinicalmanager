using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AcessoDados;
using System.Data;
using Classes_Básicas;
namespace Negocio
{
    public class CadastroFatura
    {
        private RepositorioFatura rep;
        public CadastroFatura()
        {
            rep = new RepositorioFatura();
        }

        public DataSet consultarTodos()
        {
            return rep.consultarTodos();
        }
        #region CRUD

        public string inserir(Fatura fat)
        {
            return rep.inserir(fat);
        }

        public void atualizar(Fatura fat)
        {
            rep.atualizar(fat);
        }

        public void exluir(Fatura fat)
        {
            rep.exluir(fat);
        }

        #endregion

        #region Crud Members


        public DataSet consultar(string codfat)
        {
            return rep.consultar(codfat);
        }
        #endregion
        public Internacao getUltimaInternacao(Int32 codprontuario)
        {
            return rep.getUltimaInternacao(codprontuario);
        }
        public void inserirItemFatura(Int32 idint, Int32 idfat, float valor)
        {
            rep.inserirItemFaturaTotal(idint, idfat, valor);
        }
        public string pagarPacial(Int32 idint, Int32 idpar, float valor, Int32 idfat)
        {
            return rep.pagarPacial(idint, idpar, valor, idfat);
        }
        public Int32 consultarID(string codfat)
        {
            return rep.consultarID(codfat);
        }
    }
}
