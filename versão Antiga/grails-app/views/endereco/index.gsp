
<%@ page import="useweb.Endereco" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'endereco.label', default: 'Endereco')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-endereco" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="endereco.pessoa.label" default="Pessoa" /></th>
			
				<g:sortableColumn property="cep" title="${message(code: 'endereco.cep.label', default: 'Cep')}" />
			
				<g:sortableColumn property="tipoLogradouro" title="${message(code: 'endereco.tipoLogradouro.label', default: 'Tipo Logradouro')}" />
			
				<g:sortableColumn property="logradouro" title="${message(code: 'endereco.logradouro.label', default: 'Logradouro')}" />
			
				<g:sortableColumn property="numero" title="${message(code: 'endereco.numero.label', default: 'Numero')}" />
			
				<g:sortableColumn property="bairro" title="${message(code: 'endereco.bairro.label', default: 'Bairro')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${enderecoInstanceList}" status="i" var="enderecoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${enderecoInstance.id}">${fieldValue(bean: enderecoInstance, field: "pessoa")}</g:link></td>
			
				<td>${fieldValue(bean: enderecoInstance, field: "cep")}</td>
			
				<td>${fieldValue(bean: enderecoInstance, field: "tipoLogradouro")}</td>
			
				<td>${fieldValue(bean: enderecoInstance, field: "logradouro")}</td>
			
				<td>${fieldValue(bean: enderecoInstance, field: "numero")}</td>
			
				<td>${fieldValue(bean: enderecoInstance, field: "bairro")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${enderecoInstanceCount}" />
	</div>
</section>

</body>

</html>
