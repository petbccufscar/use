<%@ page import="useweb.Email" %>



			<div class="${hasErrors(bean: emailInstance, field: 'pessoa', 'error')} ">
				<label for="pessoa" class="control-label"><g:message code="email.pessoa.label" default="Pessoa" /></label>
				<div>
					<g:select class="form-control" id="pessoa" name="pessoa.id" from="${useweb.Pessoa.list()}" optionKey="id" value="${emailInstance?.pessoa?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: emailInstance, field: 'pessoa', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: emailInstance, field: 'email', 'error')} required">
				<label for="email" class="control-label"><g:message code="email.email.label" default="Email" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" type="email" name="email" required="" value="${emailInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: emailInstance, field: 'email', 'error')}</span>
				</div>
			</div>

