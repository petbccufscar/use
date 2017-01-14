<%@ page import="useweb.Docente" %>



			<div class="${hasErrors(bean: docenteInstance, field: 'nome', 'error')} required">
				<label for="nome" class="control-label"><g:message code="docente.nome.label" default="Nome" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="nome" required="" value="${docenteInstance?.nome}"/>
					<span class="help-inline">${hasErrors(bean: docenteInstance, field: 'nome', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: docenteInstance, field: 'dataNascimento', 'error')} required">
				<label for="dataNascimento" class="control-label"><g:message code="docente.dataNascimento.label" default="Data Nascimento" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataNascimento" precision="day"  value="${docenteInstance?.dataNascimento}"  />
					<span class="help-inline">${hasErrors(bean: docenteInstance, field: 'dataNascimento', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: docenteInstance, field: 'sexo', 'error')} required">
				<label for="sexo" class="control-label"><g:message code="docente.sexo.label" default="Sexo" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" name="sexo" from="${docenteInstance.constraints.sexo.inList}" required="" value="${docenteInstance?.sexo}" valueMessagePrefix="docente.sexo"/>
					<span class="help-inline">${hasErrors(bean: docenteInstance, field: 'sexo', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: docenteInstance, field: 'cpf', 'error')} required">
				<label for="cpf" class="control-label"><g:message code="docente.cpf.label" default="Cpf" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="cpf" required="" value="${docenteInstance?.cpf}"/>
					<span class="help-inline">${hasErrors(bean: docenteInstance, field: 'cpf', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: docenteInstance, field: 'voluntario', 'error')} ">
				<label for="voluntario" class="control-label"><g:message code="docente.voluntario.label" default="Voluntario" /></label>
				<div>
					<bs:checkBox name="voluntario" value="${docenteInstance?.voluntario}" />
					<span class="help-inline">${hasErrors(bean: docenteInstance, field: 'voluntario', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: docenteInstance, field: 'cbo', 'error')} required">
				<label for="cbo" class="control-label"><g:message code="docente.cbo.label" default="Cbo" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="cbo" required="" value="${docenteInstance?.cbo}"/>
					<span class="help-inline">${hasErrors(bean: docenteInstance, field: 'cbo', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: docenteInstance, field: 'conselhoCategoria', 'error')} required">
				<label for="conselhoCategoria" class="control-label"><g:message code="docente.conselhoCategoria.label" default="Conselho Categoria" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="conselhoCategoria" maxlength="20" required="" value="${docenteInstance?.conselhoCategoria}"/>
					<span class="help-inline">${hasErrors(bean: docenteInstance, field: 'conselhoCategoria', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: docenteInstance, field: 'emails', 'error')} ">
				<label for="emails" class="control-label"><g:message code="docente.emails.label" default="Emails" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${docenteInstance?.emails?}" var="e">
    <li><g:link controller="email" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="email" action="create" params="['docente.id': docenteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'email.label', default: 'Email')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: docenteInstance, field: 'emails', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: docenteInstance, field: 'endereco', 'error')} ">
				<label for="endereco" class="control-label"><g:message code="docente.endereco.label" default="Endereco" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${docenteInstance?.endereco?}" var="e">
    <li><g:link controller="endereco" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="endereco" action="create" params="['docente.id': docenteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'endereco.label', default: 'Endereco')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: docenteInstance, field: 'endereco', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: docenteInstance, field: 'login', 'error')} ">
				<label for="login" class="control-label"><g:message code="docente.login.label" default="Login" /></label>
				<div>
					<g:textField class="form-control" name="login" value="${docenteInstance?.login}"/>
					<span class="help-inline">${hasErrors(bean: docenteInstance, field: 'login', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: docenteInstance, field: 'orgaoEmissor', 'error')} ">
				<label for="orgaoEmissor" class="control-label"><g:message code="docente.orgaoEmissor.label" default="Orgao Emissor" /></label>
				<div>
					<g:textField class="form-control" name="orgaoEmissor" value="${docenteInstance?.orgaoEmissor}"/>
					<span class="help-inline">${hasErrors(bean: docenteInstance, field: 'orgaoEmissor', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: docenteInstance, field: 'periododeresponsabilidade', 'error')} ">
				<label for="periododeresponsabilidade" class="control-label"><g:message code="docente.periododeresponsabilidade.label" default="Periododeresponsabilidade" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${docenteInstance?.periododeresponsabilidade?}" var="p">
    <li><g:link controller="periodoDeResponsabilidade" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="periodoDeResponsabilidade" action="create" params="['docente.id': docenteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'periodoDeResponsabilidade.label', default: 'PeriodoDeResponsabilidade')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: docenteInstance, field: 'periododeresponsabilidade', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: docenteInstance, field: 'rg', 'error')} ">
				<label for="rg" class="control-label"><g:message code="docente.rg.label" default="Rg" /></label>
				<div>
					<g:textField class="form-control" name="rg" value="${docenteInstance?.rg}"/>
					<span class="help-inline">${hasErrors(bean: docenteInstance, field: 'rg', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: docenteInstance, field: 'senha', 'error')} ">
				<label for="senha" class="control-label"><g:message code="docente.senha.label" default="Senha" /></label>
				<div>
					<g:textField class="form-control" name="senha" value="${docenteInstance?.senha}"/>
					<span class="help-inline">${hasErrors(bean: docenteInstance, field: 'senha', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: docenteInstance, field: 'telefones', 'error')} ">
				<label for="telefones" class="control-label"><g:message code="docente.telefones.label" default="Telefones" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${docenteInstance?.telefones?}" var="t">
    <li><g:link controller="telefone" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="telefone" action="create" params="['docente.id': docenteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefone.label', default: 'Telefone')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: docenteInstance, field: 'telefones', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: docenteInstance, field: 'vinculosuse', 'error')} ">
				<label for="vinculosuse" class="control-label"><g:message code="docente.vinculosuse.label" default="Vinculosuse" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${docenteInstance?.vinculosuse?}" var="v">
    <li><g:link controller="vinculoUSE" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vinculoUSE" action="create" params="['docente.id': docenteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vinculoUSE.label', default: 'VinculoUSE')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: docenteInstance, field: 'vinculosuse', 'error')}</span>
				</div>
			</div>

