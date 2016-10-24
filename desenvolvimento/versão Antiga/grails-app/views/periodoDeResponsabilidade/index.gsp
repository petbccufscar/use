
<%@ page import="useweb.PeriodoDeResponsabilidade" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'periodoDeResponsabilidade.label', default: 'PeriodoDeResponsabilidade')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-periodoDeResponsabilidade" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="periodoDeResponsabilidade.aluno.label" default="Aluno" /></th>
			
				<g:sortableColumn property="dataDeInicio" title="${message(code: 'periodoDeResponsabilidade.dataDeInicio.label', default: 'Data De Inicio')}" />
			
				<g:sortableColumn property="dataDeTermino" title="${message(code: 'periodoDeResponsabilidade.dataDeTermino.label', default: 'Data De Termino')}" />
			
				<th><g:message code="periodoDeResponsabilidade.responsavel.label" default="Responsavel" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${periodoDeResponsabilidadeInstanceList}" status="i" var="periodoDeResponsabilidadeInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${periodoDeResponsabilidadeInstance.id}">${fieldValue(bean: periodoDeResponsabilidadeInstance, field: "aluno")}</g:link></td>
			
				<td><g:formatDate date="${periodoDeResponsabilidadeInstance.dataDeInicio}" /></td>
			
				<td><g:formatDate date="${periodoDeResponsabilidadeInstance.dataDeTermino}" /></td>
			
				<td>${fieldValue(bean: periodoDeResponsabilidadeInstance, field: "responsavel")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${periodoDeResponsabilidadeInstanceCount}" />
	</div>
</section>

</body>

</html>
