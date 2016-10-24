<%@ page import="linhasdecuidado.LinhaDeCuidado" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'linhaDeCuidado.label', default: 'LinhaDeCuidado')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

	<section id="edit-linhaDeCuidado" class="first">

		<g:hasErrors bean="${linhaDeCuidadoInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${linhaDeCuidadoInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form method="post" class="form-horizontal" role="form" >
			<g:hiddenField name="id" value="${linhaDeCuidadoInstance?.id}" />
			<g:hiddenField name="version" value="${linhaDeCuidadoInstance?.version}" />
			<g:hiddenField name="_method" value="PUT" />
			
			<g:render template="form"/>
			
			<div class="form-actions margin-top-medium">
				<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
	            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
			</div>
		</g:form>

	</section>

</body>

</html>
