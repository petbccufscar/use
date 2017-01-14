
<%@ page import="linhasdecuidado.LCAreaSubArea" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'LCAreaSubArea.label', default: 'LCAreaSubArea')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-LCAreaSubArea" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="LCAreaSubArea.linhadecuidadoarea.label" default="Linhadecuidadoarea" /></td>
				
				<td valign="top" class="value"><g:link controller="linhadeCuidadoArea" action="show" id="${LCAreaSubAreaInstance?.linhadecuidadoarea?.id}">${LCAreaSubAreaInstance?.linhadecuidadoarea?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="LCAreaSubArea.subarea.label" default="Subarea" /></td>
				
				<td valign="top" class="value"><g:link controller="subArea" action="show" id="${LCAreaSubAreaInstance?.subarea?.id}">${LCAreaSubAreaInstance?.subarea?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
