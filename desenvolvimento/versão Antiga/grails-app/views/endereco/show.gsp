
<%@ page import="useweb.Endereco" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'endereco.label', default: 'Endereco')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-endereco" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="endereco.pessoa.label" default="Pessoa" /></td>
				
				<td valign="top" class="value"><g:link controller="pessoa" action="show" id="${enderecoInstance?.pessoa?.id}">${enderecoInstance?.pessoa?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="endereco.cep.label" default="Cep" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "cep")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="endereco.tipoLogradouro.label" default="Tipo Logradouro" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "tipoLogradouro")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="endereco.logradouro.label" default="Logradouro" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "logradouro")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="endereco.numero.label" default="Numero" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "numero")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="endereco.bairro.label" default="Bairro" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "bairro")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="endereco.estado.label" default="Estado" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "estado")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="endereco.cidade.label" default="Cidade" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "cidade")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="endereco.complemento.label" default="Complemento" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "complemento")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
