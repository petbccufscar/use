
<%@ page import="linhasdecuidado.Procedimento" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'procedimento.label', default: 'Procedimento')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-procedimento" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="procedimento.atendimentoconsulta.label" default="Atendimentoconsulta" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${procedimentoInstance.atendimentoconsulta}" var="a">
						<li><g:link controller="atendimentoConsulta" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="procedimento.codigo.label" default="Codigo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: procedimentoInstance, field: "codigo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="procedimento.lcareasubarea.label" default="Lcareasubarea" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${procedimentoInstance.lcareasubarea}" var="l">
						<li><g:link controller="LCAreaSubArea" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="procedimento.nome.label" default="Nome" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: procedimentoInstance, field: "nome")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
