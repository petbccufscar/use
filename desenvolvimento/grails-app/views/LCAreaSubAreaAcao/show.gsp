
<%@ page import="linhasdecuidado.LCAreaSubAreaAcao" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'LCAreaSubAreaAcao.label', default: 'LCAreaSubAreaAcao')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-LCAreaSubAreaAcao" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="LCAreaSubAreaAcao.acao.label" default="Acao" /></td>
				
				<td valign="top" class="value"><g:link controller="acao" action="show" id="${LCAreaSubAreaAcaoInstance?.acao?.id}">${LCAreaSubAreaAcaoInstance?.acao?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="LCAreaSubAreaAcao.lcareasubarea.label" default="Lcareasubarea" /></td>
				
				<td valign="top" class="value"><g:link controller="LCAreaSubArea" action="show" id="${LCAreaSubAreaAcaoInstance?.lcareasubarea?.id}">${LCAreaSubAreaAcaoInstance?.lcareasubarea?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="LCAreaSubAreaAcao.registrousuario.label" default="Registrousuario" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${LCAreaSubAreaAcaoInstance.registrousuario}" var="r">
						<li><g:link controller="registroUsuario" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
