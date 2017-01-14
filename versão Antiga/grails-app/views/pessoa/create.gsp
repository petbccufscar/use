<%@ page import="useweb.Pessoa" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'pessoa.label', default: 'Pessoa')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
        
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
 
                             
        
        
</head>

<body>

	<section id="create-pessoa" class="first">

		<g:hasErrors bean="${pessoaInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${pessoaInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form action="save" class="form-horizontal" role="form" >
			<g:render template="form"/>

			<div class="form-actions margin-top-medium">
				<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
	            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
			</div>
		</g:form>

	</section>

</body>

</html>
