<div id="E_${counter_email-1}">
    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'emails', 'error')} ">
        <div class="control-group ${hasErrors(bean: usuarioInstance?.emails, field: 'email', 'error')} ">
            <label for="email" class="control-label">
                <g:message code="email.email.label" default="Email" />
                <span class="required-indicator">*</span>
            </label> 
            <g:textField name="email" value=""/>
            <g:submitToRemote url="[controller:'usuario', action:'delete_email']" update="E_${counter_email-1}" value="Deletar" /><br/>
                <span class="help-block">
                <g:eachError bean="${usuarioInstance?.emails}" field="email">
                    <g:message error="${usuarioInstance?.emails}" encodeAs="HTML" />
                </g:eachError>
            </span>            
        </div>
    </div>
</div>
<g:if test="${add_delete_email == 0}">
<div id="E_${counter_email}">
    <br><g:submitToRemote url="[controller:'usuario', action:'add_email']" update="E_${counter_email}"  value="Adicionar"/> 
</div>
</g:if>