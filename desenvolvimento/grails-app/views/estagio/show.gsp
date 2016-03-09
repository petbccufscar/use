
<%@ page import="useweb.Estagio" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'estagio.label', default: 'Estagio')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-estagio" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="estagio.aluno.label" default="Aluno" /></td>
				
				<td valign="top" class="value"><g:link controller="aluno" action="show" id="${estagioInstance?.aluno?.id}">${estagioInstance?.aluno?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="estagio.dataDeInicio.label" default="Data De Inicio" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${estagioInstance?.dataDeInicio}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="estagio.dataDeTermino.label" default="Data De Termino" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${estagioInstance?.dataDeTermino}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
