
<%@ page import="useweb.Terceirizado" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'terceirizado.label', default: 'Terceirizado')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-terceirizado" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nome" title="${message(code: 'terceirizado.nome.label', default: 'Nome')}" />
			
				<g:sortableColumn property="dataNascimento" title="${message(code: 'terceirizado.dataNascimento.label', default: 'Data Nascimento')}" />
			
				<g:sortableColumn property="sexo" title="${message(code: 'terceirizado.sexo.label', default: 'Sexo')}" />
			
				<g:sortableColumn property="cpf" title="${message(code: 'terceirizado.cpf.label', default: 'Cpf')}" />
			
				<g:sortableColumn property="voluntario" title="${message(code: 'terceirizado.voluntario.label', default: 'Voluntario')}" />
			
				<th><g:message code="terceirizado.origem.label" default="Origem" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${terceirizadoInstanceList}" status="i" var="terceirizadoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${terceirizadoInstance.id}">${fieldValue(bean: terceirizadoInstance, field: "nome")}</g:link></td>
			
				<td><g:formatDate date="${terceirizadoInstance.dataNascimento}" /></td>
			
				<td>${fieldValue(bean: terceirizadoInstance, field: "sexo")}</td>
			
				<td>${fieldValue(bean: terceirizadoInstance, field: "cpf")}</td>
			
				<td><g:formatBoolean boolean="${terceirizadoInstance.voluntario}" /></td>
			
				<td>${fieldValue(bean: terceirizadoInstance, field: "origem")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${terceirizadoInstanceCount}" />
	</div>
</section>

</body>

</html>
