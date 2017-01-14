
<%@ page import="useweb.TipoDeCurso" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'tipoDeCurso.label', default: 'TipoDeCurso')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-tipoDeCurso" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nome" title="${message(code: 'tipoDeCurso.nome.label', default: 'Nome')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${tipoDeCursoInstanceList}" status="i" var="tipoDeCursoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${tipoDeCursoInstance.id}">${fieldValue(bean: tipoDeCursoInstance, field: "nome")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${tipoDeCursoInstanceCount}" />
	</div>
</section>

</body>

</html>
