
<%@ page import="useweb.AlunoExterno" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'alunoExterno.label', default: 'AlunoExterno')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-alunoExterno" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nome" title="${message(code: 'alunoExterno.nome.label', default: 'Nome')}" />
			
				<g:sortableColumn property="dataNascimento" title="${message(code: 'alunoExterno.dataNascimento.label', default: 'Data Nascimento')}" />
			
				<g:sortableColumn property="sexo" title="${message(code: 'alunoExterno.sexo.label', default: 'Sexo')}" />
			
				<g:sortableColumn property="cpf" title="${message(code: 'alunoExterno.cpf.label', default: 'Cpf')}" />
			
				<g:sortableColumn property="voluntario" title="${message(code: 'alunoExterno.voluntario.label', default: 'Voluntario')}" />
			
				<g:sortableColumn property="login" title="${message(code: 'alunoExterno.login.label', default: 'Login')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${alunoExternoInstanceList}" status="i" var="alunoExternoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${alunoExternoInstance.id}">${fieldValue(bean: alunoExternoInstance, field: "nome")}</g:link></td>
			
				<td><g:formatDate date="${alunoExternoInstance.dataNascimento}" /></td>
			
				<td>${fieldValue(bean: alunoExternoInstance, field: "sexo")}</td>
			
				<td>${fieldValue(bean: alunoExternoInstance, field: "cpf")}</td>
			
				<td><g:formatBoolean boolean="${alunoExternoInstance.voluntario}" /></td>
			
				<td>${fieldValue(bean: alunoExternoInstance, field: "login")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${alunoExternoInstanceCount}" />
	</div>
</section>

</body>

</html>
