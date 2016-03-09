
<%@ page import="useweb.Telefone" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'telefone.label', default: 'Telefone')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-telefone" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="telefone.pessoa.label" default="Pessoa" /></td>
				
				<td valign="top" class="value"><g:link controller="pessoa" action="show" id="${telefoneInstance?.pessoa?.id}">${telefoneInstance?.pessoa?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="telefone.tipo.label" default="Tipo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: telefoneInstance, field: "tipo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="telefone.codigoArea.label" default="Codigo Area" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: telefoneInstance, field: "codigoArea")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="telefone.telefone.label" default="Telefone" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: telefoneInstance, field: "telefone")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="telefone.observacao.label" default="Observacao" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: telefoneInstance, field: "observacao")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
