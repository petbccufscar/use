<%@ page import="useweb.RegistroUsuario" %>



			<div class="${hasErrors(bean: registroUsuarioInstance, field: 'colaborador', 'error')} required">
				<label for="colaborador" class="control-label"><g:message code="registroUsuario.colaborador.label" default="Colaborador" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="colaborador" name="colaborador.id" from="${useweb.Colaborador.list()}" optionKey="id" required="" value="${registroUsuarioInstance?.colaborador?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: registroUsuarioInstance, field: 'colaborador', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: registroUsuarioInstance, field: 'dataDeInicio', 'error')} required">
				<label for="dataDeInicio" class="control-label"><g:message code="registroUsuario.dataDeInicio.label" default="Data De Inicio" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataDeInicio" precision="day"  value="${registroUsuarioInstance?.dataDeInicio}"  />
					<span class="help-inline">${hasErrors(bean: registroUsuarioInstance, field: 'dataDeInicio', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: registroUsuarioInstance, field: 'dataDeTermino', 'error')} required">
				<label for="dataDeTermino" class="control-label"><g:message code="registroUsuario.dataDeTermino.label" default="Data De Termino" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataDeTermino" precision="day"  value="${registroUsuarioInstance?.dataDeTermino}"  />
					<span class="help-inline">${hasErrors(bean: registroUsuarioInstance, field: 'dataDeTermino', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: registroUsuarioInstance, field: 'lcareasubareaacao', 'error')} required">
				<label for="lcareasubareaacao" class="control-label"><g:message code="registroUsuario.lcareasubareaacao.label" default="Lcareasubareaacao" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="lcareasubareaacao" name="lcareasubareaacao.id" from="${linhasdecuidado.LCAreaSubAreaAcao.list()}" optionKey="id" required="" value="${registroUsuarioInstance?.lcareasubareaacao?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: registroUsuarioInstance, field: 'lcareasubareaacao', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: registroUsuarioInstance, field: 'usuario', 'error')} required">
				<label for="usuario" class="control-label"><g:message code="registroUsuario.usuario.label" default="Usuario" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="usuario" name="usuario.id" from="${useweb.Usuario.list()}" optionKey="id" required="" value="${registroUsuarioInstance?.usuario?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: registroUsuarioInstance, field: 'usuario', 'error')}</span>
				</div>
			</div>

