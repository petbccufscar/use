
<%@ page import="useweb.EntrevistaInicial" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'entrevistaInicial.label', default: 'EntrevistaInicial')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-entrevistaInicial" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="entrevistaInicial.colaborador.label" default="Colaborador" /></th>
			
				<g:sortableColumn property="data" title="${message(code: 'entrevistaInicial.data.label', default: 'Data')}" />
			
				<th><g:message code="entrevistaInicial.usuario.label" default="Usuario" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${entrevistaInicialInstanceList}" status="i" var="entrevistaInicialInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${entrevistaInicialInstance.id}">${fieldValue(bean: entrevistaInicialInstance, field: "colaborador")}</g:link></td>
			
				<td><g:formatDate date="${entrevistaInicialInstance.data}" /></td>
			
				<td>${fieldValue(bean: entrevistaInicialInstance, field: "usuario")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${entrevistaInicialInstanceCount}" />
	</div>
</section>

</body>

</html>
