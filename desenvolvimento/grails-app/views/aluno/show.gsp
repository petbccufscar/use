
<%@ page import="useweb.Aluno" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'aluno.label', default: 'Aluno')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-aluno" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluno.nome.label" default="Nome" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: alunoInstance, field: "nome")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluno.dataNascimento.label" default="Data Nascimento" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${alunoInstance?.dataNascimento}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluno.sexo.label" default="Sexo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: alunoInstance, field: "sexo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluno.cpf.label" default="Cpf" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: alunoInstance, field: "cpf")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluno.voluntario.label" default="Voluntario" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${alunoInstance?.voluntario}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluno.curso.label" default="Curso" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${alunoInstance.curso}" var="c">
						<li><g:link controller="curso" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluno.emails.label" default="Emails" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${alunoInstance.emails}" var="e">
						<li><g:link controller="email" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluno.endereco.label" default="Endereco" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${alunoInstance.endereco}" var="e">
						<li><g:link controller="endereco" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluno.estagio.label" default="Estagio" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${alunoInstance.estagio}" var="e">
						<li><g:link controller="estagio" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluno.login.label" default="Login" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: alunoInstance, field: "login")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluno.orgaoEmissor.label" default="Orgao Emissor" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: alunoInstance, field: "orgaoEmissor")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluno.periododeresponsabilidade.label" default="Periododeresponsabilidade" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${alunoInstance.periododeresponsabilidade}" var="p">
						<li><g:link controller="periodoDeResponsabilidade" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluno.rg.label" default="Rg" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: alunoInstance, field: "rg")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluno.senha.label" default="Senha" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: alunoInstance, field: "senha")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluno.telefones.label" default="Telefones" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${alunoInstance.telefones}" var="t">
						<li><g:link controller="telefone" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluno.vinculosuse.label" default="Vinculosuse" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${alunoInstance.vinculosuse}" var="v">
						<li><g:link controller="vinculoUSE" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
