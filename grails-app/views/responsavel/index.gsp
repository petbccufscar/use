
<%@ page import="useweb.Responsavel" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'responsavel.label', default: 'Responsavel')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-responsavel" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nome" title="${message(code: 'responsavel.nome.label', default: 'Nome')}" />
			
				<g:sortableColumn property="dataNascimento" title="${message(code: 'responsavel.dataNascimento.label', default: 'Data Nascimento')}" />
			
				<g:sortableColumn property="sexo" title="${message(code: 'responsavel.sexo.label', default: 'Sexo')}" />
			
				<g:sortableColumn property="cpf" title="${message(code: 'responsavel.cpf.label', default: 'Cpf')}" />
			
				<g:sortableColumn property="voluntario" title="${message(code: 'responsavel.voluntario.label', default: 'Voluntario')}" />
			
				<g:sortableColumn property="login" title="${message(code: 'responsavel.login.label', default: 'Login')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${responsavelInstanceList}" status="i" var="responsavelInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${responsavelInstance.id}">${fieldValue(bean: responsavelInstance, field: "nome")}</g:link></td>
			
				<td><g:formatDate date="${responsavelInstance.dataNascimento}" /></td>
			
				<td>${fieldValue(bean: responsavelInstance, field: "sexo")}</td>
			
				<td>${fieldValue(bean: responsavelInstance, field: "cpf")}</td>
			
				<td><g:formatBoolean boolean="${responsavelInstance.voluntario}" /></td>
			
				<td>${fieldValue(bean: responsavelInstance, field: "login")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${responsavelInstanceCount}" />
	</div>
</section>

</body>

</html>
