<%@ page import="useweb.VinculoUSE" %>



			<div class="${hasErrors(bean: vinculoUSEInstance, field: 'colaborador', 'error')} required">
				<label for="colaborador" class="control-label"><g:message code="vinculoUSE.colaborador.label" default="Colaborador" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="colaborador" name="colaborador.id" from="${useweb.Colaborador.list()}" optionKey="id" required="" value="${vinculoUSEInstance?.colaborador?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: vinculoUSEInstance, field: 'colaborador', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: vinculoUSEInstance, field: 'dataInicio', 'error')} required">
				<label for="dataInicio" class="control-label"><g:message code="vinculoUSE.dataInicio.label" default="Data Inicio" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataInicio" precision="day"  value="${vinculoUSEInstance?.dataInicio}"  />
					<span class="help-inline">${hasErrors(bean: vinculoUSEInstance, field: 'dataInicio', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: vinculoUSEInstance, field: 'dataTermino', 'error')} required">
				<label for="dataTermino" class="control-label"><g:message code="vinculoUSE.dataTermino.label" default="Data Termino" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataTermino" precision="day"  value="${vinculoUSEInstance?.dataTermino}"  />
					<span class="help-inline">${hasErrors(bean: vinculoUSEInstance, field: 'dataTermino', 'error')}</span>
				</div>
			</div>

