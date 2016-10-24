
<div class="${hasErrors(bean: usuarioInstance, field: 'cuidador', 'error')} required">
    <label for="cuidador" class="control-label"><g:message code="usuario.cuidador.label" default="Cuidador" /><span class="required-indicator">*</span></label>
    <div>
        
        <g:select class="form-control" id="cuidador" name="cuidador"  from="${useweb.Cuidador.list()}" multiple="true" optionKey="id" required="" value="" class="many-to-one"/>
        <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'cuidador', 'error')}</span>
    </div>
</div>
<br>
<p> Campo Atualizado !! </p>
<br>
<g:remoteLink controller="usuario" action="cuidadorrender" update="addcuidador"><input type="button" class="btn" value="Adicionar Cuidador"/></g:remoteLink>
<g:submitToRemote class="btn" url="[controller:'usuario', action:'editcuidador']" update="addcuidador" value="Editar Cuidador"/>
<br>