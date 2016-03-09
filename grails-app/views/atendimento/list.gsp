
<%@ page import="linhasdecuidado.Atendimento" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'atendimento.label', default: 'Atendimento')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-atendimento" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nome" title="${message(code: 'atendimento.nome.label', default: 'Nome')}" />
			
				<g:sortableColumn property="descricao" title="${message(code: 'atendimento.descricao.label', default: 'Descricao')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${atendimentoInstanceList}" status="i" var="atendimentoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${atendimentoInstance.id}">${fieldValue(bean: atendimentoInstance, field: "nome")}</g:link></td>
			
				<td>${fieldValue(bean: atendimentoInstance, field: "descricao")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${atendimentoInstanceCount}" />
	</div>
</section>

</body>

</html>
