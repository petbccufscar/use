
<%@ page import="linhasdecuidado.LinhaDeCuidado" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'linhaDeCuidado.label', default: 'LinhaDeCuidado')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-linhaDeCuidado" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nome" title="${message(code: 'linhaDeCuidado.nome.label', default: 'Nome')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${linhaDeCuidadoInstanceList}" status="i" var="linhaDeCuidadoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${linhaDeCuidadoInstance.id}">${fieldValue(bean: linhaDeCuidadoInstance, field: "nome")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${linhaDeCuidadoInstanceCount}" />
	</div>
</section>

</body>

</html>
