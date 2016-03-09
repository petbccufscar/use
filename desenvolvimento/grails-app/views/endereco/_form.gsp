<%@ page import="useweb.Endereco" %>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'cep', 'error')} required">
	<label for="cep">
		<g:message code="endereco.cep.label" default="Cep" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cep" onblur="${remoteFunction(action: 'addressByCEP', update: [success: 'addressContainer'], params: '\'cep=\' + this.value')}" required="" value="${enderecoInstance?.cep}"/>
</div>

<div id="addressContainer">
    <g:render template="endereco"/>
</div>
