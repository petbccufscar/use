<%@ page import="useweb.EnderecoConsulta" %>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'tipoLogradouro', 'error')} required">
	<label for="tipoLogradouro">
		<g:message code="endereco.tipoLogradouro.label" default="Tipo de Logradouro" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="tipoLogradouro" required="" value="${endereco?.tipoLogradouro}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'logradouro', 'error')} required">
	<label for="logradouro">
		<g:message code="endereco.logradouro.label" default="Logradouro" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="logradouro" required="" value="${endereco?.logradouro}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'bairro', 'error')} required">
	<label for="bairro">
		<g:message code="endereco.bairro.label" default="Bairro" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="bairro" required="" value="${endereco?.bairro}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="endereco.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="estado" required="" value="${endereco?.estado}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'cidade', 'error')} required">
	<label for="cidade">
		<g:message code="endereco.cidade.label" default="Cidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="cidade" required="" value="${endereco?.cidade}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="endereco.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:field class="form-control" name="numero" type="number" value="${endereco?.numero}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'complemento', 'error')} ">
	<label for="complemento">
		<g:message code="endereco.complemento.label" default="Complemento" />
		
	</label>
	<g:textField class="form-control" name="complemento" value="${endereco?.complemento}"/>
</div>