<%@ page import="linhasdecuidado.Atendimento" %>



			<div class="${hasErrors(bean: atendimentoInstance, field: 'nome', 'error')} ">
				<label for="nome" class="control-label"><g:message code="atendimento.nome.label" default="Nome" /></label>
				<div>
					<g:textField class="form-control" name="nome" value="${atendimentoInstance?.nome}"/>
					<span class="help-inline">${hasErrors(bean: atendimentoInstance, field: 'nome', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: atendimentoInstance, field: 'descricao', 'error')} ">
				<label for="descricao" class="control-label"><g:message code="atendimento.descricao.label" default="Descricao" /></label>
				<div>
					<g:textField class="form-control" name="descricao" value="${atendimentoInstance?.descricao}"/>
					<span class="help-inline">${hasErrors(bean: atendimentoInstance, field: 'descricao', 'error')}</span>
				</div>
			</div>

