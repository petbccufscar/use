<%@ page import="useweb.Telefone" %>



			<div class="${hasErrors(bean: telefoneInstance, field: 'pessoa', 'error')} ">
				<label for="pessoa" class="control-label"><g:message code="telefone.pessoa.label" default="Pessoa" /></label>
				<div>
					<g:select class="form-control" id="pessoa" name="pessoa.id" from="${useweb.Pessoa.list()}" optionKey="id" value="${telefoneInstance?.pessoa?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: telefoneInstance, field: 'pessoa', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: telefoneInstance, field: 'tipo', 'error')} required">
				<label for="tipo" class="control-label"><g:message code="telefone.tipo.label" default="Tipo" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" name="tipo" from="${telefoneInstance.constraints.tipo.inList}" required="" value="${telefoneInstance?.tipo}" valueMessagePrefix="telefone.tipo"/>
					<span class="help-inline">${hasErrors(bean: telefoneInstance, field: 'tipo', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: telefoneInstance, field: 'codigoArea', 'error')} required">
				<label for="codigoArea" class="control-label"><g:message code="telefone.codigoArea.label" default="Codigo Area" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="codigoArea" required="" value="${telefoneInstance?.codigoArea}"/>
					<span class="help-inline">${hasErrors(bean: telefoneInstance, field: 'codigoArea', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: telefoneInstance, field: 'telefone', 'error')} required">
				<label for="telefone" class="control-label"><g:message code="telefone.telefone.label" default="Telefone" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="telefone" required="" value="${telefoneInstance?.telefone}"/>
					<span class="help-inline">${hasErrors(bean: telefoneInstance, field: 'telefone', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: telefoneInstance, field: 'observacao', 'error')} ">
				<label for="observacao" class="control-label"><g:message code="telefone.observacao.label" default="Observacao" /></label>
				<div>
					<g:textField class="form-control" name="observacao" value="${telefoneInstance?.observacao}"/>
					<span class="help-inline">${hasErrors(bean: telefoneInstance, field: 'observacao', 'error')}</span>
				</div>
			</div>

