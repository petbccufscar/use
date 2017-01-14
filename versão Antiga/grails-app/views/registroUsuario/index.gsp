
<%@ page import="useweb.RegistroUsuario" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'registroUsuario.label', default: 'RegistroUsuario')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-registroUsuario" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="registroUsuario.colaborador.label" default="Colaborador" /></th>
			
				<g:sortableColumn property="dataDeInicio" title="${message(code: 'registroUsuario.dataDeInicio.label', default: 'Data De Inicio')}" />
			
				<g:sortableColumn property="dataDeTermino" title="${message(code: 'registroUsuario.dataDeTermino.label', default: 'Data De Termino')}" />
			
				<th><g:message code="registroUsuario.lcareasubareaacao.label" default="Lcareasubareaacao" /></th>
			
				<th><g:message code="registroUsuario.usuario.label" default="Usuario" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${registroUsuarioInstanceList}" status="i" var="registroUsuarioInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${registroUsuarioInstance.id}">${fieldValue(bean: registroUsuarioInstance, field: "colaborador")}</g:link></td>
			
				<td><g:formatDate date="${registroUsuarioInstance.dataDeInicio}" /></td>
			
				<td><g:formatDate date="${registroUsuarioInstance.dataDeTermino}" /></td>
			
				<td>${fieldValue(bean: registroUsuarioInstance, field: "lcareasubareaacao")}</td>
			
				<td>${fieldValue(bean: registroUsuarioInstance, field: "usuario")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${registroUsuarioInstanceCount}" />
	</div>
</section>

</body>

</html>
