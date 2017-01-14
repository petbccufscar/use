<%@ page import="useweb.Origem" %>



			<div class="${hasErrors(bean: origemInstance, field: 'nome', 'error')} ">
				<label for="nome" class="control-label"><g:message code="origem.nome.label" default="Nome" /></label>
				<div>
					<g:textField class="form-control" name="nome" value="${origemInstance?.nome}"/>
					<span class="help-inline">${hasErrors(bean: origemInstance, field: 'nome', 'error')}</span>
				</div>
			</div>

