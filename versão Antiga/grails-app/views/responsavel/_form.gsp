<%@ page import="useweb.Responsavel" %>



			<div class="${hasErrors(bean: responsavelInstance, field: 'nome', 'error')} required">
				<label for="nome" class="control-label"><g:message code="responsavel.nome.label" default="Nome" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="nome" required="" value="${responsavelInstance?.nome}"/>
					<span class="help-inline">${hasErrors(bean: responsavelInstance, field: 'nome', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: responsavelInstance, field: 'dataNascimento', 'error')} required">
				<label for="dataNascimento" class="control-label"><g:message code="responsavel.dataNascimento.label" default="Data Nascimento" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataNascimento" precision="day"  value="${responsavelInstance?.dataNascimento}"  />
					<span class="help-inline">${hasErrors(bean: responsavelInstance, field: 'dataNascimento', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: responsavelInstance, field: 'sexo', 'error')} required">
				<label for="sexo" class="control-label"><g:message code="responsavel.sexo.label" default="Sexo" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" name="sexo" from="${responsavelInstance.constraints.sexo.inList}" required="" value="${responsavelInstance?.sexo}" valueMessagePrefix="responsavel.sexo"/>
					<span class="help-inline">${hasErrors(bean: responsavelInstance, field: 'sexo', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: responsavelInstance, field: 'cpf', 'error')} required">
				<label for="cpf" class="control-label"><g:message code="responsavel.cpf.label" default="Cpf" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="cpf" required="" value="${responsavelInstance?.cpf}"/>
					<span class="help-inline">${hasErrors(bean: responsavelInstance, field: 'cpf', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: responsavelInstance, field: 'voluntario', 'error')} ">
				<label for="voluntario" class="control-label"><g:message code="responsavel.voluntario.label" default="Voluntario" /></label>
				<div>
					<bs:checkBox name="voluntario" value="${responsavelInstance?.voluntario}" />
					<span class="help-inline">${hasErrors(bean: responsavelInstance, field: 'voluntario', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: responsavelInstance, field: 'emails', 'error')} ">
				<label for="emails" class="control-label"><g:message code="responsavel.emails.label" default="Emails" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${responsavelInstance?.emails?}" var="e">
    <li><g:link controller="email" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="email" action="create" params="['responsavel.id': responsavelInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'email.label', default: 'Email')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: responsavelInstance, field: 'emails', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: responsavelInstance, field: 'endereco', 'error')} ">
				<label for="endereco" class="control-label"><g:message code="responsavel.endereco.label" default="Endereco" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${responsavelInstance?.endereco?}" var="e">
    <li><g:link controller="endereco" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="endereco" action="create" params="['responsavel.id': responsavelInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'endereco.label', default: 'Endereco')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: responsavelInstance, field: 'endereco', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: responsavelInstance, field: 'login', 'error')} ">
				<label for="login" class="control-label"><g:message code="responsavel.login.label" default="Login" /></label>
				<div>
					<g:textField class="form-control" name="login" value="${responsavelInstance?.login}"/>
					<span class="help-inline">${hasErrors(bean: responsavelInstance, field: 'login', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: responsavelInstance, field: 'orgaoEmissor', 'error')} ">
				<label for="orgaoEmissor" class="control-label"><g:message code="responsavel.orgaoEmissor.label" default="Orgao Emissor" /></label>
				<div>
					<g:textField class="form-control" name="orgaoEmissor" value="${responsavelInstance?.orgaoEmissor}"/>
					<span class="help-inline">${hasErrors(bean: responsavelInstance, field: 'orgaoEmissor', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: responsavelInstance, field: 'periododeresponsabilidade', 'error')} ">
				<label for="periododeresponsabilidade" class="control-label"><g:message code="responsavel.periododeresponsabilidade.label" default="Periododeresponsabilidade" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${responsavelInstance?.periododeresponsabilidade?}" var="p">
    <li><g:link controller="periodoDeResponsabilidade" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="periodoDeResponsabilidade" action="create" params="['responsavel.id': responsavelInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'periodoDeResponsabilidade.label', default: 'PeriodoDeResponsabilidade')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: responsavelInstance, field: 'periododeresponsabilidade', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: responsavelInstance, field: 'rg', 'error')} ">
				<label for="rg" class="control-label"><g:message code="responsavel.rg.label" default="Rg" /></label>
				<div>
					<g:textField class="form-control" name="rg" value="${responsavelInstance?.rg}"/>
					<span class="help-inline">${hasErrors(bean: responsavelInstance, field: 'rg', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: responsavelInstance, field: 'senha', 'error')} ">
				<label for="senha" class="control-label"><g:message code="responsavel.senha.label" default="Senha" /></label>
				<div>
					<g:textField class="form-control" name="senha" value="${responsavelInstance?.senha}"/>
					<span class="help-inline">${hasErrors(bean: responsavelInstance, field: 'senha', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: responsavelInstance, field: 'telefones', 'error')} ">
				<label for="telefones" class="control-label"><g:message code="responsavel.telefones.label" default="Telefones" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${responsavelInstance?.telefones?}" var="t">
    <li><g:link controller="telefone" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="telefone" action="create" params="['responsavel.id': responsavelInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefone.label', default: 'Telefone')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: responsavelInstance, field: 'telefones', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: responsavelInstance, field: 'vinculosuse', 'error')} ">
				<label for="vinculosuse" class="control-label"><g:message code="responsavel.vinculosuse.label" default="Vinculosuse" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${responsavelInstance?.vinculosuse?}" var="v">
    <li><g:link controller="vinculoUSE" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vinculoUSE" action="create" params="['responsavel.id': responsavelInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vinculoUSE.label', default: 'VinculoUSE')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: responsavelInstance, field: 'vinculosuse', 'error')}</span>
				</div>
			</div>

