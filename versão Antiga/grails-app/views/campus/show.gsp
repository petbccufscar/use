
<%@ page import="useweb.Campus" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'campus.label', default: 'Campus')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-campus" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="campus.nome.label" default="Nome" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: campusInstance, field: "nome")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
