<%@ page import="useweb.Prontuario" %>



			<div class="${hasErrors(bean: prontuarioInstance, field: 'atendimentoconsulta', 'error')} ">
				<label for="atendimentoconsulta" class="control-label"><g:message code="prontuario.atendimentoconsulta.label" default="Atendimentoconsulta" /></label>
				<div>
					<g:select class="form-control" name="atendimentoconsulta" from="${useweb.AtendimentoConsulta.list()}" multiple="multiple" optionKey="id" size="5" value="${prontuarioInstance?.atendimentoconsulta*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: prontuarioInstance, field: 'atendimentoconsulta', 'error')}</span>
				</div>
			</div>

