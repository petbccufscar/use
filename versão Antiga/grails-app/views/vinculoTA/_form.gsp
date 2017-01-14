<%@ page import="useweb.VinculoTA" %>



			<div class="${hasErrors(bean: vinculoTAInstance, field: 'dataInicio', 'error')} required">
				<label for="dataInicio" class="control-label"><g:message code="vinculoTA.dataInicio.label" default="Data Inicio" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataInicio" precision="day"  value="${vinculoTAInstance?.dataInicio}"  />
					<span class="help-inline">${hasErrors(bean: vinculoTAInstance, field: 'dataInicio', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: vinculoTAInstance, field: 'dataTermino', 'error')} required">
				<label for="dataTermino" class="control-label"><g:message code="vinculoTA.dataTermino.label" default="Data Termino" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataTermino" precision="day"  value="${vinculoTAInstance?.dataTermino}"  />
					<span class="help-inline">${hasErrors(bean: vinculoTAInstance, field: 'dataTermino', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: vinculoTAInstance, field: 'departamento', 'error')} required">
				<label for="departamento" class="control-label"><g:message code="vinculoTA.departamento.label" default="Departamento" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="departamento" name="departamento.id" from="${useweb.Departamento.list()}" optionKey="id" required="" value="${vinculoTAInstance?.departamento?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: vinculoTAInstance, field: 'departamento', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: vinculoTAInstance, field: 'tecnicos', 'error')} required">
				<label for="tecnicos" class="control-label"><g:message code="vinculoTA.tecnicos.label" default="Tecnicos" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="tecnicos" name="tecnicos.id" from="${useweb.TecnicoAdministrativo.list()}" optionKey="id" required="" value="${vinculoTAInstance?.tecnicos?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: vinculoTAInstance, field: 'tecnicos', 'error')}</span>
				</div>
			</div>

