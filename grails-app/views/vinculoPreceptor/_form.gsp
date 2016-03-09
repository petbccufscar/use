<%@ page import="useweb.VinculoPreceptor" %>



			<div class="${hasErrors(bean: vinculoPreceptorInstance, field: 'dataFim', 'error')} required">
				<label for="dataFim" class="control-label"><g:message code="vinculoPreceptor.dataFim.label" default="Data Fim" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataFim" precision="day"  value="${vinculoPreceptorInstance?.dataFim}"  />
					<span class="help-inline">${hasErrors(bean: vinculoPreceptorInstance, field: 'dataFim', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: vinculoPreceptorInstance, field: 'dataInicio', 'error')} required">
				<label for="dataInicio" class="control-label"><g:message code="vinculoPreceptor.dataInicio.label" default="Data Inicio" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataInicio" precision="day"  value="${vinculoPreceptorInstance?.dataInicio}"  />
					<span class="help-inline">${hasErrors(bean: vinculoPreceptorInstance, field: 'dataInicio', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: vinculoPreceptorInstance, field: 'departamento', 'error')} required">
				<label for="departamento" class="control-label"><g:message code="vinculoPreceptor.departamento.label" default="Departamento" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="departamento" name="departamento.id" from="${useweb.Departamento.list()}" optionKey="id" required="" value="${vinculoPreceptorInstance?.departamento?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: vinculoPreceptorInstance, field: 'departamento', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: vinculoPreceptorInstance, field: 'preceptor', 'error')} required">
				<label for="preceptor" class="control-label"><g:message code="vinculoPreceptor.preceptor.label" default="Preceptor" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="preceptor" name="preceptor.id" from="${useweb.Preceptor.list()}" optionKey="id" required="" value="${vinculoPreceptorInstance?.preceptor?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: vinculoPreceptorInstance, field: 'preceptor', 'error')}</span>
				</div>
			</div>

