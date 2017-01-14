
<%@ page import="useweb.VinculoDocenteExterno" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'vinculoDocenteExterno.label', default: 'VinculoDocenteExterno')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-vinculoDocenteExterno" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="dataFim" title="${message(code: 'vinculoDocenteExterno.dataFim.label', default: 'Data Fim')}" />
			
				<g:sortableColumn property="dataInicio" title="${message(code: 'vinculoDocenteExterno.dataInicio.label', default: 'Data Inicio')}" />
			
				<th><g:message code="vinculoDocenteExterno.docenteexterno.label" default="Docenteexterno" /></th>
			
				<th><g:message code="vinculoDocenteExterno.origem.label" default="Origem" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${vinculoDocenteExternoInstanceList}" status="i" var="vinculoDocenteExternoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${vinculoDocenteExternoInstance.id}">${fieldValue(bean: vinculoDocenteExternoInstance, field: "dataFim")}</g:link></td>
			
				<td><g:formatDate date="${vinculoDocenteExternoInstance.dataInicio}" /></td>
			
				<td>${fieldValue(bean: vinculoDocenteExternoInstance, field: "docenteexterno")}</td>
			
				<td>${fieldValue(bean: vinculoDocenteExternoInstance, field: "origem")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${vinculoDocenteExternoInstanceCount}" />
	</div>
</section>

</body>

</html>
