
<%@ page import="useweb.Curso" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'curso.label', default: 'Curso')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-curso" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="curso.aluno.label" default="Aluno" /></th>
			
				<g:sortableColumn property="nome" title="${message(code: 'curso.nome.label', default: 'Nome')}" />
			
				<th><g:message code="curso.tipodecurso.label" default="Tipodecurso" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${cursoInstanceList}" status="i" var="cursoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${cursoInstance.id}">${fieldValue(bean: cursoInstance, field: "aluno")}</g:link></td>
			
				<td>${fieldValue(bean: cursoInstance, field: "nome")}</td>
			
				<td>${fieldValue(bean: cursoInstance, field: "tipodecurso")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${cursoInstanceCount}" />
	</div>
</section>

</body>

</html>
