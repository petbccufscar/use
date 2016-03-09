
<%@ page import="useweb.Docente" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'docente.label', default: 'Docente')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-docente" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nome" title="${message(code: 'docente.nome.label', default: 'Nome')}" />
			
				<g:sortableColumn property="dataNascimento" title="${message(code: 'docente.dataNascimento.label', default: 'Data Nascimento')}" />
			
				<g:sortableColumn property="sexo" title="${message(code: 'docente.sexo.label', default: 'Sexo')}" />
			
				<g:sortableColumn property="cpf" title="${message(code: 'docente.cpf.label', default: 'Cpf')}" />
			
				<g:sortableColumn property="voluntario" title="${message(code: 'docente.voluntario.label', default: 'Voluntario')}" />
			
				<g:sortableColumn property="cbo" title="${message(code: 'docente.cbo.label', default: 'Cbo')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${docenteInstanceList}" status="i" var="docenteInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${docenteInstance.id}">${fieldValue(bean: docenteInstance, field: "nome")}</g:link></td>
			
				<td><g:formatDate date="${docenteInstance.dataNascimento}" /></td>
			
				<td>${fieldValue(bean: docenteInstance, field: "sexo")}</td>
			
				<td>${fieldValue(bean: docenteInstance, field: "cpf")}</td>
			
				<td><g:formatBoolean boolean="${docenteInstance.voluntario}" /></td>
			
				<td>${fieldValue(bean: docenteInstance, field: "cbo")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${docenteInstanceCount}" />
	</div>
</section>

</body>

</html>
