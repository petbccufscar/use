
<%@ page import="useweb.Preceptor" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'preceptor.label', default: 'Preceptor')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-preceptor" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="preceptor.nome.label" default="Nome" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: preceptorInstance, field: "nome")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="preceptor.dataNascimento.label" default="Data Nascimento" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${preceptorInstance?.dataNascimento}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="preceptor.sexo.label" default="Sexo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: preceptorInstance, field: "sexo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="preceptor.cpf.label" default="Cpf" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: preceptorInstance, field: "cpf")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="preceptor.voluntario.label" default="Voluntario" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${preceptorInstance?.voluntario}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="preceptor.cbo.label" default="Cbo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: preceptorInstance, field: "cbo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="preceptor.conselhoCategoria.label" default="Conselho Categoria" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: preceptorInstance, field: "conselhoCategoria")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="preceptor.origem.label" default="Origem" /></td>
				
				<td valign="top" class="value"><g:link controller="origem" action="show" id="${preceptorInstance?.origem?.id}">${preceptorInstance?.origem?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="preceptor.departamento.label" default="Departamento" /></td>
				
				<td valign="top" class="value"><g:link controller="departamento" action="show" id="${preceptorInstance?.departamento?.id}">${preceptorInstance?.departamento?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="preceptor.emails.label" default="Emails" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${preceptorInstance.emails}" var="e">
						<li><g:link controller="email" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="preceptor.endereco.label" default="Endereco" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${preceptorInstance.endereco}" var="e">
						<li><g:link controller="endereco" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="preceptor.login.label" default="Login" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: preceptorInstance, field: "login")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="preceptor.orgaoEmissor.label" default="Orgao Emissor" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: preceptorInstance, field: "orgaoEmissor")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="preceptor.periododeresponsabilidade.label" default="Periododeresponsabilidade" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${preceptorInstance.periododeresponsabilidade}" var="p">
						<li><g:link controller="periodoDeResponsabilidade" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="preceptor.rg.label" default="Rg" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: preceptorInstance, field: "rg")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="preceptor.senha.label" default="Senha" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: preceptorInstance, field: "senha")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="preceptor.telefones.label" default="Telefones" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${preceptorInstance.telefones}" var="t">
						<li><g:link controller="telefone" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="preceptor.tipoOrigem.label" default="Tipo Origem" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: preceptorInstance, field: "tipoOrigem")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="preceptor.vinculopreceptor.label" default="Vinculopreceptor" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${preceptorInstance.vinculopreceptor}" var="v">
						<li><g:link controller="vinculoPreceptor" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="preceptor.vinculosuse.label" default="Vinculosuse" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${preceptorInstance.vinculosuse}" var="v">
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
