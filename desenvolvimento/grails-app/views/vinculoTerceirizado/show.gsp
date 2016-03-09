
<%@ page import="useweb.VinculoTerceirizado" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'vinculoTerceirizado.label', default: 'VinculoTerceirizado')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-vinculoTerceirizado" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vinculoTerceirizado.dataFim.label" default="Data Fim" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${vinculoTerceirizadoInstance?.dataFim}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vinculoTerceirizado.dataInicio.label" default="Data Inicio" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${vinculoTerceirizadoInstance?.dataInicio}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vinculoTerceirizado.origem.label" default="Origem" /></td>
				
				<td valign="top" class="value"><g:link controller="origem" action="show" id="${vinculoTerceirizadoInstance?.origem?.id}">${vinculoTerceirizadoInstance?.origem?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vinculoTerceirizado.terceirizado.label" default="Terceirizado" /></td>
				
				<td valign="top" class="value"><g:link controller="terceirizado" action="show" id="${vinculoTerceirizadoInstance?.terceirizado?.id}">${vinculoTerceirizadoInstance?.terceirizado?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
