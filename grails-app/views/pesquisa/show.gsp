
<%@ page import="linhasdecuidado.Pesquisa" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'pesquisa.label', default: 'Pesquisa')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-pesquisa" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pesquisa.nome.label" default="Nome" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: pesquisaInstance, field: "nome")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pesquisa.descricao.label" default="Descricao" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: pesquisaInstance, field: "descricao")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pesquisa.dataDeInicio.label" default="Data De Inicio" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${pesquisaInstance?.dataDeInicio}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pesquisa.dataDeTermino.label" default="Data De Termino" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${pesquisaInstance?.dataDeTermino}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
