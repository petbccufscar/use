<%@ page import="useweb.Aluno" %>



			<div class="${hasErrors(bean: alunoInstance, field: 'nome', 'error')} required">
				<label for="nome" class="control-label"><g:message code="aluno.nome.label" default="Nome" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="nome" required="" value="${alunoInstance?.nome}"/>
					<span class="help-inline">${hasErrors(bean: alunoInstance, field: 'nome', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: alunoInstance, field: 'dataNascimento', 'error')} required">
				<label for="dataNascimento" class="control-label"><g:message code="aluno.dataNascimento.label" default="Data Nascimento" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataNascimento" precision="day"  value="${alunoInstance?.dataNascimento}"  />
					<span class="help-inline">${hasErrors(bean: alunoInstance, field: 'dataNascimento', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: alunoInstance, field: 'sexo', 'error')} required">
				<label for="sexo" class="control-label"><g:message code="aluno.sexo.label" default="Sexo" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" name="sexo" from="${alunoInstance.constraints.sexo.inList}" required="" value="${alunoInstance?.sexo}" valueMessagePrefix="aluno.sexo"/>
					<span class="help-inline">${hasErrors(bean: alunoInstance, field: 'sexo', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: alunoInstance, field: 'cpf', 'error')} required">
				<label for="cpf" class="control-label"><g:message code="aluno.cpf.label" default="Cpf" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="cpf" required="" value="${alunoInstance?.cpf}"/>
					<span class="help-inline">${hasErrors(bean: alunoInstance, field: 'cpf', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: alunoInstance, field: 'voluntario', 'error')} ">
				<label for="voluntario" class="control-label"><g:message code="aluno.voluntario.label" default="Voluntario" /></label>
				<div>
					<bs:checkBox name="voluntario" value="${alunoInstance?.voluntario}" />
					<span class="help-inline">${hasErrors(bean: alunoInstance, field: 'voluntario', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: alunoInstance, field: 'curso', 'error')} ">
				<label for="curso" class="control-label"><g:message code="aluno.curso.label" default="Curso" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${alunoInstance?.curso?}" var="c">
    <li><g:link controller="curso" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="curso" action="create" params="['aluno.id': alunoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'curso.label', default: 'Curso')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: alunoInstance, field: 'curso', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: alunoInstance, field: 'emails', 'error')} ">
				<label for="emails" class="control-label"><g:message code="aluno.emails.label" default="Emails" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${alunoInstance?.emails?}" var="e">
    <li><g:link controller="email" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="email" action="create" params="['aluno.id': alunoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'email.label', default: 'Email')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: alunoInstance, field: 'emails', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: alunoInstance, field: 'endereco', 'error')} ">
				<label for="endereco" class="control-label"><g:message code="aluno.endereco.label" default="Endereco" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${alunoInstance?.endereco?}" var="e">
    <li><g:link controller="endereco" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="endereco" action="create" params="['aluno.id': alunoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'endereco.label', default: 'Endereco')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: alunoInstance, field: 'endereco', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: alunoInstance, field: 'estagio', 'error')} ">
				<label for="estagio" class="control-label"><g:message code="aluno.estagio.label" default="Estagio" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${alunoInstance?.estagio?}" var="e">
    <li><g:link controller="estagio" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="estagio" action="create" params="['aluno.id': alunoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'estagio.label', default: 'Estagio')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: alunoInstance, field: 'estagio', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: alunoInstance, field: 'login', 'error')} ">
				<label for="login" class="control-label"><g:message code="aluno.login.label" default="Login" /></label>
				<div>
					<g:textField class="form-control" name="login" value="${alunoInstance?.login}"/>
					<span class="help-inline">${hasErrors(bean: alunoInstance, field: 'login', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: alunoInstance, field: 'orgaoEmissor', 'error')} ">
				<label for="orgaoEmissor" class="control-label"><g:message code="aluno.orgaoEmissor.label" default="Orgao Emissor" /></label>
				<div>
					<g:textField class="form-control" name="orgaoEmissor" value="${alunoInstance?.orgaoEmissor}"/>
					<span class="help-inline">${hasErrors(bean: alunoInstance, field: 'orgaoEmissor', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: alunoInstance, field: 'periododeresponsabilidade', 'error')} ">
				<label for="periododeresponsabilidade" class="control-label"><g:message code="aluno.periododeresponsabilidade.label" default="Periododeresponsabilidade" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${alunoInstance?.periododeresponsabilidade?}" var="p">
    <li><g:link controller="periodoDeResponsabilidade" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="periodoDeResponsabilidade" action="create" params="['aluno.id': alunoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'periodoDeResponsabilidade.label', default: 'PeriodoDeResponsabilidade')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: alunoInstance, field: 'periododeresponsabilidade', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: alunoInstance, field: 'rg', 'error')} ">
				<label for="rg" class="control-label"><g:message code="aluno.rg.label" default="Rg" /></label>
				<div>
					<g:textField class="form-control" name="rg" value="${alunoInstance?.rg}"/>
					<span class="help-inline">${hasErrors(bean: alunoInstance, field: 'rg', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: alunoInstance, field: 'senha', 'error')} ">
				<label for="senha" class="control-label"><g:message code="aluno.senha.label" default="Senha" /></label>
				<div>
					<g:textField class="form-control" name="senha" value="${alunoInstance?.senha}"/>
					<span class="help-inline">${hasErrors(bean: alunoInstance, field: 'senha', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: alunoInstance, field: 'telefones', 'error')} ">
				<label for="telefones" class="control-label"><g:message code="aluno.telefones.label" default="Telefones" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${alunoInstance?.telefones?}" var="t">
    <li><g:link controller="telefone" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="telefone" action="create" params="['aluno.id': alunoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefone.label', default: 'Telefone')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: alunoInstance, field: 'telefones', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: alunoInstance, field: 'vinculosuse', 'error')} ">
				<label for="vinculosuse" class="control-label"><g:message code="aluno.vinculosuse.label" default="Vinculosuse" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${alunoInstance?.vinculosuse?}" var="v">
    <li><g:link controller="vinculoUSE" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vinculoUSE" action="create" params="['aluno.id': alunoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vinculoUSE.label', default: 'VinculoUSE')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: alunoInstance, field: 'vinculosuse', 'error')}</span>
				</div>
			</div>

