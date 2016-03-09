
<%@ page import="useweb.Telefone" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'telefone.label', default: 'Telefone')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-telefone" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="telefone.pessoa.label" default="Pessoa" /></th>
			
				<g:sortableColumn property="tipo" title="${message(code: 'telefone.tipo.label', default: 'Tipo')}" />
			
				<g:sortableColumn property="codigoArea" title="${message(code: 'telefone.codigoArea.label', default: 'Codigo Area')}" />
			
				<g:sortableColumn property="telefone" title="${message(code: 'telefone.telefone.label', default: 'Telefone')}" />
			
				<g:sortableColumn property="observacao" title="${message(code: 'telefone.observacao.label', default: 'Observacao')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${telefoneInstanceList}" status="i" var="telefoneInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${telefoneInstance.id}">${fieldValue(bean: telefoneInstance, field: "pessoa")}</g:link></td>
			
				<td>${fieldValue(bean: telefoneInstance, field: "tipo")}</td>
			
				<td>${fieldValue(bean: telefoneInstance, field: "codigoArea")}</td>
			
				<td>${fieldValue(bean: telefoneInstance, field: "telefone")}</td>
			
				<td>${fieldValue(bean: telefoneInstance, field: "observacao")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${telefoneInstanceCount}" />
	</div>
</section>

</body>

</html>
