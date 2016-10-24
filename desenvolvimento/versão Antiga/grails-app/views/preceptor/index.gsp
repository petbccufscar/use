
<%@ page import="useweb.Preceptor" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'preceptor.label', default: 'Preceptor')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-preceptor" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nome" title="${message(code: 'preceptor.nome.label', default: 'Nome')}" />
			
				<g:sortableColumn property="dataNascimento" title="${message(code: 'preceptor.dataNascimento.label', default: 'Data Nascimento')}" />
			
				<g:sortableColumn property="sexo" title="${message(code: 'preceptor.sexo.label', default: 'Sexo')}" />
			
				<g:sortableColumn property="cpf" title="${message(code: 'preceptor.cpf.label', default: 'Cpf')}" />
			
				<g:sortableColumn property="voluntario" title="${message(code: 'preceptor.voluntario.label', default: 'Voluntario')}" />
			
				<g:sortableColumn property="cbo" title="${message(code: 'preceptor.cbo.label', default: 'Cbo')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${preceptorInstanceList}" status="i" var="preceptorInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${preceptorInstance.id}">${fieldValue(bean: preceptorInstance, field: "nome")}</g:link></td>
			
				<td><g:formatDate date="${preceptorInstance.dataNascimento}" /></td>
			
				<td>${fieldValue(bean: preceptorInstance, field: "sexo")}</td>
			
				<td>${fieldValue(bean: preceptorInstance, field: "cpf")}</td>
			
				<td><g:formatBoolean boolean="${preceptorInstance.voluntario}" /></td>
			
				<td>${fieldValue(bean: preceptorInstance, field: "cbo")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${preceptorInstanceCount}" />
	</div>
</section>

</body>

</html>
