<%@ page import="useweb.PeriodoDeResponsabilidade" %>



			<div class="${hasErrors(bean: periodoDeResponsabilidadeInstance, field: 'aluno', 'error')} required">
				<label for="aluno" class="control-label"><g:message code="periodoDeResponsabilidade.aluno.label" default="Aluno" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="aluno" name="aluno.id" from="${useweb.Aluno.list()}" optionKey="id" required="" value="${periodoDeResponsabilidadeInstance?.aluno?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: periodoDeResponsabilidadeInstance, field: 'aluno', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: periodoDeResponsabilidadeInstance, field: 'dataDeInicio', 'error')} required">
				<label for="dataDeInicio" class="control-label"><g:message code="periodoDeResponsabilidade.dataDeInicio.label" default="Data De Inicio" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataDeInicio" precision="day"  value="${periodoDeResponsabilidadeInstance?.dataDeInicio}"  />
					<span class="help-inline">${hasErrors(bean: periodoDeResponsabilidadeInstance, field: 'dataDeInicio', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: periodoDeResponsabilidadeInstance, field: 'dataDeTermino', 'error')} required">
				<label for="dataDeTermino" class="control-label"><g:message code="periodoDeResponsabilidade.dataDeTermino.label" default="Data De Termino" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataDeTermino" precision="day"  value="${periodoDeResponsabilidadeInstance?.dataDeTermino}"  />
					<span class="help-inline">${hasErrors(bean: periodoDeResponsabilidadeInstance, field: 'dataDeTermino', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: periodoDeResponsabilidadeInstance, field: 'responsavel', 'error')} required">
				<label for="responsavel" class="control-label"><g:message code="periodoDeResponsabilidade.responsavel.label" default="Responsavel" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="responsavel" name="responsavel.id" from="${useweb.Responsavel.list()}" optionKey="id" required="" value="${periodoDeResponsabilidadeInstance?.responsavel?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: periodoDeResponsabilidadeInstance, field: 'responsavel', 'error')}</span>
				</div>
			</div>

