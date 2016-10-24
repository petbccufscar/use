
<%@ page import="linhasdecuidado.Relacoes" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'relacoes.label', default: 'Relacoes')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-relacoes" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-relacoes" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="relacoes.area.label" default="Area" /></th>
					
						<th><g:message code="relacoes.linhadecuidado.label" default="Linhadecuidado" /></th>
					
						<th><g:message code="relacoes.subarea.label" default="Subarea" /></th>
					
					</tr>
				</thead>
				<tbody>
                                
				<g:each in="${list}" status="i" var="instance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${instance.linhadecuidadoarea.area}</td>
					
						<td>${instance.linhadecuidadoarea.linhadecuidado}</td>
					
						<td>${instance.subarea}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${relacoesInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
