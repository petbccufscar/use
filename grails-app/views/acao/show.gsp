
<%@ page import="linhasdecuidado.Acao" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'acao.label', default: 'Acao')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-acao" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="acao.nome.label" default="Nome" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: acaoInstance, field: "nome")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="acao.descricao.label" default="Descricao" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: acaoInstance, field: "descricao")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
