<%@ page import="linhasdecuidado.Procedimento" %>



			<div class="${hasErrors(bean: procedimentoInstance, field: 'atendimentoconsulta', 'error')} ">
				<label for="atendimentoconsulta" class="control-label"><g:message code="procedimento.atendimentoconsulta.label" default="Atendimentoconsulta" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${procedimentoInstance?.atendimentoconsulta?}" var="a">
    <li><g:link controller="atendimentoConsulta" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="atendimentoConsulta" action="create" params="['procedimento.id': procedimentoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'atendimentoConsulta.label', default: 'AtendimentoConsulta')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: procedimentoInstance, field: 'atendimentoconsulta', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: procedimentoInstance, field: 'codigo', 'error')} ">
				<label for="codigo" class="control-label"><g:message code="procedimento.codigo.label" default="Codigo" /></label>
				<div>
					<g:textField class="form-control" name="codigo" value="${procedimentoInstance?.codigo}"/>
					<span class="help-inline">${hasErrors(bean: procedimentoInstance, field: 'codigo', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: procedimentoInstance, field: 'lcareasubarea', 'error')} ">
				<label for="lcareasubarea" class="control-label"><g:message code="procedimento.lcareasubarea.label" default="Lcareasubarea" /></label>
				<div>
					<g:select class="form-control" name="lcareasubarea" from="${linhasdecuidado.LCAreaSubArea.list()}" multiple="multiple" optionKey="id" size="5" value="${procedimentoInstance?.lcareasubarea*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: procedimentoInstance, field: 'lcareasubarea', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: procedimentoInstance, field: 'nome', 'error')} ">
				<label for="nome" class="control-label"><g:message code="procedimento.nome.label" default="Nome" /></label>
				<div>
					<g:textField class="form-control" name="nome" value="${procedimentoInstance?.nome}"/>
					<span class="help-inline">${hasErrors(bean: procedimentoInstance, field: 'nome', 'error')}</span>
				</div>
			</div>

