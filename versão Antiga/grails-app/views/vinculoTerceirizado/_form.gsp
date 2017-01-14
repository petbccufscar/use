<%@ page import="useweb.VinculoTerceirizado" %>



			<div class="${hasErrors(bean: vinculoTerceirizadoInstance, field: 'dataFim', 'error')} required">
				<label for="dataFim" class="control-label"><g:message code="vinculoTerceirizado.dataFim.label" default="Data Fim" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataFim" precision="day"  value="${vinculoTerceirizadoInstance?.dataFim}"  />
					<span class="help-inline">${hasErrors(bean: vinculoTerceirizadoInstance, field: 'dataFim', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: vinculoTerceirizadoInstance, field: 'dataInicio', 'error')} required">
				<label for="dataInicio" class="control-label"><g:message code="vinculoTerceirizado.dataInicio.label" default="Data Inicio" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataInicio" precision="day"  value="${vinculoTerceirizadoInstance?.dataInicio}"  />
					<span class="help-inline">${hasErrors(bean: vinculoTerceirizadoInstance, field: 'dataInicio', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: vinculoTerceirizadoInstance, field: 'origem', 'error')} required">
				<label for="origem" class="control-label"><g:message code="vinculoTerceirizado.origem.label" default="Origem" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="origem" name="origem.id" from="${useweb.Origem.list()}" optionKey="id" required="" value="${vinculoTerceirizadoInstance?.origem?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: vinculoTerceirizadoInstance, field: 'origem', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: vinculoTerceirizadoInstance, field: 'terceirizado', 'error')} required">
				<label for="terceirizado" class="control-label"><g:message code="vinculoTerceirizado.terceirizado.label" default="Terceirizado" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="terceirizado" name="terceirizado.id" from="${useweb.Terceirizado.list()}" optionKey="id" required="" value="${vinculoTerceirizadoInstance?.terceirizado?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: vinculoTerceirizadoInstance, field: 'terceirizado', 'error')}</span>
				</div>
			</div>

