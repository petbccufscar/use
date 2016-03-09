
<%@ page import="linhasdecuidado.Extensao" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'extensao.label', default: 'Extensao')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-extensao" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nome" title="${message(code: 'extensao.nome.label', default: 'Nome')}" />
			
				<g:sortableColumn property="descricao" title="${message(code: 'extensao.descricao.label', default: 'Descricao')}" />
			
				<g:sortableColumn property="dataDeInicio" title="${message(code: 'extensao.dataDeInicio.label', default: 'Data De Inicio')}" />
			
				<g:sortableColumn property="dataDeTermino" title="${message(code: 'extensao.dataDeTermino.label', default: 'Data De Termino')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${extensaoInstanceList}" status="i" var="extensaoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${extensaoInstance.id}">${fieldValue(bean: extensaoInstance, field: "nome")}</g:link></td>
			
				<td>${fieldValue(bean: extensaoInstance, field: "descricao")}</td>
			
				<td><g:formatDate date="${extensaoInstance.dataDeInicio}" /></td>
			
				<td><g:formatDate date="${extensaoInstance.dataDeTermino}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${extensaoInstanceCount}" />
	</div>
</section>

</body>

</html>
