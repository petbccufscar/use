<%@ page import="useweb.EnderecoConsulta" %>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'cuidador_tipoLogradouro', 'error')} required">
	<label for="cuidador_tipoLogradouro">
		<g:message code="endereco.cuidador.tipoLogradouro.label" default="Tipo de Logradouro do Cuidador" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="cuidador_tipoLogradouro" required="" value="${endereco?.tipoLogradouro}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'cuidador_logradouro', 'error')} required">
	<label for="cuidador_logradouro">
		<g:message code="endereco.cuidador.logradouro.label" default="Logradouro do Cuidador" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="cuidador_logradouro" required="" value="${endereco?.logradouro}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'cuidador_bairro', 'error')} required">
	<label for="cuidador_bairro">
		<g:message code="endereco.cuidador.bairro.label" default="Bairro do Cuidador" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="cuidador_bairro" required="" value="${endereco?.bairro}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'cuidador_estado', 'error')} required">
	<label for="cuidador_estado">
		<g:message code="endereco.cuidador.estado.label" default="Estado do Cuidador" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="cuidador_estado" required="" value="${endereco?.estado}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'cuidador_cidade', 'error')} required">
	<label for="cuidador_cidade">
		<g:message code="endereco.cuidador.cidade.label" default="Cidade do Cuidador" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="cuidador_cidade" required="" value="${endereco?.cidade}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'cuidador_numero', 'error')} required">
	<label for="cuidador_numero">
		<g:message code="endereco.cuidador.numero.label" default="Numero do Cuidador" />
		<span class="required-indicator">*</span>
	</label>
	<g:field class="form-control" name="cuidador_numero" type="number" value="${endereco?.numero}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'cuidador_complemento', 'error')} ">
	<label for="cuidador_complemento">
		<g:message code="endereco.cuidador.complemento.label" default="Complemento do Cuidador" />
		
	</label>
	<g:textField class="form-control" name="cuidador_complemento" value="${endereco?.complemento}"/>
</div>