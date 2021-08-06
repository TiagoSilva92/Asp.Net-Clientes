using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CadastroClientes.Scripts {

	var done = 0;
	var usuario = document.getElementsByName('email')[0].value;
	usuario = usuario.toLowerCase();
	var senha = document.getElementsByName('pass')[0].value;

	var dados = { "Nome": usuario, "Senha": senha };

	if (usuario == null || senha == null) {
		alert("Usuário ou senha não digitado.");
	}

	var json = JSON.stringify(dados);

	var httpRequest = new XMLHttpRequest();

	httpRequest.open("GET", "https://localhost:44333/api/Clientes", true);

	httpRequest.onreadystatechange = () => {
		if (httpRequest.readyState == 4 && httpRequest.status == 202) {
			var data = httpRequest.responseText;
			var json = JSON.parse(data);
			var link = json["Link"];
			var tipoAcesso = json["TipoAcesso"];
			var nome = json["Nome"];
			var token = json["Token"];
			var senha = json["Senha"];

			var parametros = "?nome:" + nome + "&senha:" + senha + "&token:" + token;
			var token = "&token:" + token;

			if (token == null) {
				alert("Usuário ou senha invalido!");
			}

			if (tipoAcesso == "Externo") {
				if (link.indexOf("Santos") > 1) {
					window.location.href = "http://bragancatecdet.ddns.net/CETSantos/Login.aspx?ReturnUrl=%2fCETSantos%2f"
				}
				else {
					window.location.href = link + parametros;
				}
			}
			else {
				sessionStorage.setItem('parametros', parametros);
				sessionStorage.setItem('token', token);
				window.location.href = "acesso-interno.html";
			}
		}

		if (httpRequest.readyState == 4 && httpRequest.status == 403) {
			var data = httpRequest.responseText;
			var json = JSON.parse(data);
			var erro = json["Erro"];

			if (erro != null) {
				alert(erro);
				document.getElementsByName('email')[0].value = '';
				document.getElementsByName('pass')[0].value = '';
			}
		}
	}
}
