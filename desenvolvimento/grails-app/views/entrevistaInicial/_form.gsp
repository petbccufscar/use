<%@ page import="useweb.EntrevistaInicial" %>



			<div class="${hasErrors(bean: entrevistaInicialInstance, field: 'colaborador', 'error')} ">
				<label for="colaborador" class="control-label"><g:message code="entrevistaInicial.colaborador.label" default="Colaborador" /></label>
				<div>
					<g:select class="form-control" id="colaborador" name="colaborador.id" from="${useweb.Colaborador.list()}" optionKey="id" value="${entrevistaInicialInstance?.colaborador?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: entrevistaInicialInstance, field: 'colaborador', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: entrevistaInicialInstance, field: 'data', 'error')} required">
				<label for="data" class="control-label"><g:message code="entrevistaInicial.data.label" default="Data" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="data" precision="day"  value="${entrevistaInicialInstance?.data}"  />
					<span class="help-inline">${hasErrors(bean: entrevistaInicialInstance, field: 'data', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: entrevistaInicialInstance, field: 'questao', 'error')} ">
				<label for="questao" class="control-label"><g:message code="entrevistaInicial.questao.label" default="Questao" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${entrevistaInicialInstance?.questao?}" var="q">
    <li><g:link controller="questao" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="questao" action="create" params="['entrevistaInicial.id': entrevistaInicialInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'questao.label', default: 'Questao')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: entrevistaInicialInstance, field: 'questao', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: entrevistaInicialInstance, field: 'resposta', 'error')} ">
				<label for="resposta" class="control-label"><g:message code="entrevistaInicial.resposta.label" default="Resposta" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${entrevistaInicialInstance?.resposta?}" var="r">
    <li><g:link controller="resposta" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="resposta" action="create" params="['entrevistaInicial.id': entrevistaInicialInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'resposta.label', default: 'Resposta')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: entrevistaInicialInstance, field: 'resposta', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: entrevistaInicialInstance, field: 'tratamentovigente', 'error')} ">
				<label for="tratamentovigente" class="control-label"><g:message code="entrevistaInicial.tratamentovigente.label" default="Tratamentovigente" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${entrevistaInicialInstance?.tratamentovigente?}" var="t">
    <li><g:link controller="tratamentoVigente" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="tratamentoVigente" action="create" params="['entrevistaInicial.id': entrevistaInicialInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'tratamentoVigente.label', default: 'TratamentoVigente')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: entrevistaInicialInstance, field: 'tratamentovigente', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: entrevistaInicialInstance, field: 'usuario', 'error')} required">
				<label for="usuario" class="control-label"><g:message code="entrevistaInicial.usuario.label" default="Usuario" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="usuario" name="usuario.id" from="${useweb.Usuario.list()}" optionKey="id" required="" value="${entrevistaInicialInstance?.usuario?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: entrevistaInicialInstance, field: 'usuario', 'error')}</span>
				</div>
			</div>

