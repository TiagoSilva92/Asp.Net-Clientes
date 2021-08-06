using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CadastroClientes.Models
{
    public class Cliente
    {
        public string Nome { get; set; }
        public string CPF { get; set; }
        public int TipoCliente { get; set; }
        public string Sexo { get; set; }
        public int SituacaoCliente { get; set; }

        public override string ToString()
        {
            return string.Format($"{Nome}, {CPF}");
        }
    }
}