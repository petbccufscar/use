
<%@ page import="useweb.Departamento" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'departamento.label', default: 'Departamento')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-departamento" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="departamento.campus.label" default="Campus" /></th>
			
				<g:sortableColumn property="nome" title="${message(code: 'departamento.nome.label', default: 'Nome')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${departamentoInstanceList}" status="i" var="departamentoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${departamentoInstance.id}">${fieldValue(bean: departamentoInstance, field: "campus")}</g:link></td>
			
				<td>${fieldValue(bean: departamentoInstance, field: "nome")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${departamentoInstanceCount}" />
	</div>
</section>

</body>

</html>
