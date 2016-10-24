
<%@ page import="useweb.RegistroUsuario" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'registroUsuario.label', default: 'RegistroUsuario')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-registroUsuario" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="registroUsuario.colaborador.label" default="Colaborador" /></td>
				
				<td valign="top" class="value"><g:link controller="colaborador" action="show" id="${registroUsuarioInstance?.colaborador?.id}">${registroUsuarioInstance?.colaborador?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="registroUsuario.dataDeInicio.label" default="Data De Inicio" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${registroUsuarioInstance?.dataDeInicio}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="registroUsuario.dataDeTermino.label" default="Data De Termino" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${registroUsuarioInstance?.dataDeTermino}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="registroUsuario.lcareasubareaacao.label" default="Lcareasubareaacao" /></td>
				
				<td valign="top" class="value"><g:link controller="LCAreaSubAreaAcao" action="show" id="${registroUsuarioInstance?.lcareasubareaacao?.id}">${registroUsuarioInstance?.lcareasubareaacao?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="registroUsuario.usuario.label" default="Usuario" /></td>
				
				<td valign="top" class="value"><g:link controller="usuario" action="show" id="${registroUsuarioInstance?.usuario?.id}">${registroUsuarioInstance?.usuario?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
