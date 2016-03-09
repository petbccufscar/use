<%@ page import="useweb.Estagio" %>



			<div class="${hasErrors(bean: estagioInstance, field: 'aluno', 'error')} required">
				<label for="aluno" class="control-label"><g:message code="estagio.aluno.label" default="Aluno" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="aluno" name="aluno.id" from="${useweb.Aluno.list()}" optionKey="id" required="" value="${estagioInstance?.aluno?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: estagioInstance, field: 'aluno', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: estagioInstance, field: 'dataDeInicio', 'error')} required">
				<label for="dataDeInicio" class="control-label"><g:message code="estagio.dataDeInicio.label" default="Data De Inicio" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataDeInicio" precision="day"  value="${estagioInstance?.dataDeInicio}"  />
					<span class="help-inline">${hasErrors(bean: estagioInstance, field: 'dataDeInicio', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: estagioInstance, field: 'dataDeTermino', 'error')} required">
				<label for="dataDeTermino" class="control-label"><g:message code="estagio.dataDeTermino.label" default="Data De Termino" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataDeTermino" precision="day"  value="${estagioInstance?.dataDeTermino}"  />
					<span class="help-inline">${hasErrors(bean: estagioInstance, field: 'dataDeTermino', 'error')}</span>
				</div>
			</div>

