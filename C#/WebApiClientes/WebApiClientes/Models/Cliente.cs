using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPIClientes.Models
{
    public class Cliente
    {
        public string Nome { get; set; }
        public string CPF { get; set; }
        public int TipoCliente { get; set; }
        public string Sexo { get; set; }
        public int SituacaoCliente { get; set; }

        public Cliente(string nome, string cpf, int tipoCliente, string sexo, int situacaoCliente)
        {
            this.Nome = nome;
            this.CPF = cpf;
            this.TipoCliente = tipoCliente;
            this.Sexo = sexo;
            this.SituacaoCliente = situacaoCliente;
        }
    }
}