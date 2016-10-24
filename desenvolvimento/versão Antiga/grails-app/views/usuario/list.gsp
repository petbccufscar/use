
<%@ page import="useweb.Usuario" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-usuario" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nome" title="${message(code: 'usuario.nome.label', default: 'Nome')}" />
			
				<g:sortableColumn property="dataNascimento" title="${message(code: 'usuario.dataNascimento.label', default: 'Data Nascimento')}" />
			
				<g:sortableColumn property="sexo" title="${message(code: 'usuario.sexo.label', default: 'Sexo')}" />
			
				<g:sortableColumn property="cpf" title="${message(code: 'usuario.cpf.label', default: 'Cpf')}" />
			
				<g:sortableColumn property="cns" title="${message(code: 'usuario.cns.label', default: 'Cns')}" />
			
				<g:sortableColumn property="nomeMae" title="${message(code: 'usuario.nomeMae.label', default: 'Nome Mae')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "nome")}</g:link></td>
			
				<td><g:formatDate date="${usuarioInstance.dataNascimento}" /></td>
			
				<td>${fieldValue(bean: usuarioInstance, field: "sexo")}</td>
			
				<td>${fieldValue(bean: usuarioInstance, field: "cpf")}</td>
			
				<td>${fieldValue(bean: usuarioInstance, field: "cns")}</td>
			
				<td>${fieldValue(bean: usuarioInstance, field: "nomeMae")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${usuarioInstanceCount}" />
	</div>
</section>

</body>

</html>
