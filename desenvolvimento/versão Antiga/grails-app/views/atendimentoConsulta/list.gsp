
<%@ page import="useweb.AtendimentoConsulta" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'atendimentoConsulta.label', default: 'AtendimentoConsulta')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-atendimentoConsulta" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="conduta" title="${message(code: 'atendimentoConsulta.conduta.label', default: 'Conduta')}" />
			
				<g:sortableColumn property="dataConsulta" title="${message(code: 'atendimentoConsulta.dataConsulta.label', default: 'Data Consulta')}" />
			
				<g:sortableColumn property="horaInicio" title="${message(code: 'atendimentoConsulta.horaInicio.label', default: 'Hora Inicio')}" />
			
				<g:sortableColumn property="horaTermino" title="${message(code: 'atendimentoConsulta.horaTermino.label', default: 'Hora Termino')}" />
			
				<th><g:message code="atendimentoConsulta.lcareasubareaacao.label" default="Lcareasubareaacao" /></th>
			
				<th><g:message code="atendimentoConsulta.procedimento.label" default="Procedimento" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${atendimentoConsultaInstanceList}" status="i" var="atendimentoConsultaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${atendimentoConsultaInstance.id}">${fieldValue(bean: atendimentoConsultaInstance, field: "conduta")}</g:link></td>
			
				<td><g:formatDate date="${atendimentoConsultaInstance.dataConsulta}" /></td>
			
				<td>${fieldValue(bean: atendimentoConsultaInstance, field: "horaInicio")}</td>
			
				<td>${fieldValue(bean: atendimentoConsultaInstance, field: "horaTermino")}</td>
			
				<td>${fieldValue(bean: atendimentoConsultaInstance, field: "lcareasubareaacao")}</td>
			
				<td>${fieldValue(bean: atendimentoConsultaInstance, field: "procedimento")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${atendimentoConsultaInstanceCount}" />
	</div>
</section>

</body>

</html>
