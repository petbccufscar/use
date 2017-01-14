<%@ page import="linhasdecuidado.LinhaDeCuidado" %>



			<div class="${hasErrors(bean: linhaDeCuidadoInstance, field: 'linhadecuidadoarea', 'error')} ">
				<label for="linhadecuidadoarea" class="control-label"><g:message code="linhaDeCuidado.linhadecuidadoarea.label" default="Linhadecuidadoarea" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${linhaDeCuidadoInstance?.linhadecuidadoarea?}" var="l">
    <li><g:link controller="linhadeCuidadoArea" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="linhadeCuidadoArea" action="create" params="['linhaDeCuidado.id': linhaDeCuidadoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'linhadeCuidadoArea.label', default: 'LinhadeCuidadoArea')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: linhaDeCuidadoInstance, field: 'linhadecuidadoarea', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: linhaDeCuidadoInstance, field: 'nome', 'error')} ">
				<label for="nome" class="control-label"><g:message code="linhaDeCuidado.nome.label" default="Nome" /></label>
				<div>
					<g:textField class="form-control" name="nome" value="${linhaDeCuidadoInstance?.nome}"/>
					<span class="help-inline">${hasErrors(bean: linhaDeCuidadoInstance, field: 'nome', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: linhaDeCuidadoInstance, field: 'relacoes', 'error')} ">
				<label for="relacoes" class="control-label"><g:message code="linhaDeCuidado.relacoes.label" default="Relacoes" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${linhaDeCuidadoInstance?.relacoes?}" var="r">
    <li><g:link controller="relacoes" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="relacoes" action="create" params="['linhaDeCuidado.id': linhaDeCuidadoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'relacoes.label', default: 'Relacoes')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: linhaDeCuidadoInstance, field: 'relacoes', 'error')}</span>
				</div>
			</div>

