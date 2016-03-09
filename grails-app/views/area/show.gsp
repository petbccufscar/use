
<%@ page import="linhasdecuidado.Area" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'area.label', default: 'Area')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-area" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="area.nome.label" default="Nome" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: areaInstance, field: "nome")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="area.linhadecuidadoarea.label" default="Linhadecuidadoarea" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${areaInstance.linhadecuidadoarea}" var="l">
						<li><g:link controller="linhadeCuidadoArea" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="area.relacoes.label" default="Relacoes" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${areaInstance.relacoes}" var="r">
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
