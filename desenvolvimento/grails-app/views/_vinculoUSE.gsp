<g:set var="counter_vinculouse2" value="${-1}" />
<g:each in="${Instance?.vinculosuse}" var="e" status="i">
    <div id="VU_${counter_vinculouse2-i}">
        <div class="${hasErrors(bean: Instance, field: 'dataInicio', 'error')} required">
            <label for="dataInicio" class="control-label"><g:message code="vinculoUSE.dataInicio.label" default="Data Inicio" /><span class="required-indicator">*</span></label>
            <div>
                <g:datePicker name="dataInicio_${i}" precision="day"  value="${e?.dataInicio}"  />
                <span class="help-inline">${hasErrors(bean: vinculoUSEInstance, field: 'dataInicio', 'error')}</span>
            </div>
        </div>

        <div class="${hasErrors(bean: Instance, field: 'dataTermino', 'error')} required">
            <label for="dataTermino" class="control-label"><g:message code="vinculoUSE.dataTermino.label" default="Data Termino" /><span class="required-indicator">*</span></label>
            <div>
                <g:datePicker name="dataTermino_${i}" precision="day"  value="${e?.dataTermino}"  />
                <g:submitToRemote controller="${controller}" action="delete_vinculouse" update="VU_${counter_vinculouse2-i}" value="Deletar" /><br/>
                <span class="help-inline">${hasErrors(bean: vinculoUSEInstance, field: 'dataTermino', 'error')}</span>
            </div>
        </div>
    </div>
</g:each>

<g:if test="${!Instance?.vinculosuse}">
    <div id="VU_${counter_vinculouse2}">
        <div class="${hasErrors(bean: Instance, field: 'dataInicio', 'error')} required">
            <label for="dataInicio" class="control-label"><g:message code="vinculoUSE.dataInicio.label" default="Data Inicio" /><span class="required-indicator">*</span></label>
            <div>
                <g:datePicker name="dataInicio_0" precision="day"  value="${Instance?.vinculosuse?.dataInicio}"  />
                <span class="help-inline">${hasErrors(bean: vinculoUSEInstance, field: 'dataInicio', 'error')}</span>
            </div>
        </div>

        <div class="${hasErrors(bean: Instance, field: 'dataTermino', 'error')} required">
            <label for="dataTermino" class="control-label"><g:message code="vinculoUSE.dataTermino.label" default="Data Termino" /><span class="required-indicator">*</span></label>
            <div>
                <g:datePicker name="dataTermino_0" precision="day"  value="${Instance?.vinculosuse?.dataTermino}"  />
                <g:submitToRemote controller="${controller}" action="delete_vinculouse" update="VU_${counter_vinculouse2}" value="Deletar" /><br/>
                <span class="help-inline">${hasErrors(bean: vinculoUSEInstance, field: 'dataTermino', 'error')}</span>
            </div>
        </div>
    </div>
</g:if>
<g:set var="counter_vinculouse" value="0" />
<div id="VU_${counter_vinculouse}">
    <br><g:submitToRemote controller="${controller}" action="add_vinculouse" update="VU_${counter_vinculouse}" value="Adicionar" />
</div>