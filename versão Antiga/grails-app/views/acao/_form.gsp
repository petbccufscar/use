<%@ page import="linhasdecuidado.Acao" %>



			<div class="${hasErrors(bean: acaoInstance, field: 'nome', 'error')} ">
				<label for="nome" class="control-label"><g:message code="acao.nome.label" default="Nome" /></label>
				<div>
					<g:textField class="form-control" name="nome" value="${acaoInstance?.nome}"/>
					<span class="help-inline">${hasErrors(bean: acaoInstance, field: 'nome', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: acaoInstance, field: 'descricao', 'error')} ">
				<label for="descricao" class="control-label"><g:message code="acao.descricao.label" default="Descricao" /></label>
				<div>
					<g:textField class="form-control" name="descricao" value="${acaoInstance?.descricao}"/>
					<span class="help-inline">${hasErrors(bean: acaoInstance, field: 'descricao', 'error')}</span>
				</div>
			</div>

