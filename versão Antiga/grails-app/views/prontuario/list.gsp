
<%@ page import="useweb.Prontuario" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'prontuario.label', default: 'Prontuario')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-prontuario" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${prontuarioInstanceList}" status="i" var="prontuarioInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${prontuarioInstanceCount}" />
	</div>
</section>

</body>

</html>
