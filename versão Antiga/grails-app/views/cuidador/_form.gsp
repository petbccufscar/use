<%@ page import="useweb.Cuidador" %>



			<div class="${hasErrors(bean: cuidadorInstance, field: 'nome', 'error')} required">
				<label for="nome" class="control-label"><g:message code="cuidador.nome.label" default="Nome" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="nome" required="" value="${cuidadorInstance?.nome}"/>
					<span class="help-inline">${hasErrors(bean: cuidadorInstance, field: 'nome', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: cuidadorInstance, field: 'dataNascimento', 'error')} required">
				<label for="dataNascimento" class="control-label"><g:message code="cuidador.dataNascimento.label" default="Data Nascimento" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataNascimento" precision="day"  value="${cuidadorInstance?.dataNascimento}"  />
					<span class="help-inline">${hasErrors(bean: cuidadorInstance, field: 'dataNascimento', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: cuidadorInstance, field: 'sexo', 'error')} required">
				<label for="sexo" class="control-label"><g:message code="cuidador.sexo.label" default="Sexo" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" name="sexo" from="${cuidadorInstance.constraints.sexo.inList}" required="" value="${cuidadorInstance?.sexo}" valueMessagePrefix="cuidador.sexo"/>
					<span class="help-inline">${hasErrors(bean: cuidadorInstance, field: 'sexo', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: cuidadorInstance, field: 'cpf', 'error')} required">
				<label for="cpf" class="control-label"><g:message code="cuidador.cpf.label" default="Cpf" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="cpf" required="" value="${cuidadorInstance?.cpf}"/>
					<span class="help-inline">${hasErrors(bean: cuidadorInstance, field: 'cpf', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: cuidadorInstance, field: 'vinculo', 'error')} required">
				<label for="vinculo" class="control-label"><g:message code="cuidador.vinculo.label" default="Vinculo" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" name="vinculo" from="${cuidadorInstance.constraints.vinculo.inList}" required="" value="${cuidadorInstance?.vinculo}" valueMessagePrefix="cuidador.vinculo"/>
					<span class="help-inline">${hasErrors(bean: cuidadorInstance, field: 'vinculo', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: cuidadorInstance, field: 'emails', 'error')} ">
				<label for="emails" class="control-label"><g:message code="cuidador.emails.label" default="Emails" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${cuidadorInstance?.emails?}" var="e">
    <li><g:link controller="email" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="email" action="create" params="['cuidador.id': cuidadorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'email.label', default: 'Email')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: cuidadorInstance, field: 'emails', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: cuidadorInstance, field: 'endereco', 'error')} ">
				<label for="endereco" class="control-label"><g:message code="cuidador.endereco.label" default="Endereco" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${cuidadorInstance?.endereco?}" var="e">
    <li><g:link controller="endereco" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="endereco" action="create" params="['cuidador.id': cuidadorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'endereco.label', default: 'Endereco')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: cuidadorInstance, field: 'endereco', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: cuidadorInstance, field: 'orgaoEmissor', 'error')} ">
				<label for="orgaoEmissor" class="control-label"><g:message code="cuidador.orgaoEmissor.label" default="Orgao Emissor" /></label>
				<div>
					<g:textField class="form-control" name="orgaoEmissor" value="${cuidadorInstance?.orgaoEmissor}"/>
					<span class="help-inline">${hasErrors(bean: cuidadorInstance, field: 'orgaoEmissor', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: cuidadorInstance, field: 'rg', 'error')} ">
				<label for="rg" class="control-label"><g:message code="cuidador.rg.label" default="Rg" /></label>
				<div>
					<g:textField class="form-control" name="rg" value="${cuidadorInstance?.rg}"/>
					<span class="help-inline">${hasErrors(bean: cuidadorInstance, field: 'rg', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: cuidadorInstance, field: 'telefones', 'error')} ">
				<label for="telefones" class="control-label"><g:message code="cuidador.telefones.label" default="Telefones" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${cuidadorInstance?.telefones?}" var="t">
    <li><g:link controller="telefone" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="telefone" action="create" params="['cuidador.id': cuidadorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefone.label', default: 'Telefone')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: cuidadorInstance, field: 'telefones', 'error')}</span>
				</div>
			</div>

