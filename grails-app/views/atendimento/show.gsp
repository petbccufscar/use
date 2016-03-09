
<%@ page import="linhasdecuidado.Atendimento" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'atendimento.label', default: 'Atendimento')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-atendimento" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="atendimento.nome.label" default="Nome" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: atendimentoInstance, field: "nome")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="atendimento.descricao.label" default="Descricao" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: atendimentoInstance, field: "descricao")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
