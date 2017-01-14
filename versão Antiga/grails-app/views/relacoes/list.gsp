
<%@ page import="linhasdecuidado.Relacoes" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'relacoes.label', default: 'Relacoes')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-relacoes" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="relacoes.area.label" default="Area" /></th>
			
				<th><g:message code="relacoes.linhadecuidado.label" default="Linhadecuidado" /></th>
			
				<th><g:message code="relacoes.subarea.label" default="Subarea" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${relacoesInstanceList}" status="i" var="relacoesInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${relacoesInstance.id}">${fieldValue(bean: relacoesInstance, field: "area")}</g:link></td>
			
				<td>${fieldValue(bean: relacoesInstance, field: "linhadecuidado")}</td>
			
				<td>${fieldValue(bean: relacoesInstance, field: "subarea")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${relacoesInstanceCount}" />
	</div>
</section>

</body>

</html>
