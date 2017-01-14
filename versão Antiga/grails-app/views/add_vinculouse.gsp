<div id="VU_${counter_vinculouse-1}">
<div class="${hasErrors(bean: Instance, field: 'dataInicio', 'error')} required">
    <label for="dataInicio" class="control-label"><g:message code="vinculoUSE.dataInicio.label" default="Data Inicio" /><span class="required-indicator">*</span></label>
    <div>
        <g:datePicker name="dataInicio_${Numdata}" precision="day"  value="${Instance?.vinculosuse?.dataInicio}"  />
        <span class="help-inline">${hasErrors(bean: vinculoUSEInstance, field: 'dataInicio', 'error')}</span>
    </div>
</div>

<div class="${hasErrors(bean: Instance, field: 'dataTermino', 'error')} required">
    <label for="dataTermino" class="control-label"><g:message code="vinculoUSE.dataTermino.label" default="Data Termino" /><span class="required-indicator">*</span></label>
    <div>
        <g:datePicker name="dataTermino_${Numdata}" precision="day"  value="${Instance?.vinculosuse?.dataTermino}"  />
        <g:submitToRemote controller="${controller}" action="delete_vinculouse" update="VU_${counter_vinculouse-1}" value="Deletar" /><br/>
        <span class="help-inline">${hasErrors(bean: vinculoUSEInstance, field: 'dataTermino', 'error')}</span>
    </div>
</div>
</div>
<g:if test="${add_delete_vinculouse == 0}">
<div id="VU_${counter_vinculouse}">
    <br><g:submitToRemote controller="${controller}" action="add_vinculouse" update="VU_${counter_vinculouse}" value="Adicionar" />
</div>
</g:if>