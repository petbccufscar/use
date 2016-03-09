
<%@ page import="useweb.Curso" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'curso.label', default: 'Curso')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-curso" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="curso.aluno.label" default="Aluno" /></td>
				
				<td valign="top" class="value"><g:link controller="aluno" action="show" id="${cursoInstance?.aluno?.id}">${cursoInstance?.aluno?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="curso.nome.label" default="Nome" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: cursoInstance, field: "nome")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="curso.tipodecurso.label" default="Tipodecurso" /></td>
				
				<td valign="top" class="value"><g:link controller="tipoDeCurso" action="show" id="${cursoInstance?.tipodecurso?.id}">${cursoInstance?.tipodecurso?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
