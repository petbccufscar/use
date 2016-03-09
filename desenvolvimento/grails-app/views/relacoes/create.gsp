<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'relacoes.label', default: 'Relacoes')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
                
                <g:javascript src="jquery-1.10.2.js"/>
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
		<a href="#create-relacoes" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-relacoes" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${relacoesInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${relacoesInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:relacoesInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
