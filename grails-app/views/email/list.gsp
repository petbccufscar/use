
<%@ page import="useweb.Email" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'email.label', default: 'Email')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-email" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="email.pessoa.label" default="Pessoa" /></th>
			
				<g:sortableColumn property="email" title="${message(code: 'email.email.label', default: 'Email')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${emailInstanceList}" status="i" var="emailInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${emailInstance.id}">${fieldValue(bean: emailInstance, field: "pessoa")}</g:link></td>
			
				<td>${fieldValue(bean: emailInstance, field: "email")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${emailInstanceCount}" />
	</div>
</section>

</body>

</html>
