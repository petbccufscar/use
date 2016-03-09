
<%@ page import="useweb.Questao" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'questao.label', default: 'Questao')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-questao" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="questao.resposta.label" default="Resposta" /></th>
			
				<th><g:message code="questao.entrevistainicial.label" default="Entrevistainicial" /></th>
			
				<g:sortableColumn property="texto" title="${message(code: 'questao.texto.label', default: 'Texto')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${questaoInstanceList}" status="i" var="questaoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${questaoInstance.id}">${fieldValue(bean: questaoInstance, field: "resposta")}</g:link></td>
			
				<td>${fieldValue(bean: questaoInstance, field: "entrevistainicial")}</td>
			
				<td>${fieldValue(bean: questaoInstance, field: "texto")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${questaoInstanceCount}" />
	</div>
</section>

</body>

</html>
