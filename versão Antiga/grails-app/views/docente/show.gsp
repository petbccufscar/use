
<%@ page import="useweb.Docente" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'docente.label', default: 'Docente')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-docente" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docente.nome.label" default="Nome" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteInstance, field: "nome")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docente.dataNascimento.label" default="Data Nascimento" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${docenteInstance?.dataNascimento}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docente.sexo.label" default="Sexo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteInstance, field: "sexo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docente.cpf.label" default="Cpf" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteInstance, field: "cpf")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docente.voluntario.label" default="Voluntario" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${docenteInstance?.voluntario}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docente.cbo.label" default="Cbo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteInstance, field: "cbo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docente.conselhoCategoria.label" default="Conselho Categoria" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteInstance, field: "conselhoCategoria")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docente.emails.label" default="Emails" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${docenteInstance.emails}" var="e">
						<li><g:link controller="email" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docente.endereco.label" default="Endereco" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${docenteInstance.endereco}" var="e">
						<li><g:link controller="endereco" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docente.login.label" default="Login" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteInstance, field: "login")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docente.orgaoEmissor.label" default="Orgao Emissor" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteInstance, field: "orgaoEmissor")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docente.periododeresponsabilidade.label" default="Periododeresponsabilidade" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${docenteInstance.periododeresponsabilidade}" var="p">
						<li><g:link controller="periodoDeResponsabilidade" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docente.rg.label" default="Rg" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteInstance, field: "rg")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docente.senha.label" default="Senha" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteInstance, field: "senha")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docente.telefones.label" default="Telefones" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${docenteInstance.telefones}" var="t">
						<li><g:link controller="telefone" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docente.vinculosuse.label" default="Vinculosuse" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${docenteInstance.vinculosuse}" var="v">
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
