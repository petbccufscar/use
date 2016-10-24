
<%@ page import="linhasdecuidado.LinhadeCuidadoArea" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'linhadeCuidadoArea.label', default: 'LinhadeCuidadoArea')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-linhadeCuidadoArea" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="linhadeCuidadoArea.area.label" default="Area" /></th>
			
				<th><g:message code="linhadeCuidadoArea.linhadecuidado.label" default="Linhadecuidado" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${linhadeCuidadoAreaInstanceList}" status="i" var="linhadeCuidadoAreaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${linhadeCuidadoAreaInstance.id}">${fieldValue(bean: linhadeCuidadoAreaInstance, field: "area")}</g:link></td>
			
				<td>${fieldValue(bean: linhadeCuidadoAreaInstance, field: "linhadecuidado")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${linhadeCuidadoAreaInstanceCount}" />
	</div>
</section>

</body>

</html>
