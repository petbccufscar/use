<%@ page import="useweb.VinculoDocenteExterno" %>



			<div class="${hasErrors(bean: vinculoDocenteExternoInstance, field: 'dataFim', 'error')} required">
				<label for="dataFim" class="control-label"><g:message code="vinculoDocenteExterno.dataFim.label" default="Data Fim" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataFim" precision="day"  value="${vinculoDocenteExternoInstance?.dataFim}"  />
					<span class="help-inline">${hasErrors(bean: vinculoDocenteExternoInstance, field: 'dataFim', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: vinculoDocenteExternoInstance, field: 'dataInicio', 'error')} required">
				<label for="dataInicio" class="control-label"><g:message code="vinculoDocenteExterno.dataInicio.label" default="Data Inicio" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataInicio" precision="day"  value="${vinculoDocenteExternoInstance?.dataInicio}"  />
					<span class="help-inline">${hasErrors(bean: vinculoDocenteExternoInstance, field: 'dataInicio', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: vinculoDocenteExternoInstance, field: 'docenteexterno', 'error')} required">
				<label for="docenteexterno" class="control-label"><g:message code="vinculoDocenteExterno.docenteexterno.label" default="Docenteexterno" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="docenteexterno" name="docenteexterno.id" from="${useweb.DocenteExterno.list()}" optionKey="id" required="" value="${vinculoDocenteExternoInstance?.docenteexterno?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: vinculoDocenteExternoInstance, field: 'docenteexterno', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: vinculoDocenteExternoInstance, field: 'origem', 'error')} required">
				<label for="origem" class="control-label"><g:message code="vinculoDocenteExterno.origem.label" default="Origem" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="origem" name="origem.id" from="${useweb.Origem.list()}" optionKey="id" required="" value="${vinculoDocenteExternoInstance?.origem?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: vinculoDocenteExternoInstance, field: 'origem', 'error')}</span>
				</div>
			</div>

