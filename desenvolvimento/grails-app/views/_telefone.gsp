<g:set var="counter_telefone2" value="${-1}" />
<g:each in="${Instance?.telefones}" var="e" status="i">
    <div id="T_${counter_telefone2-i}">
        <div class="${hasErrors(bean: Instance, field: 'tipo', 'error')} required">
            <label for="tipo" class="control-label"><g:message code="telefone.tipo.label" default="Tipo" /><span class="required-indicator">*</span></label>
            <div>
                <g:select class="form-control" name="tipo" from="${useweb.Telefone.constraints.tipo.inList}" required="" value="${e?.tipo}" valueMessagePrefix="telefone.tipo"/>
                <span class="help-inline">${hasErrors(bean: Instance, field: 'tipo', 'error')}</span>
            </div>
        </div>

        <div class="${hasErrors(bean: Instance, field: 'codigoArea', 'error')} required">
            <label for="codigoArea" class="control-label"><g:message code="telefone.codigoArea.label" default="Codigo Area" /><span class="required-indicator">*</span></label>
            <div>
                <g:textField class="form-control" name="codigoArea" required="" value="${e?.codigoArea}"/>
                <span class="help-inline">${hasErrors(bean: Instance, field: 'codigoArea', 'error')}</span>
            </div>
        </div>

        <div class="${hasErrors(bean: Instance, field: 'telefone', 'error')} required">
            <label for="telefone" class="control-label"><g:message code="telefone.telefone.label" default="Telefone" /><span class="required-indicator">*</span></label>
            <div>
                <g:textField class="form-control" name="telefone" required="" value="${e?.telefone}"/>
                <span class="help-inline">${hasErrors(bean: Instance, field: 'telefone', 'error')}</span>
            </div>
        </div>

        <div class="${hasErrors(bean: telefoneInstance, field: 'observacao', 'error')} ">
            <label for="observacao" class="control-label"><g:message code="telefone.observacao.label" default="Observacao" /></label>
            <div>
                <g:textField class="form-control" name="observacao" value="${e?.observacao}"/>
                <g:submitToRemote controller="${controller}" action="delete_telefone" update="T_${counter_telefone2-i}" value="Deletar" /><br/>
                <span class="help-inline">${hasErrors(bean: Instance, field: 'observacao', 'error')}</span>
            </div>
        </div>
    </div>
</g:each>

<g:if test="${!Instance?.telefones}">
    <div id="T_${counter_telefone2}">
        <div class="${hasErrors(bean: Instance, field: 'tipo', 'error')} required">
            <label for="tipo" class="control-label"><g:message code="telefone.tipo.label" default="Tipo" /><span class="required-indicator">*</span></label>
            <div>
                <g:select class="form-control" name="tipo" from="${useweb.Telefone.constraints.tipo.inList}" required="" value="${Instance?.telefones?.tipo}" valueMessagePrefix="telefone.tipo"/>
                <span class="help-inline">${hasErrors(bean: Instance, field: 'tipo', 'error')}</span>
            </div>
        </div>

        <div class="${hasErrors(bean: Instance, field: 'codigoArea', 'error')} required">
            <label for="codigoArea" class="control-label"><g:message code="telefone.codigoArea.label" default="Codigo Area" /><span class="required-indicator">*</span></label>
            <div>
                <g:textField class="form-control" name="codigoArea" required="" value="${Instance?.telefones?.codigoArea}"/>
                <span class="help-inline">${hasErrors(bean: Instance, field: 'codigoArea', 'error')}</span>
            </div>
        </div>

        <div class="${hasErrors(bean: Instance, field: 'telefone', 'error')} required">
            <label for="telefone" class="control-label"><g:message code="telefone.telefone.label" default="Telefone" /><span class="required-indicator">*</span></label>
            <div>
                <g:textField class="form-control" name="telefone" required="" value="${Instance?.telefones?.telefone}"/>
                <span class="help-inline">${hasErrors(bean: Instance, field: 'telefone', 'error')}</span>
            </div>
        </div>

        <div class="${hasErrors(bean: telefoneInstance, field: 'observacao', 'error')} ">
            <label for="observacao" class="control-label"><g:message code="telefone.observacao.label" default="Observacao" /></label>
            <div>
                <g:textField class="form-control" name="observacao" value="${Instance?.telefones?.observacao}"/>
                <g:submitToRemote controller="${controller}" action="delete_telefone" update="T_${counter_telefone2}" value="Deletar" /><br/>
                <span class="help-inline">${hasErrors(bean: Instance, field: 'observacao', 'error')}</span>
            </div>
        </div>
    </div>
</g:if>


<g:set var="counter_telefone" value="0" />
<div id="T_${counter_telefone}">
    <g:submitToRemote controller="${controller}" action="add_telefone" update="T_${counter_telefone}"  value="Adicionar"/>
</div>