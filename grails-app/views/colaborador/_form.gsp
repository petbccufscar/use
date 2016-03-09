<%@ page import="useweb.Colaborador" %>



			<div class="${hasErrors(bean: colaboradorInstance, field: 'nome', 'error')} required">
				<label for="nome" class="control-label"><g:message code="colaborador.nome.label" default="Nome" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="nome" required="" value="${colaboradorInstance?.nome}"/>
					<span class="help-inline">${hasErrors(bean: colaboradorInstance, field: 'nome', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: colaboradorInstance, field: 'dataNascimento', 'error')} required">
				<label for="dataNascimento" class="control-label"><g:message code="colaborador.dataNascimento.label" default="Data Nascimento" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataNascimento" precision="day"  value="${colaboradorInstance?.dataNascimento}"  />
					<span class="help-inline">${hasErrors(bean: colaboradorInstance, field: 'dataNascimento', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: colaboradorInstance, field: 'sexo', 'error')} required">
				<label for="sexo" class="control-label"><g:message code="colaborador.sexo.label" default="Sexo" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" name="sexo" from="${colaboradorInstance.constraints.sexo.inList}" required="" value="${colaboradorInstance?.sexo}" valueMessagePrefix="colaborador.sexo"/>
					<span class="help-inline">${hasErrors(bean: colaboradorInstance, field: 'sexo', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: colaboradorInstance, field: 'cpf', 'error')} required">
				<label for="cpf" class="control-label"><g:message code="colaborador.cpf.label" default="Cpf" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="cpf" required="" value="${colaboradorInstance?.cpf}"/>
					<span class="help-inline">${hasErrors(bean: colaboradorInstance, field: 'cpf', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: colaboradorInstance, field: 'voluntario', 'error')} ">
				<label for="voluntario" class="control-label"><g:message code="colaborador.voluntario.label" default="Voluntario" /></label>
				<div>
					<bs:checkBox name="voluntario" value="${colaboradorInstance?.voluntario}" />
					<span class="help-inline">${hasErrors(bean: colaboradorInstance, field: 'voluntario', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: colaboradorInstance, field: 'emails', 'error')} ">
				<label for="emails" class="control-label"><g:message code="colaborador.emails.label" default="Emails" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${colaboradorInstance?.emails?}" var="e">
    <li><g:link controller="email" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="email" action="create" params="['colaborador.id': colaboradorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'email.label', default: 'Email')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: colaboradorInstance, field: 'emails', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: colaboradorInstance, field: 'endereco', 'error')} ">
				<label for="endereco" class="control-label"><g:message code="colaborador.endereco.label" default="Endereco" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${colaboradorInstance?.endereco?}" var="e">
    <li><g:link controller="endereco" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="endereco" action="create" params="['colaborador.id': colaboradorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'endereco.label', default: 'Endereco')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: colaboradorInstance, field: 'endereco', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: colaboradorInstance, field: 'login', 'error')} ">
				<label for="login" class="control-label"><g:message code="colaborador.login.label" default="Login" /></label>
				<div>
					<g:textField class="form-control" name="login" value="${colaboradorInstance?.login}"/>
					<span class="help-inline">${hasErrors(bean: colaboradorInstance, field: 'login', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: colaboradorInstance, field: 'orgaoEmissor', 'error')} ">
				<label for="orgaoEmissor" class="control-label"><g:message code="colaborador.orgaoEmissor.label" default="Orgao Emissor" /></label>
				<div>
					<g:textField class="form-control" name="orgaoEmissor" value="${colaboradorInstance?.orgaoEmissor}"/>
					<span class="help-inline">${hasErrors(bean: colaboradorInstance, field: 'orgaoEmissor', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: colaboradorInstance, field: 'rg', 'error')} ">
				<label for="rg" class="control-label"><g:message code="colaborador.rg.label" default="Rg" /></label>
				<div>
					<g:textField class="form-control" name="rg" value="${colaboradorInstance?.rg}"/>
					<span class="help-inline">${hasErrors(bean: colaboradorInstance, field: 'rg', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: colaboradorInstance, field: 'senha', 'error')} ">
				<label for="senha" class="control-label"><g:message code="colaborador.senha.label" default="Senha" /></label>
				<div>
					<g:textField class="form-control" name="senha" value="${colaboradorInstance?.senha}"/>
					<span class="help-inline">${hasErrors(bean: colaboradorInstance, field: 'senha', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: colaboradorInstance, field: 'telefones', 'error')} ">
				<label for="telefones" class="control-label"><g:message code="colaborador.telefones.label" default="Telefones" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${colaboradorInstance?.telefones?}" var="t">
    <li><g:link controller="telefone" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="telefone" action="create" params="['colaborador.id': colaboradorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefone.label', default: 'Telefone')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: colaboradorInstance, field: 'telefones', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: colaboradorInstance, field: 'vinculosuse', 'error')} ">
				<label for="vinculosuse" class="control-label"><g:message code="colaborador.vinculosuse.label" default="Vinculosuse" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${colaboradorInstance?.vinculosuse?}" var="v">
    <li><g:link controller="vinculoUSE" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vinculoUSE" action="create" params="['colaborador.id': colaboradorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vinculoUSE.label', default: 'VinculoUSE')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: colaboradorInstance, field: 'vinculosuse', 'error')}</span>
				</div>
			</div>

