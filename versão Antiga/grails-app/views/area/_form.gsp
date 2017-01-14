<%@ page import="linhasdecuidado.Area" %>



			<div class="${hasErrors(bean: areaInstance, field: 'nome', 'error')} ">
				<label for="nome" class="control-label"><g:message code="area.nome.label" default="Nome" /></label>
				<div>
					<g:textField class="form-control" name="nome" value="${areaInstance?.nome}"/>
					<span class="help-inline">${hasErrors(bean: areaInstance, field: 'nome', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: areaInstance, field: 'linhadecuidadoarea', 'error')} ">
				<label for="linhadecuidadoarea" class="control-label"><g:message code="area.linhadecuidadoarea.label" default="Linhadecuidadoarea" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${areaInstance?.linhadecuidadoarea?}" var="l">
    <li><g:link controller="linhadeCuidadoArea" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="linhadeCuidadoArea" action="create" params="['area.id': areaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'linhadeCuidadoArea.label', default: 'LinhadeCuidadoArea')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: areaInstance, field: 'linhadecuidadoarea', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: areaInstance, field: 'relacoes', 'error')} ">
				<label for="relacoes" class="control-label"><g:message code="area.relacoes.label" default="Relacoes" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${areaInstance?.relacoes?}" var="r">
    <li><g:link controller="relacoes" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="relacoes" action="create" params="['area.id': areaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'relacoes.label', default: 'Relacoes')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: areaInstance, field: 'relacoes', 'error')}</span>
				</div>
			</div>

