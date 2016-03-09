
<%@ page import="useweb.AlunoInterno" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'alunoInterno.label', default: 'AlunoInterno')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-alunoInterno" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nome" title="${message(code: 'alunoInterno.nome.label', default: 'Nome')}" />
			
				<g:sortableColumn property="dataNascimento" title="${message(code: 'alunoInterno.dataNascimento.label', default: 'Data Nascimento')}" />
			
				<g:sortableColumn property="sexo" title="${message(code: 'alunoInterno.sexo.label', default: 'Sexo')}" />
			
				<g:sortableColumn property="cpf" title="${message(code: 'alunoInterno.cpf.label', default: 'Cpf')}" />
			
				<g:sortableColumn property="voluntario" title="${message(code: 'alunoInterno.voluntario.label', default: 'Voluntario')}" />
			
				<g:sortableColumn property="ra" title="${message(code: 'alunoInterno.ra.label', default: 'Ra')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${alunoInternoInstanceList}" status="i" var="alunoInternoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${alunoInternoInstance.id}">${fieldValue(bean: alunoInternoInstance, field: "nome")}</g:link></td>
			
				<td><g:formatDate date="${alunoInternoInstance.dataNascimento}" /></td>
			
				<td>${fieldValue(bean: alunoInternoInstance, field: "sexo")}</td>
			
				<td>${fieldValue(bean: alunoInternoInstance, field: "cpf")}</td>
			
				<td><g:formatBoolean boolean="${alunoInternoInstance.voluntario}" /></td>
			
				<td>${fieldValue(bean: alunoInternoInstance, field: "ra")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${alunoInternoInstanceCount}" />
	</div>
</section>

</body>

</html>
