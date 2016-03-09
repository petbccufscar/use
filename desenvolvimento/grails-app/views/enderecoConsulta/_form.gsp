<%@ page import="useweb.EnderecoConsulta" %>



			<div class="${hasErrors(bean: enderecoConsultaInstance, field: 'cep', 'error')} required">
				<label for="cep" class="control-label"><g:message code="enderecoConsulta.cep.label" default="Cep" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="cep" required="" value="${enderecoConsultaInstance?.cep}"/>
					<span class="help-inline">${hasErrors(bean: enderecoConsultaInstance, field: 'cep', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: enderecoConsultaInstance, field: 'tipoLogradouro', 'error')} ">
				<label for="tipoLogradouro" class="control-label"><g:message code="enderecoConsulta.tipoLogradouro.label" default="Tipo Logradouro" /></label>
				<div>
					<g:textField class="form-control" name="tipoLogradouro" value="${enderecoConsultaInstance?.tipoLogradouro}"/>
					<span class="help-inline">${hasErrors(bean: enderecoConsultaInstance, field: 'tipoLogradouro', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: enderecoConsultaInstance, field: 'logradouro', 'error')} ">
				<label for="logradouro" class="control-label"><g:message code="enderecoConsulta.logradouro.label" default="Logradouro" /></label>
				<div>
					<g:textField class="form-control" name="logradouro" value="${enderecoConsultaInstance?.logradouro}"/>
					<span class="help-inline">${hasErrors(bean: enderecoConsultaInstance, field: 'logradouro', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: enderecoConsultaInstance, field: 'bairro', 'error')} ">
				<label for="bairro" class="control-label"><g:message code="enderecoConsulta.bairro.label" default="Bairro" /></label>
				<div>
					<g:textField class="form-control" name="bairro" value="${enderecoConsultaInstance?.bairro}"/>
					<span class="help-inline">${hasErrors(bean: enderecoConsultaInstance, field: 'bairro', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: enderecoConsultaInstance, field: 'estado', 'error')} required">
				<label for="estado" class="control-label"><g:message code="enderecoConsulta.estado.label" default="Estado" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="estado" required="" value="${enderecoConsultaInstance?.estado}"/>
					<span class="help-inline">${hasErrors(bean: enderecoConsultaInstance, field: 'estado', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: enderecoConsultaInstance, field: 'cidade', 'error')} required">
				<label for="cidade" class="control-label"><g:message code="enderecoConsulta.cidade.label" default="Cidade" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="cidade" required="" value="${enderecoConsultaInstance?.cidade}"/>
					<span class="help-inline">${hasErrors(bean: enderecoConsultaInstance, field: 'cidade', 'error')}</span>
				</div>
			</div>

