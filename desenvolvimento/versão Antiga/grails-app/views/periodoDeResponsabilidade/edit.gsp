<%@ page import="useweb.PeriodoDeResponsabilidade" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'periodoDeResponsabilidade.label', default: 'PeriodoDeResponsabilidade')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

	<section id="edit-periodoDeResponsabilidade" class="first">

		<g:hasErrors bean="${periodoDeResponsabilidadeInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${periodoDeResponsabilidadeInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form method="post" class="form-horizontal" role="form" >
			<g:hiddenField name="id" value="${periodoDeResponsabilidadeInstance?.id}" />
			<g:hiddenField name="version" value="${periodoDeResponsabilidadeInstance?.version}" />
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
