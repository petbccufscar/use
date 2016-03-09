
<%@ page import="linhasdecuidado.LinhadeCuidadoArea" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'linhadeCuidadoArea.label', default: 'LinhadeCuidadoArea')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-linhadeCuidadoArea" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="linhadeCuidadoArea.area.label" default="Area" /></td>
				
				<td valign="top" class="value"><g:link controller="area" action="show" id="${linhadeCuidadoAreaInstance?.area?.id}">${linhadeCuidadoAreaInstance?.area?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="linhadeCuidadoArea.lcareasubarea.label" default="Lcareasubarea" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${linhadeCuidadoAreaInstance.lcareasubarea}" var="l">
						<li><g:link controller="LCAreaSubArea" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="linhadeCuidadoArea.linhadecuidado.label" default="Linhadecuidado" /></td>
				
				<td valign="top" class="value"><g:link controller="linhaDeCuidado" action="show" id="${linhadeCuidadoAreaInstance?.linhadecuidado?.id}">${linhadeCuidadoAreaInstance?.linhadecuidado?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
