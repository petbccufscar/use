
<%@ page import="useweb.EntrevistaInicial" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'entrevistaInicial.label', default: 'EntrevistaInicial')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-entrevistaInicial" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="entrevistaInicial.colaborador.label" default="Colaborador" /></td>
				
				<td valign="top" class="value"><g:link controller="colaborador" action="show" id="${entrevistaInicialInstance?.colaborador?.id}">${entrevistaInicialInstance?.colaborador?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="entrevistaInicial.data.label" default="Data" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${entrevistaInicialInstance?.data}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="entrevistaInicial.questao.label" default="Questao" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${entrevistaInicialInstance.questao}" var="q">
						<li><g:link controller="questao" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="entrevistaInicial.resposta.label" default="Resposta" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${entrevistaInicialInstance.resposta}" var="r">
						<li><g:link controller="resposta" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="entrevistaInicial.tratamentovigente.label" default="Tratamentovigente" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${entrevistaInicialInstance.tratamentovigente}" var="t">
						<li><g:link controller="tratamentoVigente" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="entrevistaInicial.usuario.label" default="Usuario" /></td>
				
				<td valign="top" class="value"><g:link controller="usuario" action="show" id="${entrevistaInicialInstance?.usuario?.id}">${entrevistaInicialInstance?.usuario?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
