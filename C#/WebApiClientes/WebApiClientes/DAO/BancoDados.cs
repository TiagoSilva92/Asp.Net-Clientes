using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace WebAPIClientes.DAO
{
    public class BancoDados
    {
        public static string connectionServer = ConfigurationManager.AppSettings["StringConexao"].ToString();

        private string _erro;

        public static BancoDados bancoDados = new BancoDados();

        public Task<DataTable> RetornarDadosUsuarioCadastrado(string procedure)
        {
            DataTable retornoBancoDados;

            try
            {
                retornoBancoDados = RetornardataTable(procedure);
            }
            catch (Exception ex)
            {
                throw new Exception($"Houve um problema ao Validar usuário e senha. Mensagem {ex.Message}");
            }

            return Task.FromResult<DataTable>(retornoBancoDados);
        }

        public Task<string> RetornarNumeroLinhasAfetadas(string procedure, string parametros)
        {
            string retorno = string.Empty;
            int linhasAfetadas;

            using (SqlConnection connection = new SqlConnection(connectionServer))
            {
                try
                {
                    if (connection.State == ConnectionState.Closed)
                        connection.Open();

                    string queryString = "Exec " + procedure + " " + parametros;

                    SqlCommand sqlcommand = new SqlCommand(queryString, connection);
                    sqlcommand.CommandTimeout = 120;

                    object resultado = sqlcommand.ExecuteNonQuery();

                    if (resultado != null)
                        retorno = resultado.ToString();

                    linhasAfetadas = -1;

                    if (!int.TryParse(retorno, out linhasAfetadas))
                        throw new Exception($"O retorno não é um número, mas sim uma string. Erro BD: {retorno}");
                    else
                        retorno = "1";
                }
                catch (Exception ex)
                {
                    retorno = "0";
                    connection.Close();
                    throw new Exception($"Problema ao retornar o número de linhas afetadas. Mensagem: {ex.Message}");
                }
                connection.Close();
                return Task.FromResult<string>(retorno);
            }
        }

        public DataTable RetornardataTable(string procedure)
        {
            DataTable datatable = new DataTable();

            _erro = null;
            System.Globalization.CultureInfo BR = new System.Globalization.CultureInfo("pt-BR");

            using (SqlConnection connection = new SqlConnection(connectionServer))
            {
                try
                {
                    if (connection.State == ConnectionState.Closed)
                        connection.Open();

                    string queryString = "Exec " + procedure + "";

                    SqlCommand sqlcommand = new SqlCommand(queryString, connection);
                    sqlcommand.CommandTimeout = 120;

                    SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlcommand);

                    dataAdapter.Fill(datatable);

                    connection.Close();
                    connection.Close();
                    return datatable;
                }
                catch (Exception ex)
                {
                    return datatable = null;
                    throw new Exception($"Erro ao buscar Clientes. Mensagem: {ex.Message}");
                }
                connection.Close();
            }
        }
    }
}