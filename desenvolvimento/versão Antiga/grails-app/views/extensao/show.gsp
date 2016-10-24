
<%@ page import="linhasdecuidado.Extensao" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'extensao.label', default: 'Extensao')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-extensao" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="extensao.nome.label" default="Nome" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: extensaoInstance, field: "nome")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="extensao.descricao.label" default="Descricao" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: extensaoInstance, field: "descricao")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="extensao.dataDeInicio.label" default="Data De Inicio" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${extensaoInstance?.dataDeInicio}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="extensao.dataDeTermino.label" default="Data De Termino" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${extensaoInstance?.dataDeTermino}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
