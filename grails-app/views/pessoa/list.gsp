
<%@ page import="useweb.Pessoa" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'pessoa.label', default: 'Pessoa')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-pessoa" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nome" title="${message(code: 'pessoa.nome.label', default: 'Nome')}" />
			
				<g:sortableColumn property="dataNascimento" title="${message(code: 'pessoa.dataNascimento.label', default: 'Data Nascimento')}" />
			
				<g:sortableColumn property="sexo" title="${message(code: 'pessoa.sexo.label', default: 'Sexo')}" />
			
				<g:sortableColumn property="cpf" title="${message(code: 'pessoa.cpf.label', default: 'Cpf')}" />
			
				<g:sortableColumn property="orgaoEmissor" title="${message(code: 'pessoa.orgaoEmissor.label', default: 'Orgao Emissor')}" />
			
				<g:sortableColumn property="rg" title="${message(code: 'pessoa.rg.label', default: 'Rg')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${pessoaInstanceList}" status="i" var="pessoaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${pessoaInstance.id}">${fieldValue(bean: pessoaInstance, field: "nome")}</g:link></td>
			
				<td><g:formatDate date="${pessoaInstance.dataNascimento}" /></td>
			
				<td>${fieldValue(bean: pessoaInstance, field: "sexo")}</td>
			
				<td>${fieldValue(bean: pessoaInstance, field: "cpf")}</td>
			
				<td>${fieldValue(bean: pessoaInstance, field: "orgaoEmissor")}</td>
			
				<td>${fieldValue(bean: pessoaInstance, field: "rg")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${pessoaInstanceCount}" />
	</div>
</section>

</body>

</html>
