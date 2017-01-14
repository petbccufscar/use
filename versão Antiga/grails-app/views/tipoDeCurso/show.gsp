
<%@ page import="useweb.TipoDeCurso" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'tipoDeCurso.label', default: 'TipoDeCurso')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-tipoDeCurso" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tipoDeCurso.curso.label" default="Curso" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${tipoDeCursoInstance.curso}" var="c">
						<li><g:link controller="curso" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tipoDeCurso.nome.label" default="Nome" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: tipoDeCursoInstance, field: "nome")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
