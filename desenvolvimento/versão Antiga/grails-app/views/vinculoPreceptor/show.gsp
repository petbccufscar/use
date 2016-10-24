
<%@ page import="useweb.VinculoPreceptor" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'vinculoPreceptor.label', default: 'VinculoPreceptor')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-vinculoPreceptor" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vinculoPreceptor.dataFim.label" default="Data Fim" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${vinculoPreceptorInstance?.dataFim}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vinculoPreceptor.dataInicio.label" default="Data Inicio" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${vinculoPreceptorInstance?.dataInicio}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vinculoPreceptor.departamento.label" default="Departamento" /></td>
				
				<td valign="top" class="value"><g:link controller="departamento" action="show" id="${vinculoPreceptorInstance?.departamento?.id}">${vinculoPreceptorInstance?.departamento?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vinculoPreceptor.preceptor.label" default="Preceptor" /></td>
				
				<td valign="top" class="value"><g:link controller="preceptor" action="show" id="${vinculoPreceptorInstance?.preceptor?.id}">${vinculoPreceptorInstance?.preceptor?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
