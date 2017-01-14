
<%@ page import="useweb.Colaborador" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'colaborador.label', default: 'Colaborador')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-colaborador" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nome" title="${message(code: 'colaborador.nome.label', default: 'Nome')}" />
			
				<g:sortableColumn property="dataNascimento" title="${message(code: 'colaborador.dataNascimento.label', default: 'Data Nascimento')}" />
			
				<g:sortableColumn property="sexo" title="${message(code: 'colaborador.sexo.label', default: 'Sexo')}" />
			
				<g:sortableColumn property="cpf" title="${message(code: 'colaborador.cpf.label', default: 'Cpf')}" />
			
				<g:sortableColumn property="voluntario" title="${message(code: 'colaborador.voluntario.label', default: 'Voluntario')}" />
			
				<g:sortableColumn property="login" title="${message(code: 'colaborador.login.label', default: 'Login')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${colaboradorInstanceList}" status="i" var="colaboradorInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${colaboradorInstance.id}">${fieldValue(bean: colaboradorInstance, field: "nome")}</g:link></td>
			
				<td><g:formatDate date="${colaboradorInstance.dataNascimento}" /></td>
			
				<td>${fieldValue(bean: colaboradorInstance, field: "sexo")}</td>
			
				<td>${fieldValue(bean: colaboradorInstance, field: "cpf")}</td>
			
				<td><g:formatBoolean boolean="${colaboradorInstance.voluntario}" /></td>
			
				<td>${fieldValue(bean: colaboradorInstance, field: "login")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${colaboradorInstanceCount}" />
	</div>
</section>

</body>

</html>
