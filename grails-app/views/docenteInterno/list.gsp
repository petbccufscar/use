
<%@ page import="useweb.DocenteInterno" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'docenteInterno.label', default: 'DocenteInterno')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-docenteInterno" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nome" title="${message(code: 'docenteInterno.nome.label', default: 'Nome')}" />
			
				<g:sortableColumn property="dataNascimento" title="${message(code: 'docenteInterno.dataNascimento.label', default: 'Data Nascimento')}" />
			
				<g:sortableColumn property="sexo" title="${message(code: 'docenteInterno.sexo.label', default: 'Sexo')}" />
			
				<g:sortableColumn property="cpf" title="${message(code: 'docenteInterno.cpf.label', default: 'Cpf')}" />
			
				<g:sortableColumn property="voluntario" title="${message(code: 'docenteInterno.voluntario.label', default: 'Voluntario')}" />
			
				<g:sortableColumn property="cbo" title="${message(code: 'docenteInterno.cbo.label', default: 'Cbo')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${docenteInternoInstanceList}" status="i" var="docenteInternoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${docenteInternoInstance.id}">${fieldValue(bean: docenteInternoInstance, field: "nome")}</g:link></td>
			
				<td><g:formatDate date="${docenteInternoInstance.dataNascimento}" /></td>
			
				<td>${fieldValue(bean: docenteInternoInstance, field: "sexo")}</td>
			
				<td>${fieldValue(bean: docenteInternoInstance, field: "cpf")}</td>
			
				<td><g:formatBoolean boolean="${docenteInternoInstance.voluntario}" /></td>
			
				<td>${fieldValue(bean: docenteInternoInstance, field: "cbo")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${docenteInternoInstanceCount}" />
	</div>
</section>

</body>

</html>
