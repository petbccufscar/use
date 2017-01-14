
<%@ page import="useweb.VinculoTA" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'vinculoTA.label', default: 'VinculoTA')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-vinculoTA" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="dataInicio" title="${message(code: 'vinculoTA.dataInicio.label', default: 'Data Inicio')}" />
			
				<g:sortableColumn property="dataTermino" title="${message(code: 'vinculoTA.dataTermino.label', default: 'Data Termino')}" />
			
				<th><g:message code="vinculoTA.departamento.label" default="Departamento" /></th>
			
				<th><g:message code="vinculoTA.tecnicos.label" default="Tecnicos" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${vinculoTAInstanceList}" status="i" var="vinculoTAInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${vinculoTAInstance.id}">${fieldValue(bean: vinculoTAInstance, field: "dataInicio")}</g:link></td>
			
				<td><g:formatDate date="${vinculoTAInstance.dataTermino}" /></td>
			
				<td>${fieldValue(bean: vinculoTAInstance, field: "departamento")}</td>
			
				<td>${fieldValue(bean: vinculoTAInstance, field: "tecnicos")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${vinculoTAInstanceCount}" />
	</div>
</section>

</body>

</html>
