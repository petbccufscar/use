
<%@ page import="linhasdecuidado.LCAreaSubArea" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'LCAreaSubArea.label', default: 'LCAreaSubArea')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-LCAreaSubArea" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="LCAreaSubArea.linhadecuidadoarea.label" default="Linhadecuidadoarea" /></th>
			
				<th><g:message code="LCAreaSubArea.subarea.label" default="Subarea" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${LCAreaSubAreaInstanceList}" status="i" var="LCAreaSubAreaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${LCAreaSubAreaInstance.id}">${fieldValue(bean: LCAreaSubAreaInstance, field: "linhadecuidadoarea")}</g:link></td>
			
				<td>${fieldValue(bean: LCAreaSubAreaInstance, field: "subarea")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${LCAreaSubAreaInstanceCount}" />
	</div>
</section>

</body>

</html>
