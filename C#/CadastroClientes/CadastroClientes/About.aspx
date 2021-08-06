<%@ Page Title="Cadastrar" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="CadastroClientes.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="control-group">
		<label class="control-label">Nome</label>
		<div class="controls">
			<input id="nome" name="nome" type="text" placeholder="Insira seu nome" class="input-xlarge" required>
			<p class="help-block">* Campo Obrigatório</p>
		</div>
	</div>

	<div class="control-group">
		<label class="control-label">CPF</label>
		<div class="controls">
			<input id="cpf" name="nome" type="text" placeholder="Insira seu CPF" class="input-xlarge" required>
			<p class="help-block">* Campo Obrigatório</p>
		</div>
	</div>

	<!-- Select Basic -->
	<div class="control-group">
		<label class="control-label">Tipo de Cliente</label>
		<div class="controls">
			<select id="tipocliente" name="pais" class="input-xlarge">
				<option>Pessoa Física</option>
				<option>Pessoa Jurídica</option>
			</select>
		</div>
	</div>

	<!-- Multiple Radios -->
	<div class="control-group">
		<label class="control-label">Sexo</label>
		<div class="controls">
			<label class="radio">
				<input type="radio" name="sexo" value="Masculino" checked="checked">
				Masculino
			</label>
			<label class="radio">
				<input type="radio" name="sexo" value="Feminino">
				Feminino
			</label>
		</div>
	</div>

	<!-- Select Basic -->
	<div class="control-group">
		<label class="control-label">Situação do Cliente</label>
		<div class="controls">
			<select id="pais" name="pais" class="input-xlarge">
				<option>Ativo</option>
				<option>Devedor</option>
			</select>
		</div>
	</div>

	<!-- Button -->
	<div class="control-group">
		<label class="control-label"></label>
		<div class="controls">
			<button id="enviar" name="enviar" class="btn btn-primary">Cadastrar</button>
		</div>
	</div>
</asp:Content>
