<%@ page import="linhasdecuidado.SubArea" %>



			<div class="${hasErrors(bean: subAreaInstance, field: 'nome', 'error')} ">
				<label for="nome" class="control-label"><g:message code="subArea.nome.label" default="Nome" /></label>
				<div>
					<g:textField class="form-control" name="nome" value="${subAreaInstance?.nome}"/>
					<span class="help-inline">${hasErrors(bean: subAreaInstance, field: 'nome', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: subAreaInstance, field: 'lcareasubarea', 'error')} ">
				<label for="lcareasubarea" class="control-label"><g:message code="subArea.lcareasubarea.label" default="Lcareasubarea" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${subAreaInstance?.lcareasubarea?}" var="l">
    <li><g:link controller="LCAreaSubArea" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="LCAreaSubArea" action="create" params="['subArea.id': subAreaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'LCAreaSubArea.label', default: 'LCAreaSubArea')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: subAreaInstance, field: 'lcareasubarea', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: subAreaInstance, field: 'relacoes', 'error')} ">
				<label for="relacoes" class="control-label"><g:message code="subArea.relacoes.label" default="Relacoes" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${subAreaInstance?.relacoes?}" var="r">
    <li><g:link controller="relacoes" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="relacoes" action="create" params="['subArea.id': subAreaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'relacoes.label', default: 'Relacoes')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: subAreaInstance, field: 'relacoes', 'error')}</span>
				</div>
			</div>

