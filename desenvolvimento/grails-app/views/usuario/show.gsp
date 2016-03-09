
<%@ page import="useweb.Usuario" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-usuario" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="usuario.nome.label" default="Nome" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "nome")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="usuario.dataNascimento.label" default="Data Nascimento" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${usuarioInstance?.dataNascimento}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="usuario.sexo.label" default="Sexo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "sexo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="usuario.cpf.label" default="Cpf" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "cpf")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="usuario.cns.label" default="Cns" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "cns")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="usuario.nomeMae.label" default="Nome Mae" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "nomeMae")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="usuario.corRaca.label" default="Cor Raca" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "corRaca")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="usuario.etnia.label" default="Etnia" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "etnia")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="usuario.escolaridade.label" default="Escolaridade" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "escolaridade")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="usuario.profissao.label" default="Profissao" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "profissao")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="usuario.statusProfissao.label" default="Status Profissao" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "statusProfissao")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="usuario.atendimentoconsulta.label" default="Atendimentoconsulta" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${usuarioInstance.atendimentoconsulta}" var="a">
						<li><g:link controller="atendimentoConsulta" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="usuario.cuidador.label" default="Cuidador" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${usuarioInstance.cuidador}" var="c">
						<li><g:link controller="cuidador" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="usuario.emails.label" default="Emails" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${usuarioInstance.emails}" var="e">
						<li><g:link controller="email" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="usuario.endereco.label" default="Endereco" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${usuarioInstance.endereco}" var="e">
						<li><g:link controller="endereco" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="usuario.entrevistainicial.label" default="Entrevistainicial" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${usuarioInstance.entrevistainicial}" var="e">
						<li><g:link controller="entrevistaInicial" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="usuario.orgaoEmissor.label" default="Orgao Emissor" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "orgaoEmissor")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="usuario.registrousuario.label" default="Registrousuario" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${usuarioInstance.registrousuario}" var="r">
						<li><g:link controller="registroUsuario" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="usuario.rg.label" default="Rg" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "rg")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="usuario.tecnicoadministrativo.label" default="Tecnicoadministrativo" /></td>
				
				<td valign="top" class="value"><g:link controller="tecnicoAdministrativo" action="show" id="${usuarioInstance?.tecnicoadministrativo?.id}">${usuarioInstance?.tecnicoadministrativo?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="usuario.telefones.label" default="Telefones" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${usuarioInstance.telefones}" var="t">
						<li><g:link controller="telefone" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
