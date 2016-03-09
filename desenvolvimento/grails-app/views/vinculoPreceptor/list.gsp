
<%@ page import="useweb.VinculoPreceptor" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'vinculoPreceptor.label', default: 'VinculoPreceptor')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-vinculoPreceptor" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="dataFim" title="${message(code: 'vinculoPreceptor.dataFim.label', default: 'Data Fim')}" />
			
				<g:sortableColumn property="dataInicio" title="${message(code: 'vinculoPreceptor.dataInicio.label', default: 'Data Inicio')}" />
			
				<th><g:message code="vinculoPreceptor.departamento.label" default="Departamento" /></th>
			
				<th><g:message code="vinculoPreceptor.preceptor.label" default="Preceptor" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${vinculoPreceptorInstanceList}" status="i" var="vinculoPreceptorInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${vinculoPreceptorInstance.id}">${fieldValue(bean: vinculoPreceptorInstance, field: "dataFim")}</g:link></td>
			
				<td><g:formatDate date="${vinculoPreceptorInstance.dataInicio}" /></td>
			
				<td>${fieldValue(bean: vinculoPreceptorInstance, field: "departamento")}</td>
			
				<td>${fieldValue(bean: vinculoPreceptorInstance, field: "preceptor")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${vinculoPreceptorInstanceCount}" />
	</div>
</section>

</body>

</html>
