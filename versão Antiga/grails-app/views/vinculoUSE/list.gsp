
<%@ page import="useweb.VinculoUSE" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'vinculoUSE.label', default: 'VinculoUSE')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-vinculoUSE" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="vinculoUSE.colaborador.label" default="Colaborador" /></th>
			
				<g:sortableColumn property="dataInicio" title="${message(code: 'vinculoUSE.dataInicio.label', default: 'Data Inicio')}" />
			
				<g:sortableColumn property="dataTermino" title="${message(code: 'vinculoUSE.dataTermino.label', default: 'Data Termino')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${vinculoUSEInstanceList}" status="i" var="vinculoUSEInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${vinculoUSEInstance.id}">${fieldValue(bean: vinculoUSEInstance, field: "colaborador")}</g:link></td>
			
				<td><g:formatDate date="${vinculoUSEInstance.dataInicio}" /></td>
			
				<td><g:formatDate date="${vinculoUSEInstance.dataTermino}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${vinculoUSEInstanceCount}" />
	</div>
</section>

</body>

</html>
