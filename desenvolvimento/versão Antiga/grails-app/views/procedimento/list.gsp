
<%@ page import="linhasdecuidado.Procedimento" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'procedimento.label', default: 'Procedimento')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-procedimento" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="codigo" title="${message(code: 'procedimento.codigo.label', default: 'Codigo')}" />
			
				<g:sortableColumn property="nome" title="${message(code: 'procedimento.nome.label', default: 'Nome')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${procedimentoInstanceList}" status="i" var="procedimentoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${procedimentoInstance.id}">${fieldValue(bean: procedimentoInstance, field: "codigo")}</g:link></td>
			
				<td>${fieldValue(bean: procedimentoInstance, field: "nome")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${procedimentoInstanceCount}" />
	</div>
</section>

</body>

</html>
