
<%@ page import="useweb.TecnicoAdministrativo" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'tecnicoAdministrativo.label', default: 'TecnicoAdministrativo')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-tecnicoAdministrativo" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tecnicoAdministrativo.nome.label" default="Nome" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: tecnicoAdministrativoInstance, field: "nome")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tecnicoAdministrativo.dataNascimento.label" default="Data Nascimento" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${tecnicoAdministrativoInstance?.dataNascimento}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tecnicoAdministrativo.sexo.label" default="Sexo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: tecnicoAdministrativoInstance, field: "sexo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tecnicoAdministrativo.cpf.label" default="Cpf" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: tecnicoAdministrativoInstance, field: "cpf")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tecnicoAdministrativo.voluntario.label" default="Voluntario" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${tecnicoAdministrativoInstance?.voluntario}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tecnicoAdministrativo.cargo.label" default="Cargo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: tecnicoAdministrativoInstance, field: "cargo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tecnicoAdministrativo.cbo.label" default="Cbo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: tecnicoAdministrativoInstance, field: "cbo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tecnicoAdministrativo.conselhoCategoria.label" default="Conselho Categoria" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: tecnicoAdministrativoInstance, field: "conselhoCategoria")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tecnicoAdministrativo.siape.label" default="Siape" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: tecnicoAdministrativoInstance, field: "siape")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tecnicoAdministrativo.emails.label" default="Emails" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${tecnicoAdministrativoInstance.emails}" var="e">
						<li><g:link controller="email" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tecnicoAdministrativo.endereco.label" default="Endereco" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${tecnicoAdministrativoInstance.endereco}" var="e">
						<li><g:link controller="endereco" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tecnicoAdministrativo.login.label" default="Login" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: tecnicoAdministrativoInstance, field: "login")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tecnicoAdministrativo.orgaoEmissor.label" default="Orgao Emissor" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: tecnicoAdministrativoInstance, field: "orgaoEmissor")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tecnicoAdministrativo.rg.label" default="Rg" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: tecnicoAdministrativoInstance, field: "rg")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tecnicoAdministrativo.senha.label" default="Senha" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: tecnicoAdministrativoInstance, field: "senha")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tecnicoAdministrativo.telefones.label" default="Telefones" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${tecnicoAdministrativoInstance.telefones}" var="t">
						<li><g:link controller="telefone" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tecnicoAdministrativo.vinculosuse.label" default="Vinculosuse" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${tecnicoAdministrativoInstance.vinculosuse}" var="v">
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
