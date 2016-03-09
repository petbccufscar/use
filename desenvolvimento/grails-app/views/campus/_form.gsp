<%@ page import="useweb.Campus" %>



			<div class="${hasErrors(bean: campusInstance, field: 'nome', 'error')} ">
				<label for="nome" class="control-label"><g:message code="campus.nome.label" default="Nome" /></label>
				<div>
					<g:textField class="form-control" name="nome" value="${campusInstance?.nome}"/>
					<span class="help-inline">${hasErrors(bean: campusInstance, field: 'nome', 'error')}</span>
				</div>
			</div>

