
<%@ page import="useweb.Resposta" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'resposta.label', default: 'Resposta')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-resposta" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="resposta.entrevistainicial.label" default="Entrevistainicial" /></th>
			
				<th><g:message code="resposta.questao.label" default="Questao" /></th>
			
				<g:sortableColumn property="texto" title="${message(code: 'resposta.texto.label', default: 'Texto')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${respostaInstanceList}" status="i" var="respostaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${respostaInstance.id}">${fieldValue(bean: respostaInstance, field: "entrevistainicial")}</g:link></td>
			
				<td>${fieldValue(bean: respostaInstance, field: "questao")}</td>
			
				<td>${fieldValue(bean: respostaInstance, field: "texto")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${respostaInstanceCount}" />
	</div>
</section>

</body>

</html>
