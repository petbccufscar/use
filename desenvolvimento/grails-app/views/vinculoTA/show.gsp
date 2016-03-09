
<%@ page import="useweb.VinculoTA" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'vinculoTA.label', default: 'VinculoTA')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-vinculoTA" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vinculoTA.dataInicio.label" default="Data Inicio" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${vinculoTAInstance?.dataInicio}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vinculoTA.dataTermino.label" default="Data Termino" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${vinculoTAInstance?.dataTermino}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vinculoTA.departamento.label" default="Departamento" /></td>
				
				<td valign="top" class="value"><g:link controller="departamento" action="show" id="${vinculoTAInstance?.departamento?.id}">${vinculoTAInstance?.departamento?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vinculoTA.tecnicos.label" default="Tecnicos" /></td>
				
				<td valign="top" class="value"><g:link controller="tecnicoAdministrativo" action="show" id="${vinculoTAInstance?.tecnicos?.id}">${vinculoTAInstance?.tecnicos?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
