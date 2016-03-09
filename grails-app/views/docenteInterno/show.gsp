
<%@ page import="useweb.DocenteInterno" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'docenteInterno.label', default: 'DocenteInterno')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-docenteInterno" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteInterno.nome.label" default="Nome" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteInternoInstance, field: "nome")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteInterno.dataNascimento.label" default="Data Nascimento" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${docenteInternoInstance?.dataNascimento}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteInterno.sexo.label" default="Sexo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteInternoInstance, field: "sexo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteInterno.cpf.label" default="Cpf" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteInternoInstance, field: "cpf")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteInterno.voluntario.label" default="Voluntario" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${docenteInternoInstance?.voluntario}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteInterno.cbo.label" default="Cbo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteInternoInstance, field: "cbo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteInterno.conselhoCategoria.label" default="Conselho Categoria" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteInternoInstance, field: "conselhoCategoria")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteInterno.siape.label" default="Siape" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteInternoInstance, field: "siape")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteInterno.departamento.label" default="Departamento" /></td>
				
				<td valign="top" class="value"><g:link controller="departamento" action="show" id="${docenteInternoInstance?.departamento?.id}">${docenteInternoInstance?.departamento?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteInterno.emails.label" default="Emails" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${docenteInternoInstance.emails}" var="e">
						<li><g:link controller="email" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteInterno.endereco.label" default="Endereco" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${docenteInternoInstance.endereco}" var="e">
						<li><g:link controller="endereco" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteInterno.login.label" default="Login" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteInternoInstance, field: "login")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteInterno.orgaoEmissor.label" default="Orgao Emissor" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteInternoInstance, field: "orgaoEmissor")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteInterno.periododeresponsabilidade.label" default="Periododeresponsabilidade" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${docenteInternoInstance.periododeresponsabilidade}" var="p">
						<li><g:link controller="periodoDeResponsabilidade" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteInterno.rg.label" default="Rg" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteInternoInstance, field: "rg")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteInterno.senha.label" default="Senha" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: docenteInternoInstance, field: "senha")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteInterno.telefones.label" default="Telefones" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${docenteInternoInstance.telefones}" var="t">
						<li><g:link controller="telefone" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteInterno.vinculodocenteinterno.label" default="Vinculodocenteinterno" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${docenteInternoInstance.vinculodocenteinterno}" var="v">
						<li><g:link controller="vinculoDocenteInterno" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="docenteInterno.vinculosuse.label" default="Vinculosuse" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${docenteInternoInstance.vinculosuse}" var="v">
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
