
<%@ page import="useweb.Cuidador" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'cuidador.label', default: 'Cuidador')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-cuidador" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nome" title="${message(code: 'cuidador.nome.label', default: 'Nome')}" />
			
				<g:sortableColumn property="dataNascimento" title="${message(code: 'cuidador.dataNascimento.label', default: 'Data Nascimento')}" />
			
				<g:sortableColumn property="sexo" title="${message(code: 'cuidador.sexo.label', default: 'Sexo')}" />
			
				<g:sortableColumn property="cpf" title="${message(code: 'cuidador.cpf.label', default: 'Cpf')}" />
			
				<g:sortableColumn property="vinculo" title="${message(code: 'cuidador.vinculo.label', default: 'Vinculo')}" />
			
				<g:sortableColumn property="orgaoEmissor" title="${message(code: 'cuidador.orgaoEmissor.label', default: 'Orgao Emissor')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${cuidadorInstanceList}" status="i" var="cuidadorInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${cuidadorInstance.id}">${fieldValue(bean: cuidadorInstance, field: "nome")}</g:link></td>
			
				<td><g:formatDate date="${cuidadorInstance.dataNascimento}" /></td>
			
				<td>${fieldValue(bean: cuidadorInstance, field: "sexo")}</td>
			
				<td>${fieldValue(bean: cuidadorInstance, field: "cpf")}</td>
			
				<td>${fieldValue(bean: cuidadorInstance, field: "vinculo")}</td>
			
				<td>${fieldValue(bean: cuidadorInstance, field: "orgaoEmissor")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${cuidadorInstanceCount}" />
	</div>
</section>

</body>

</html>
