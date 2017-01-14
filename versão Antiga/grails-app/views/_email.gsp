<g:set var="counter_email2" value="${-1}" />
<div class="fieldcontain ${hasErrors(bean: Instance, field: 'emails', 'error')} ">
    <g:each in="${Instance?.emails}" var="e" status="i">
        <div class="control-group ${hasErrors(bean: e, field: 'email', 'error')} " id="E_${counter_email2-i}">
            <label for="email" class="control-label">
                <g:message code="email.email.label" default="Email" />
                <span class="required-indicator">*</span>
            </label>
            <g:textField id="email_${i}" name="email" value="${e?.email}"/>
            <g:submitToRemote controller="${controller}" action="delete_email" update="E_${counter_email2-i}" value="Deletar" /><br/>
            <span class="help-block">
                <g:eachError bean="${e}" field="email">
                    <g:message error="${it}" encodeAs="HTML" />
                </g:eachError>
            </span>        
        </div>
    </g:each>
</div>
<g:if test="${!Instance?.emails}">
    <div class="fieldcontain ${hasErrors(bean: Instance, field: 'emails', 'error')} ">
        <div class="control-group ${hasErrors(bean: Instance?.emails, field: 'email', 'error')} " id="E_${counter_email2}">
            <label for="email" class="control-label">
                <g:message code="email.email.label" default="Email" />
                <span class="required-indicator">*</span>
            </label>
            <g:textField id="email_0" name="email" value="${Instance?.emails?.email}"/>
            <g:submitToRemote controller="${controller}" action="delete_email" update="E_${counter_email2}" value="Deletar" /><br/>
            <span class="help-block">
                <g:eachError bean="${Instance?.emails}" field="email">
                    <g:message error="${Instance?.emails}" encodeAs="HTML" />
                </g:eachError>
            </span>        
        </div>
    </div> 
</g:if>

<g:set var="counter_email" value="0" />
<div id="E_${counter_email}">  
    <g:submitToRemote controller="${controller}" action="add_email" update="E_${counter_email}"  value="Adicionar"/> 
</div>