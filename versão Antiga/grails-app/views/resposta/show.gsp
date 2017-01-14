
<%@ page import="useweb.Resposta" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'resposta.label', default: 'Resposta')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-resposta" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="resposta.entrevistainicial.label" default="Entrevistainicial" /></td>
				
				<td valign="top" class="value"><g:link controller="entrevistaInicial" action="show" id="${respostaInstance?.entrevistainicial?.id}">${respostaInstance?.entrevistainicial?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="resposta.questao.label" default="Questao" /></td>
				
				<td valign="top" class="value"><g:link controller="questao" action="show" id="${respostaInstance?.questao?.id}">${respostaInstance?.questao?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="resposta.texto.label" default="Texto" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: respostaInstance, field: "texto")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
