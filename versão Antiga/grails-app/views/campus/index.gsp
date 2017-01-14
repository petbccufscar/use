
<%@ page import="useweb.Campus" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'campus.label', default: 'Campus')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-campus" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nome" title="${message(code: 'campus.nome.label', default: 'Nome')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${campusInstanceList}" status="i" var="campusInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${campusInstance.id}">${fieldValue(bean: campusInstance, field: "nome")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${campusInstanceCount}" />
	</div>
</section>

</body>

</html>
