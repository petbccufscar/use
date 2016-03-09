<%@ page import="useweb.AlunoExterno" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'alunoExterno.label', default: 'AlunoExterno')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
         <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
          <g:javascript src="jquery.maskedinput.min.js"/> 
        <g:javascript>
            var JQuery = jQuery.noConflict()
            JQuery(document).ready(function(){
                JQuery("#cpf").mask("999.999.999-99");
                JQuery("#cep").mask("99999-999");
            });
        </g:javascript>
</head>

<body>

	<section id="edit-alunoExterno" class="first">

		<g:hasErrors bean="${alunoExternoInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${alunoExternoInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form method="post" class="form-horizontal" role="form" >
			<g:hiddenField name="id" value="${alunoExternoInstance?.id}" />
			<g:hiddenField name="version" value="${alunoExternoInstance?.version}" />
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