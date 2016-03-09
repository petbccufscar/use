
<%@ page import="useweb.EnderecoConsulta" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'enderecoConsulta.label', default: 'EnderecoConsulta')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-enderecoConsulta" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="cep" title="${message(code: 'enderecoConsulta.cep.label', default: 'Cep')}" />
			
				<g:sortableColumn property="tipoLogradouro" title="${message(code: 'enderecoConsulta.tipoLogradouro.label', default: 'Tipo Logradouro')}" />
			
				<g:sortableColumn property="logradouro" title="${message(code: 'enderecoConsulta.logradouro.label', default: 'Logradouro')}" />
			
				<g:sortableColumn property="bairro" title="${message(code: 'enderecoConsulta.bairro.label', default: 'Bairro')}" />
			
				<g:sortableColumn property="estado" title="${message(code: 'enderecoConsulta.estado.label', default: 'Estado')}" />
			
				<g:sortableColumn property="cidade" title="${message(code: 'enderecoConsulta.cidade.label', default: 'Cidade')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${enderecoConsultaInstanceList}" status="i" var="enderecoConsultaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${enderecoConsultaInstance.id}">${fieldValue(bean: enderecoConsultaInstance, field: "cep")}</g:link></td>
			
				<td>${fieldValue(bean: enderecoConsultaInstance, field: "tipoLogradouro")}</td>
			
				<td>${fieldValue(bean: enderecoConsultaInstance, field: "logradouro")}</td>
			
				<td>${fieldValue(bean: enderecoConsultaInstance, field: "bairro")}</td>
			
				<td>${fieldValue(bean: enderecoConsultaInstance, field: "estado")}</td>
			
				<td>${fieldValue(bean: enderecoConsultaInstance, field: "cidade")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${enderecoConsultaInstanceCount}" />
	</div>
</section>

</body>

</html>
