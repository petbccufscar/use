
<%@ page import="useweb.Estagio" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'estagio.label', default: 'Estagio')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-estagio" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="estagio.aluno.label" default="Aluno" /></th>
			
				<g:sortableColumn property="dataDeInicio" title="${message(code: 'estagio.dataDeInicio.label', default: 'Data De Inicio')}" />
			
				<g:sortableColumn property="dataDeTermino" title="${message(code: 'estagio.dataDeTermino.label', default: 'Data De Termino')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${estagioInstanceList}" status="i" var="estagioInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${estagioInstance.id}">${fieldValue(bean: estagioInstance, field: "aluno")}</g:link></td>
			
				<td><g:formatDate date="${estagioInstance.dataDeInicio}" /></td>
			
				<td><g:formatDate date="${estagioInstance.dataDeTermino}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${estagioInstanceCount}" />
	</div>
</section>

</body>

</html>
