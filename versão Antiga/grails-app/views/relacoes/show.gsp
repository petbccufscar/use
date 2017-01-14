
<%@ page import="linhasdecuidado.Relacoes" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'relacoes.label', default: 'Relacoes')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-relacoes" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
                
		<div id="show-relacoes" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list relacoes">
			
				<g:if test="${instance?.linhadecuidadoarea?.area}">
				<li class="fieldcontain">
					<span id="area-label" class="property-label"><g:message code="relacoes.area.label" default="Area" /></span>
					
						<span class="property-value" aria-labelledby="area-label"><g:link controller="area" action="show" id="${instance?.linhadecuidadoarea?.area?.id}">${instance?.linhadecuidadoarea?.area?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${instance?.linhadecuidadoarea}">
				<li class="fieldcontain">
					<span id="linhadecuidado-label" class="property-label"><g:message code="relacoes.linhadecuidado.label" default="Linhadecuidado" /></span>
					
						<span class="property-value" aria-labelledby="linhadecuidado-label"><g:link controller="linhaDeCuidado" action="show" id="${instance?.linhadecuidadoarea?.linhadecuidado?.id}">${instance?.linhadecuidadoarea?.linhadecuidado?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${instance?.subarea}">
				<li class="fieldcontain">
					<span id="subarea-label" class="property-label"><g:message code="relacoes.subarea.label" default="Subarea" /></span>
					
						<span class="property-value" aria-labelledby="subarea-label"><g:link controller="subArea" action="show" id="${instance?.subarea?.id}">${instance?.subarea?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:relacoesInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${instance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
