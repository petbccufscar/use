<%@ page import="useweb.AtendimentoConsulta" %>



			<div class="${hasErrors(bean: atendimentoConsultaInstance, field: 'conduta', 'error')} ">
				<label for="conduta" class="control-label"><g:message code="atendimentoConsulta.conduta.label" default="Conduta" /></label>
				<div>
					<g:textField class="form-control" name="conduta" value="${atendimentoConsultaInstance?.conduta}"/>
					<span class="help-inline">${hasErrors(bean: atendimentoConsultaInstance, field: 'conduta', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: atendimentoConsultaInstance, field: 'dataConsulta', 'error')} required">
				<label for="dataConsulta" class="control-label"><g:message code="atendimentoConsulta.dataConsulta.label" default="Data Consulta" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataConsulta" precision="day"  value="${atendimentoConsultaInstance?.dataConsulta}"  />
					<span class="help-inline">${hasErrors(bean: atendimentoConsultaInstance, field: 'dataConsulta', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: atendimentoConsultaInstance, field: 'horaInicio', 'error')} required">
				<label for="horaInicio" class="control-label"><g:message code="atendimentoConsulta.horaInicio.label" default="Hora Inicio" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" name="horaInicio" value="${fieldValue(bean: atendimentoConsultaInstance, field: 'horaInicio')}" required=""/>
					<span class="help-inline">${hasErrors(bean: atendimentoConsultaInstance, field: 'horaInicio', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: atendimentoConsultaInstance, field: 'horaTermino', 'error')} required">
				<label for="horaTermino" class="control-label"><g:message code="atendimentoConsulta.horaTermino.label" default="Hora Termino" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" name="horaTermino" value="${fieldValue(bean: atendimentoConsultaInstance, field: 'horaTermino')}" required=""/>
					<span class="help-inline">${hasErrors(bean: atendimentoConsultaInstance, field: 'horaTermino', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: atendimentoConsultaInstance, field: 'lcareasubareaacao', 'error')} required">
				<label for="lcareasubareaacao" class="control-label"><g:message code="atendimentoConsulta.lcareasubareaacao.label" default="Lcareasubareaacao" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="lcareasubareaacao" name="lcareasubareaacao.id" from="${linhasdecuidado.LCAreaSubAreaAcao.list()}" optionKey="id" required="" value="${atendimentoConsultaInstance?.lcareasubareaacao?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: atendimentoConsultaInstance, field: 'lcareasubareaacao', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: atendimentoConsultaInstance, field: 'procedimento', 'error')} required">
				<label for="procedimento" class="control-label"><g:message code="atendimentoConsulta.procedimento.label" default="Procedimento" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="procedimento" name="procedimento.id" from="${linhasdecuidado.Procedimento.list()}" optionKey="id" required="" value="${atendimentoConsultaInstance?.procedimento?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: atendimentoConsultaInstance, field: 'procedimento', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: atendimentoConsultaInstance, field: 'responsavel', 'error')} required">
				<label for="responsavel" class="control-label"><g:message code="atendimentoConsulta.responsavel.label" default="Responsavel" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="responsavel" name="responsavel.id" from="${useweb.Responsavel.list()}" optionKey="id" required="" value="${atendimentoConsultaInstance?.responsavel?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: atendimentoConsultaInstance, field: 'responsavel', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: atendimentoConsultaInstance, field: 'usuario', 'error')} required">
				<label for="usuario" class="control-label"><g:message code="atendimentoConsulta.usuario.label" default="Usuario" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="usuario" name="usuario.id" from="${useweb.Usuario.list()}" optionKey="id" required="" value="${atendimentoConsultaInstance?.usuario?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: atendimentoConsultaInstance, field: 'usuario', 'error')}</span>
				</div>
			</div>

