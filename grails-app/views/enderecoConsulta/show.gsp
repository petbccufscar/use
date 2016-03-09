
<%@ page import="useweb.EnderecoConsulta" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'enderecoConsulta.label', default: 'EnderecoConsulta')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-enderecoConsulta" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="enderecoConsulta.cep.label" default="Cep" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: enderecoConsultaInstance, field: "cep")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="enderecoConsulta.tipoLogradouro.label" default="Tipo Logradouro" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: enderecoConsultaInstance, field: "tipoLogradouro")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="enderecoConsulta.logradouro.label" default="Logradouro" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: enderecoConsultaInstance, field: "logradouro")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="enderecoConsulta.bairro.label" default="Bairro" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: enderecoConsultaInstance, field: "bairro")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="enderecoConsulta.estado.label" default="Estado" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: enderecoConsultaInstance, field: "estado")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="enderecoConsulta.cidade.label" default="Cidade" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: enderecoConsultaInstance, field: "cidade")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
