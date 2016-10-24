
<%@ page import="useweb.VinculoDocenteExterno" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'vinculoDocenteExterno.label', default: 'VinculoDocenteExterno')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-vinculoDocenteExterno" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vinculoDocenteExterno.dataFim.label" default="Data Fim" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${vinculoDocenteExternoInstance?.dataFim}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vinculoDocenteExterno.dataInicio.label" default="Data Inicio" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${vinculoDocenteExternoInstance?.dataInicio}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vinculoDocenteExterno.docenteexterno.label" default="Docenteexterno" /></td>
				
				<td valign="top" class="value"><g:link controller="docenteExterno" action="show" id="${vinculoDocenteExternoInstance?.docenteexterno?.id}">${vinculoDocenteExternoInstance?.docenteexterno?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vinculoDocenteExterno.origem.label" default="Origem" /></td>
				
				<td valign="top" class="value"><g:link controller="origem" action="show" id="${vinculoDocenteExternoInstance?.origem?.id}">${vinculoDocenteExternoInstance?.origem?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
