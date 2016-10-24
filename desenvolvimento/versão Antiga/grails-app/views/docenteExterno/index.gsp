
<%@ page import="useweb.DocenteExterno" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'docenteExterno.label', default: 'DocenteExterno')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-docenteExterno" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nome" title="${message(code: 'docenteExterno.nome.label', default: 'Nome')}" />
			
				<g:sortableColumn property="dataNascimento" title="${message(code: 'docenteExterno.dataNascimento.label', default: 'Data Nascimento')}" />
			
				<g:sortableColumn property="sexo" title="${message(code: 'docenteExterno.sexo.label', default: 'Sexo')}" />
			
				<g:sortableColumn property="cpf" title="${message(code: 'docenteExterno.cpf.label', default: 'Cpf')}" />
			
				<g:sortableColumn property="voluntario" title="${message(code: 'docenteExterno.voluntario.label', default: 'Voluntario')}" />
			
				<g:sortableColumn property="cbo" title="${message(code: 'docenteExterno.cbo.label', default: 'Cbo')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${docenteExternoInstanceList}" status="i" var="docenteExternoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${docenteExternoInstance.id}">${fieldValue(bean: docenteExternoInstance, field: "nome")}</g:link></td>
			
				<td><g:formatDate date="${docenteExternoInstance.dataNascimento}" /></td>
			
				<td>${fieldValue(bean: docenteExternoInstance, field: "sexo")}</td>
			
				<td>${fieldValue(bean: docenteExternoInstance, field: "cpf")}</td>
			
				<td><g:formatBoolean boolean="${docenteExternoInstance.voluntario}" /></td>
			
				<td>${fieldValue(bean: docenteExternoInstance, field: "cbo")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${docenteExternoInstanceCount}" />
	</div>
</section>

</body>

</html>
