
<%@ page import="useweb.Questao" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'questao.label', default: 'Questao')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-questao" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="questao.resposta.label" default="Resposta" /></td>
				
				<td valign="top" class="value"><g:link controller="resposta" action="show" id="${questaoInstance?.resposta?.id}">${questaoInstance?.resposta?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="questao.entrevistainicial.label" default="Entrevistainicial" /></td>
				
				<td valign="top" class="value"><g:link controller="entrevistaInicial" action="show" id="${questaoInstance?.entrevistainicial?.id}">${questaoInstance?.entrevistainicial?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="questao.texto.label" default="Texto" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: questaoInstance, field: "texto")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
