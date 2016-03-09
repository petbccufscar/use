
<%@ page import="useweb.Email" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'email.label', default: 'Email')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-email" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="email.pessoa.label" default="Pessoa" /></td>
				
				<td valign="top" class="value"><g:link controller="pessoa" action="show" id="${emailInstance?.pessoa?.id}">${emailInstance?.pessoa?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="email.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: emailInstance, field: "email")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
