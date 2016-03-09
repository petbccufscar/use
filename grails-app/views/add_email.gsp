<div id="E_${counter_email-1}">
    <div class="fieldcontain ${hasErrors(bean: Instance, field: 'emails', 'error')} ">
        <div class="control-group ${hasErrors(bean: Instance?.emails, field: 'email', 'error')} ">
            <label for="email" class="control-label">
                <g:message code="email.email.label" default="Email" />
                <span class="required-indicator">*</span>
            </label> 
            <g:textField name="email" value=""/>
            <g:submitToRemote controller="${controller}" action="delete_email" update="E_${counter_email-1}" value="Deletar" /><br/>
                <span class="help-block">
                <g:eachError bean="${Instance?.emails}" field="email">
                    <g:message error="${Instance?.emails}" encodeAs="HTML" />
                </g:eachError>
            </span>            
        </div>
    </div>
</div>
<g:if test="${add_delete_email == 0}">
<div id="E_${counter_email}">
    <br><g:submitToRemote controller="${controller}" action="add_email" update="E_${counter_email}"  value="Adicionar"/> 
</div>
</g:if>