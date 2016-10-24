
<%@ page import="useweb.Prontuario" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'prontuario.label', default: 'Prontuario')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-prontuario" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="prontuario.atendimentoconsulta.label" default="Atendimentoconsulta" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${prontuarioInstance.atendimentoconsulta}" var="a">
						<li><g:link controller="atendimentoConsulta" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
