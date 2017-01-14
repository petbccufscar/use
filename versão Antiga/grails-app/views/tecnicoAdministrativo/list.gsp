
<%@ page import="useweb.TecnicoAdministrativo" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'tecnicoAdministrativo.label', default: 'TecnicoAdministrativo')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-tecnicoAdministrativo" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nome" title="${message(code: 'tecnicoAdministrativo.nome.label', default: 'Nome')}" />
			
				<g:sortableColumn property="dataNascimento" title="${message(code: 'tecnicoAdministrativo.dataNascimento.label', default: 'Data Nascimento')}" />
			
				<g:sortableColumn property="sexo" title="${message(code: 'tecnicoAdministrativo.sexo.label', default: 'Sexo')}" />
			
				<g:sortableColumn property="cpf" title="${message(code: 'tecnicoAdministrativo.cpf.label', default: 'Cpf')}" />
			
				<g:sortableColumn property="voluntario" title="${message(code: 'tecnicoAdministrativo.voluntario.label', default: 'Voluntario')}" />
			
				<g:sortableColumn property="cargo" title="${message(code: 'tecnicoAdministrativo.cargo.label', default: 'Cargo')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${tecnicoAdministrativoInstanceList}" status="i" var="tecnicoAdministrativoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${tecnicoAdministrativoInstance.id}">${fieldValue(bean: tecnicoAdministrativoInstance, field: "nome")}</g:link></td>
			
				<td><g:formatDate date="${tecnicoAdministrativoInstance.dataNascimento}" /></td>
			
				<td>${fieldValue(bean: tecnicoAdministrativoInstance, field: "sexo")}</td>
			
				<td>${fieldValue(bean: tecnicoAdministrativoInstance, field: "cpf")}</td>
			
				<td><g:formatBoolean boolean="${tecnicoAdministrativoInstance.voluntario}" /></td>
			
				<td>${fieldValue(bean: tecnicoAdministrativoInstance, field: "cargo")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${tecnicoAdministrativoInstanceCount}" />
	</div>
</section>

</body>

</html>
