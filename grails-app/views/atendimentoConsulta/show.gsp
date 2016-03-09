
<%@ page import="useweb.AtendimentoConsulta" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'atendimentoConsulta.label', default: 'AtendimentoConsulta')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-atendimentoConsulta" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="atendimentoConsulta.conduta.label" default="Conduta" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: atendimentoConsultaInstance, field: "conduta")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="atendimentoConsulta.dataConsulta.label" default="Data Consulta" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${atendimentoConsultaInstance?.dataConsulta}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="atendimentoConsulta.horaInicio.label" default="Hora Inicio" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: atendimentoConsultaInstance, field: "horaInicio")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="atendimentoConsulta.horaTermino.label" default="Hora Termino" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: atendimentoConsultaInstance, field: "horaTermino")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="atendimentoConsulta.lcareasubareaacao.label" default="Lcareasubareaacao" /></td>
				
				<td valign="top" class="value"><g:link controller="LCAreaSubAreaAcao" action="show" id="${atendimentoConsultaInstance?.lcareasubareaacao?.id}">${atendimentoConsultaInstance?.lcareasubareaacao?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="atendimentoConsulta.procedimento.label" default="Procedimento" /></td>
				
				<td valign="top" class="value"><g:link controller="procedimento" action="show" id="${atendimentoConsultaInstance?.procedimento?.id}">${atendimentoConsultaInstance?.procedimento?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="atendimentoConsulta.responsavel.label" default="Responsavel" /></td>
				
				<td valign="top" class="value"><g:link controller="responsavel" action="show" id="${atendimentoConsultaInstance?.responsavel?.id}">${atendimentoConsultaInstance?.responsavel?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="atendimentoConsulta.usuario.label" default="Usuario" /></td>
				
				<td valign="top" class="value"><g:link controller="usuario" action="show" id="${atendimentoConsultaInstance?.usuario?.id}">${atendimentoConsultaInstance?.usuario?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
