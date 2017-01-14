
<%@ page import="useweb.VinculoUSE" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'vinculoUSE.label', default: 'VinculoUSE')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-vinculoUSE" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vinculoUSE.colaborador.label" default="Colaborador" /></td>
				
				<td valign="top" class="value"><g:link controller="colaborador" action="show" id="${vinculoUSEInstance?.colaborador?.id}">${vinculoUSEInstance?.colaborador?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vinculoUSE.dataInicio.label" default="Data Inicio" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${vinculoUSEInstance?.dataInicio}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vinculoUSE.dataTermino.label" default="Data Termino" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${vinculoUSEInstance?.dataTermino}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
