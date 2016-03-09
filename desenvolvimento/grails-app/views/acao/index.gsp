
<%@ page import="linhasdecuidado.Acao" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'acao.label', default: 'Acao')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-acao" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nome" title="${message(code: 'acao.nome.label', default: 'Nome')}" />
			
				<g:sortableColumn property="descricao" title="${message(code: 'acao.descricao.label', default: 'Descricao')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${acaoInstanceList}" status="i" var="acaoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${acaoInstance.id}">${fieldValue(bean: acaoInstance, field: "nome")}</g:link></td>
			
				<td>${fieldValue(bean: acaoInstance, field: "descricao")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${acaoInstanceCount}" />
	</div>
</section>

</body>

</html>
