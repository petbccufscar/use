
<%@ page import="useweb.VinculoTerceirizado" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'vinculoTerceirizado.label', default: 'VinculoTerceirizado')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-vinculoTerceirizado" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="dataFim" title="${message(code: 'vinculoTerceirizado.dataFim.label', default: 'Data Fim')}" />
			
				<g:sortableColumn property="dataInicio" title="${message(code: 'vinculoTerceirizado.dataInicio.label', default: 'Data Inicio')}" />
			
				<th><g:message code="vinculoTerceirizado.origem.label" default="Origem" /></th>
			
				<th><g:message code="vinculoTerceirizado.terceirizado.label" default="Terceirizado" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${vinculoTerceirizadoInstanceList}" status="i" var="vinculoTerceirizadoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${vinculoTerceirizadoInstance.id}">${fieldValue(bean: vinculoTerceirizadoInstance, field: "dataFim")}</g:link></td>
			
				<td><g:formatDate date="${vinculoTerceirizadoInstance.dataInicio}" /></td>
			
				<td>${fieldValue(bean: vinculoTerceirizadoInstance, field: "origem")}</td>
			
				<td>${fieldValue(bean: vinculoTerceirizadoInstance, field: "terceirizado")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${vinculoTerceirizadoInstanceCount}" />
	</div>
</section>

</body>

</html>
