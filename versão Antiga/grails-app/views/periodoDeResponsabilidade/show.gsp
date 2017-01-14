
<%@ page import="useweb.PeriodoDeResponsabilidade" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'periodoDeResponsabilidade.label', default: 'PeriodoDeResponsabilidade')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-periodoDeResponsabilidade" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="periodoDeResponsabilidade.aluno.label" default="Aluno" /></td>
				
				<td valign="top" class="value"><g:link controller="aluno" action="show" id="${periodoDeResponsabilidadeInstance?.aluno?.id}">${periodoDeResponsabilidadeInstance?.aluno?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="periodoDeResponsabilidade.dataDeInicio.label" default="Data De Inicio" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${periodoDeResponsabilidadeInstance?.dataDeInicio}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="periodoDeResponsabilidade.dataDeTermino.label" default="Data De Termino" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${periodoDeResponsabilidadeInstance?.dataDeTermino}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="periodoDeResponsabilidade.responsavel.label" default="Responsavel" /></td>
				
				<td valign="top" class="value"><g:link controller="responsavel" action="show" id="${periodoDeResponsabilidadeInstance?.responsavel?.id}">${periodoDeResponsabilidadeInstance?.responsavel?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
