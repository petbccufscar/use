
<%@ page import="linhasdecuidado.LinhaDeCuidado" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'linhaDeCuidado.label', default: 'LinhaDeCuidado')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-linhaDeCuidado" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="linhaDeCuidado.linhadecuidadoarea.label" default="Linhadecuidadoarea" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${linhaDeCuidadoInstance.linhadecuidadoarea}" var="l">
						<li><g:link controller="linhadeCuidadoArea" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="linhaDeCuidado.nome.label" default="Nome" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: linhaDeCuidadoInstance, field: "nome")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="linhaDeCuidado.relacoes.label" default="Relacoes" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${linhaDeCuidadoInstance.relacoes}" var="r">
						<li><g:link controller="relacoes" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
