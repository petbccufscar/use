
<%@ page import="linhasdecuidado.LCAreaSubAreaAcao" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'LCAreaSubAreaAcao.label', default: 'LCAreaSubAreaAcao')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-LCAreaSubAreaAcao" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="LCAreaSubAreaAcao.acao.label" default="Acao" /></th>
			
				<th><g:message code="LCAreaSubAreaAcao.lcareasubarea.label" default="Lcareasubarea" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${LCAreaSubAreaAcaoInstanceList}" status="i" var="LCAreaSubAreaAcaoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${LCAreaSubAreaAcaoInstance.id}">${fieldValue(bean: LCAreaSubAreaAcaoInstance, field: "acao")}</g:link></td>
			
				<td>${fieldValue(bean: LCAreaSubAreaAcaoInstance, field: "lcareasubarea")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${LCAreaSubAreaAcaoInstanceCount}" />
	</div>
</section>

</body>

</html>
