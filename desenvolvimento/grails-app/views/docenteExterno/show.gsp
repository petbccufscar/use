
<%@ page import="useweb.DocenteExterno" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'docenteExterno.label', default: 'DocenteExterno')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-docenteExterno" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteExterno.nome.label" default="Nome" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteExternoInstance, field: "nome")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteExterno.dataNascimento.label" default="Data Nascimento" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${docenteExternoInstance?.dataNascimento}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteExterno.sexo.label" default="Sexo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteExternoInstance, field: "sexo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteExterno.cpf.label" default="Cpf" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteExternoInstance, field: "cpf")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteExterno.voluntario.label" default="Voluntario" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${docenteExternoInstance?.voluntario}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteExterno.cbo.label" default="Cbo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteExternoInstance, field: "cbo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteExterno.conselhoCategoria.label" default="Conselho Categoria" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteExternoInstance, field: "conselhoCategoria")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteExterno.origem.label" default="Origem" /></td>
				
				<td valign="top" class="value"><g:link controller="origem" action="show" id="${docenteExternoInstance?.origem?.id}">${docenteExternoInstance?.origem?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteExterno.emails.label" default="Emails" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${docenteExternoInstance.emails}" var="e">
						<li><g:link controller="email" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteExterno.endereco.label" default="Endereco" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${docenteExternoInstance.endereco}" var="e">
						<li><g:link controller="endereco" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteExterno.login.label" default="Login" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteExternoInstance, field: "login")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteExterno.orgaoEmissor.label" default="Orgao Emissor" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteExternoInstance, field: "orgaoEmissor")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteExterno.periododeresponsabilidade.label" default="Periododeresponsabilidade" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${docenteExternoInstance.periododeresponsabilidade}" var="p">
						<li><g:link controller="periodoDeResponsabilidade" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteExterno.rg.label" default="Rg" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteExternoInstance, field: "rg")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteExterno.senha.label" default="Senha" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteExternoInstance, field: "senha")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteExterno.telefones.label" default="Telefones" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${docenteExternoInstance.telefones}" var="t">
						<li><g:link controller="telefone" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteExterno.vinculodocenteexterno.label" default="Vinculodocenteexterno" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${docenteExternoInstance.vinculodocenteexterno}" var="v">
						<li><g:link controller="vinculoDocenteExterno" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteExterno.vinculosuse.label" default="Vinculosuse" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${docenteExternoInstance.vinculosuse}" var="v">
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
