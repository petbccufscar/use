
<%@ page import="useweb.TratamentoVigente" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'tratamentoVigente.label', default: 'TratamentoVigente')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-tratamentoVigente" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tratamentoVigente.entrevistainicial.label" default="Entrevistainicial" /></td>
				
				<td valign="top" class="value"><g:link controller="entrevistaInicial" action="show" id="${tratamentoVigenteInstance?.entrevistainicial?.id}">${tratamentoVigenteInstance?.entrevistainicial?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tratamentoVigente.local.label" default="Local" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: tratamentoVigenteInstance, field: "local")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tratamentoVigente.nome.label" default="Nome" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: tratamentoVigenteInstance, field: "nome")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
