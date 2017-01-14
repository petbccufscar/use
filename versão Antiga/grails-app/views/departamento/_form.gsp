<%@ page import="useweb.Departamento" %>



			<div class="${hasErrors(bean: departamentoInstance, field: 'campus', 'error')} required">
				<label for="campus" class="control-label"><g:message code="departamento.campus.label" default="Campus" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="campus" name="campus.id" from="${useweb.Campus.list()}" optionKey="id" required="" value="${departamentoInstance?.campus?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: departamentoInstance, field: 'campus', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: departamentoInstance, field: 'nome', 'error')} ">
				<label for="nome" class="control-label"><g:message code="departamento.nome.label" default="Nome" /></label>
				<div>
					<g:textField class="form-control" name="nome" value="${departamentoInstance?.nome}"/>
					<span class="help-inline">${hasErrors(bean: departamentoInstance, field: 'nome', 'error')}</span>
				</div>
			</div>

