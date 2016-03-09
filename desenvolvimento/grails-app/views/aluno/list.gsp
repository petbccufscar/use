
<%@ page import="useweb.Aluno" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'aluno.label', default: 'Aluno')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-aluno" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nome" title="${message(code: 'aluno.nome.label', default: 'Nome')}" />
			
				<g:sortableColumn property="dataNascimento" title="${message(code: 'aluno.dataNascimento.label', default: 'Data Nascimento')}" />
			
				<g:sortableColumn property="sexo" title="${message(code: 'aluno.sexo.label', default: 'Sexo')}" />
			
				<g:sortableColumn property="cpf" title="${message(code: 'aluno.cpf.label', default: 'Cpf')}" />
			
				<g:sortableColumn property="voluntario" title="${message(code: 'aluno.voluntario.label', default: 'Voluntario')}" />
			
				<g:sortableColumn property="login" title="${message(code: 'aluno.login.label', default: 'Login')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${alunoInstanceList}" status="i" var="alunoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${alunoInstance.id}">${fieldValue(bean: alunoInstance, field: "nome")}</g:link></td>
			
				<td><g:formatDate date="${alunoInstance.dataNascimento}" /></td>
			
				<td>${fieldValue(bean: alunoInstance, field: "sexo")}</td>
			
				<td>${fieldValue(bean: alunoInstance, field: "cpf")}</td>
			
				<td><g:formatBoolean boolean="${alunoInstance.voluntario}" /></td>
			
				<td>${fieldValue(bean: alunoInstance, field: "login")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${alunoInstanceCount}" />
	</div>
</section>

</body>

</html>
