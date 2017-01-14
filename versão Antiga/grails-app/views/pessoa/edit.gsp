<%@ page import="useweb.Pessoa" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'pessoa.label', default: 'Pessoa')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
        
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
        
</head>

<body>

	<section id="edit-pessoa" class="first">

		<g:hasErrors bean="${pessoaInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${pessoaInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form method="post" class="form-horizontal" role="form" >
			<g:hiddenField name="id" value="${pessoaInstance?.id}" />
			<g:hiddenField name="version" value="${pessoaInstance?.version}" />
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
