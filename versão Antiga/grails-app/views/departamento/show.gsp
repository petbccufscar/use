
<%@ page import="useweb.Departamento" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'departamento.label', default: 'Departamento')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-departamento" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="departamento.campus.label" default="Campus" /></td>
				
				<td valign="top" class="value"><g:link controller="campus" action="show" id="${departamentoInstance?.campus?.id}">${departamentoInstance?.campus?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="departamento.nome.label" default="Nome" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: departamentoInstance, field: "nome")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
