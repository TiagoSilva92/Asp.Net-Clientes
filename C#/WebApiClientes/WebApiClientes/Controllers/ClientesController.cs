using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;
using WebAPIClientes.DAO;
using WebAPIClientes.Models;

namespace WebAPIClientes.Controllers
{
    public class ClientesController : ApiController
    {
        static private readonly BancoDados clienteAplicacao = new BancoDados();
        string clientesSerializados;
        int retornoInsercao;
        string erro;

        [HttpGet]
        public async Task<HttpResponseMessage> GetClienteAsync()
        {
            string procedure = "SelectClientes";

            try
            {
                DataTable retornoBancoDados;

                retornoBancoDados = await clienteAplicacao.RetornarDadosUsuarioCadastrado(procedure);

                clientesSerializados = JsonConvert.SerializeObject(retornoBancoDados);

                return RetornarResposta(clientesSerializados, HttpStatusCode.Accepted);
            }
            catch (Exception ex)
            {
                return RetornarResposta(clientesSerializados, HttpStatusCode.Forbidden);
            }
        }

        [HttpPost]
        public async Task<HttpResponseMessage> PostClienteAsync()
        {
            string procedure = "InsertCliente";

            return await TratarRespostaJson(procedure);
        }

        [HttpPut]
        public async Task<HttpResponseMessage> PutClienteAsync()
        {
            string procedure = "UpdateCliente";

            return await TratarRespostaJson(procedure);
        }

        [HttpDelete]
        public async Task<HttpResponseMessage> DeleteClienteAsync()
        {
            string procedure = "DeleteCliente";

            return await TratarRespostaJson(procedure);
        }

        private async Task<HttpResponseMessage> TratarRespostaJson(string procedure)
        {
            string parametros = "";

            string request = await Request.Content.ReadAsStringAsync();

            Cliente ClienteRecebidoBody = JsonConvert.DeserializeObject<Cliente>(request);

            Cliente usuarioRequisitado = new Cliente(ClienteRecebidoBody.Nome, ClienteRecebidoBody.CPF, ClienteRecebidoBody.TipoCliente, ClienteRecebidoBody.Sexo, ClienteRecebidoBody.SituacaoCliente);

            try
            {
                string nome = usuarioRequisitado.Nome;
                string cpf = usuarioRequisitado.CPF;
                int tipoCliente = usuarioRequisitado.TipoCliente;
                string sexo = usuarioRequisitado.Sexo;
                int situacaoCliente = usuarioRequisitado.SituacaoCliente;

                if (!procedure.Contains("Delete"))
                    parametros = $"'{nome}', '{cpf}', '{tipoCliente}', '{sexo}', '{situacaoCliente}'";
                else
                    parametros = $"'{cpf}'";

                retornoInsercao = Convert.ToInt32(await clienteAplicacao.RetornarNumeroLinhasAfetadas(procedure, parametros));

                if (retornoInsercao < 1)
                {
                    erro = $"Erro ao inserir o usuário {ClienteRecebidoBody.Nome}";
                    throw new Exception(erro);
                }
                return RetornarResposta(request, HttpStatusCode.Accepted);
            }
            catch (Exception ex)
            {
                return RetornarResposta(request, HttpStatusCode.Forbidden);
            }
        }

        private HttpResponseMessage RetornarResposta(string conteudo, HttpStatusCode statusHttpResposta)
        {
            try
            {
                HttpResponseMessage response = Request.CreateResponse(statusHttpResposta);

                response.Content = new StringContent(conteudo, Encoding.UTF8);

                return response;
            }
            catch (Exception)
            {
                throw new Exception("Erro ao executar o método 'RetornarResposta'");
            }
        }
    }
}