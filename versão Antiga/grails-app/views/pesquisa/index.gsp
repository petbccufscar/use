
<%@ page import="linhasdecuidado.Pesquisa" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'pesquisa.label', default: 'Pesquisa')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-pesquisa" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nome" title="${message(code: 'pesquisa.nome.label', default: 'Nome')}" />
			
				<g:sortableColumn property="descricao" title="${message(code: 'pesquisa.descricao.label', default: 'Descricao')}" />
			
				<g:sortableColumn property="dataDeInicio" title="${message(code: 'pesquisa.dataDeInicio.label', default: 'Data De Inicio')}" />
			
				<g:sortableColumn property="dataDeTermino" title="${message(code: 'pesquisa.dataDeTermino.label', default: 'Data De Termino')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${pesquisaInstanceList}" status="i" var="pesquisaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${pesquisaInstance.id}">${fieldValue(bean: pesquisaInstance, field: "nome")}</g:link></td>
			
				<td>${fieldValue(bean: pesquisaInstance, field: "descricao")}</td>
			
				<td><g:formatDate date="${pesquisaInstance.dataDeInicio}" /></td>
			
				<td><g:formatDate date="${pesquisaInstance.dataDeTermino}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${pesquisaInstanceCount}" />
	</div>
</section>

</body>

</html>
