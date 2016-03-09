<%@ page import="linhasdecuidado.LCAreaSubAreaAcao" %>



			<div class="${hasErrors(bean: LCAreaSubAreaAcaoInstance, field: 'acao', 'error')} required">
				<label for="acao" class="control-label"><g:message code="LCAreaSubAreaAcao.acao.label" default="Acao" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="acao" name="acao.id" from="${linhasdecuidado.Acao.list()}" optionKey="id" required="" value="${LCAreaSubAreaAcaoInstance?.acao?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: LCAreaSubAreaAcaoInstance, field: 'acao', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: LCAreaSubAreaAcaoInstance, field: 'lcareasubarea', 'error')} required">
				<label for="lcareasubarea" class="control-label"><g:message code="LCAreaSubAreaAcao.lcareasubarea.label" default="Lcareasubarea" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="lcareasubarea" name="lcareasubarea.id" from="${linhasdecuidado.LCAreaSubArea.list()}" optionKey="id" required="" value="${LCAreaSubAreaAcaoInstance?.lcareasubarea?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: LCAreaSubAreaAcaoInstance, field: 'lcareasubarea', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: LCAreaSubAreaAcaoInstance, field: 'registrousuario', 'error')} ">
				<label for="registrousuario" class="control-label"><g:message code="LCAreaSubAreaAcao.registrousuario.label" default="Registrousuario" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${LCAreaSubAreaAcaoInstance?.registrousuario?}" var="r">
    <li><g:link controller="registroUsuario" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="registroUsuario" action="create" params="['LCAreaSubAreaAcao.id': LCAreaSubAreaAcaoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'registroUsuario.label', default: 'RegistroUsuario')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: LCAreaSubAreaAcaoInstance, field: 'registrousuario', 'error')}</span>
				</div>
			</div>

