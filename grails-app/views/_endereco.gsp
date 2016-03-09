<g:each in="${Instance?.endereco}" var="e" status="i">

    <div class="${hasErrors(bean: Instance, field: 'Cep', 'error')} ">
        <label for="cep" class="control-label"><g:message code="usuario.cep.label" default="Cep" /><span class="required-indicator">*</span></label>
        <div>
            <g:textField class="form-control" name="cep" id="cep" onblur="${remoteFunction(action: 'addressByCEP', update: [success: 'addressContainer2'], params: '\'cep=\' + this.value')}" value="${e?.cep}" />
            <span class="help-inline">${hasErrors(bean: Instance, field: 'cep', 'error')}</span>
        </div>
    </div>
    <div id="addressContainer2">
    <div class="${hasErrors(bean: Instance, field: 'tipoLogradouro', 'error')} ">
        <label for="tipoLogradouro" class="control-label"><g:message code="usuario.tipoLogradouro.label" default="Tipo de Logradouro" /><span class="required-indicator">*</span></label>
        <div>
            <g:textField class="form-control" name="tipoLogradouro" value="${e?.tipoLogradouro}"/>
            <span class="help-inline">${hasErrors(bean: Instance, field: 'tipoLogradouro', 'error')}</span>
        </div>
    </div>

    <div class="${hasErrors(bean: Instance, field: 'logradouro', 'error')} ">
        <label for="logradouro" class="control-label"><g:message code="usuario.logradouro.label" default="Logradouro" /><span class="required-indicator">*</span></label>
        <div>
            <g:textField class="form-control" name="logradouro" value="${e?.logradouro}"/>
            <span class="help-inline">${hasErrors(bean: Instance, field: 'logradouro', 'error')}</span>
        </div>
    </div>

    <div class="${hasErrors(bean: Instance, field: 'bairro', 'error')} ">
        <label for="bairro" class="control-label"><g:message code="usuario.bairro.label" default="Bairro" /><span class="required-indicator">*</span></label>
        <div>
            <g:textField class="form-control" name="bairro" value="${e?.bairro}"/>
            <span class="help-inline">${hasErrors(bean: Instance, field: 'bairro', 'error')}</span>
        </div>
    </div>

    <div class="${hasErrors(bean: Instance, field: 'estado', 'error')} ">
        <label for="estado" class="control-label"><g:message code="usuario.estado.label" default="Estado" /><span class="required-indicator">*</span></label>
        <div>
            <g:textField class="form-control" name="estado" value="${e?.estado}"/>
            <span class="help-inline">${hasErrors(bean: Instance, field: 'estado', 'error')}</span>
        </div>
    </div>

    <div class="${hasErrors(bean: Instance, field: 'cidade', 'error')} ">
        <label for="cidade" class="control-label"><g:message code="usuario.cidade.label" default="Cidade" /><span class="required-indicator">*</span></label>
        <div>
            <g:textField class="form-control" name="cidade" value="${e?.cidade}"/>
            <span class="help-inline">${hasErrors(bean: Instance, field: 'cidade', 'error')}</span>
        </div>
    </div>

    <div class="${hasErrors(bean: Instance, field: 'numero', 'error')} ">
        <label for="numero" class="control-label"><g:message code="usuario.numero.label" default="Numero" /><span class="required-indicator">*</span></label>
        <div>
            <g:textField class="form-control" name="numero" value="${e?.numero}"/>
            <span class="help-inline">${hasErrors(bean: Instance, field: 'numero', 'error')}</span>
        </div>
    </div>

    <div class="${hasErrors(bean: Instance, field: 'complemento', 'error')} ">
        <label for="complemento" class="control-label"><g:message code="usuario.complemento.label" default="Complemento" /><span class="required-indicator">*</span></label>
        <div>
            <g:textField class="form-control" name="complemento" value="${e?.complemento}"/>
            <span class="help-inline">${hasErrors(bean: Instance, field: 'complemento', 'error')}</span>
        </div>
    </div>
    </div>
</g:each>
<g:if test="${!Instance?.endereco}">
    <div class="fieldcontain ${hasErrors(bean: Instance, field: 'cep', 'error')} required">
        <label for="cep">
            <g:message code="endereco.cep.label" default="Cep" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField class="form-control" name="cep" onblur="${remoteFunction(action: 'addressByCEP', update: [success: 'addressContainer'], params: '\'cep=\' + this.value')}" required="" value="${Instance?.endereco?.cep}"/>
    </div>
    <div id="addressContainer">
        <g:render template="../busca_endereco"/>
    </div>
</g:if>