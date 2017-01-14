
<%@ page import="useweb.TratamentoVigente" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'tratamentoVigente.label', default: 'TratamentoVigente')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-tratamentoVigente" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="tratamentoVigente.entrevistainicial.label" default="Entrevistainicial" /></th>
			
				<g:sortableColumn property="local" title="${message(code: 'tratamentoVigente.local.label', default: 'Local')}" />
			
				<g:sortableColumn property="nome" title="${message(code: 'tratamentoVigente.nome.label', default: 'Nome')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${tratamentoVigenteInstanceList}" status="i" var="tratamentoVigenteInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${tratamentoVigenteInstance.id}">${fieldValue(bean: tratamentoVigenteInstance, field: "entrevistainicial")}</g:link></td>
			
				<td>${fieldValue(bean: tratamentoVigenteInstance, field: "local")}</td>
			
				<td>${fieldValue(bean: tratamentoVigenteInstance, field: "nome")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${tratamentoVigenteInstanceCount}" />
	</div>
</section>

</body>

</html>
