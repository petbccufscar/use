<div id="T_${counter_telefone-1}">
    <div class="${hasErrors(bean: Instance, field: 'tipo', 'error')} required">
        <label for="tipo" class="control-label"><g:message code="telefone.tipo.label" default="Tipo" /><span class="required-indicator">*</span></label>
        <div>
            <g:select class="form-control" name="tipo" from="${useweb.Telefone.constraints.tipo.inList}" required="" value="" valueMessagePrefix="telefone.tipo"/>
            <span class="help-inline">${hasErrors(bean: Instance, field: 'tipo', 'error')}</span>
        </div>
    </div>

    <div class="${hasErrors(bean: Instance, field: 'codigoArea', 'error')} required">
        <label for="codigoArea" class="control-label"><g:message code="telefone.codigoArea.label" default="Codigo Area" /><span class="required-indicator">*</span></label>
        <div>
            <g:textField class="form-control" name="codigoArea" required="" value=""/>
            <span class="help-inline">${hasErrors(bean: Instance, field: 'codigoArea', 'error')}</span>
        </div>
    </div>

    <div class="${hasErrors(bean: Instance, field: 'telefone', 'error')} required">
        <label for="telefone" class="control-label"><g:message code="telefone.telefone.label" default="Telefone" /><span class="required-indicator">*</span></label>
        <div>
            <g:textField class="form-control" name="telefone" required="" value=""/>
            <span class="help-inline">${hasErrors(bean: Instance, field: 'telefone', 'error')}</span>
        </div>
    </div>

    <div class="${hasErrors(bean: Instance, field: 'observacao', 'error')} ">
        <label for="observacao" class="control-label"><g:message code="telefone.observacao.label" default="Observacao" /></label>
        <div>
            <g:textField class="form-control" name="observacao" value=""/>
            <g:submitToRemote controller="${controller}" action="delete_telefone" update="T_${counter_telefone-1}" value="Deletar" /><br/>
            <span class="help-inline">${hasErrors(bean: Instance, field: 'observacao', 'error')}</span>
        </div>
    </div>
</div>
<g:if test="${add_delete_telefone == 0}">
    <div id="T_${counter_telefone}">
        <br><g:submitToRemote controller="${controller}" action="add_telefone" update="T_${counter_telefone}"  value="Adicionar"/>
    </div>
</g:if>