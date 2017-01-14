
<%@ page import="useweb.AlunoInterno" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'alunoInterno.label', default: 'AlunoInterno')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-alunoInterno" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alunoInterno.nome.label" default="Nome" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: alunoInternoInstance, field: "nome")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alunoInterno.dataNascimento.label" default="Data Nascimento" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${alunoInternoInstance?.dataNascimento}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alunoInterno.sexo.label" default="Sexo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: alunoInternoInstance, field: "sexo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alunoInterno.cpf.label" default="Cpf" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: alunoInternoInstance, field: "cpf")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alunoInterno.voluntario.label" default="Voluntario" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${alunoInternoInstance?.voluntario}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alunoInterno.ra.label" default="Ra" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: alunoInternoInstance, field: "ra")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alunoInterno.curso.label" default="Curso" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${alunoInternoInstance.curso}" var="c">
						<li><g:link controller="curso" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alunoInterno.emails.label" default="Emails" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${alunoInternoInstance.emails}" var="e">
						<li><g:link controller="email" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alunoInterno.endereco.label" default="Endereco" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${alunoInternoInstance.endereco}" var="e">
						<li><g:link controller="endereco" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alunoInterno.estagio.label" default="Estagio" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${alunoInternoInstance.estagio}" var="e">
						<li><g:link controller="estagio" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alunoInterno.login.label" default="Login" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: alunoInternoInstance, field: "login")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alunoInterno.orgaoEmissor.label" default="Orgao Emissor" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: alunoInternoInstance, field: "orgaoEmissor")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alunoInterno.periododeresponsabilidade.label" default="Periododeresponsabilidade" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${alunoInternoInstance.periododeresponsabilidade}" var="p">
						<li><g:link controller="periodoDeResponsabilidade" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alunoInterno.responsalve.label" default="Responsalve" /></td>
				
				<td valign="top" class="value"><g:link controller="responsavel" action="show" id="${alunoInternoInstance?.responsalve?.id}">${alunoInternoInstance?.responsalve?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alunoInterno.rg.label" default="Rg" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: alunoInternoInstance, field: "rg")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alunoInterno.senha.label" default="Senha" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: alunoInternoInstance, field: "senha")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alunoInterno.telefones.label" default="Telefones" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${alunoInternoInstance.telefones}" var="t">
						<li><g:link controller="telefone" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alunoInterno.vinculosuse.label" default="Vinculosuse" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${alunoInternoInstance.vinculosuse}" var="v">
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
