using CadastroClientes.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;

namespace CadastroClientes.Repositorio
{
    public class ClienteRepositorio
    {
        HttpClient cliente = new HttpClient();

        public ClienteRepositorio()
        {
            cliente.BaseAddress = new Uri("https://localhost:44333/");

            cliente.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));
        }

        public async Task<Cliente> GetClienteAsync()
        {
            HttpResponseMessage response = await cliente.GetAsync("api/Clientes");

            if (response.IsSuccessStatusCode)
            {
                var dados = await response.Content.ReadAsStringAsync();

                return JsonConvert.DeserializeObject<List<Cliente>>(dados);
            }
            return new List<Cliente>();
        }
    }
}