<%@ page import="useweb.TratamentoVigente" %>



			<div class="${hasErrors(bean: tratamentoVigenteInstance, field: 'entrevistainicial', 'error')} ">
				<label for="entrevistainicial" class="control-label"><g:message code="tratamentoVigente.entrevistainicial.label" default="Entrevistainicial" /></label>
				<div>
					<g:select class="form-control" id="entrevistainicial" name="entrevistainicial.id" from="${useweb.EntrevistaInicial.list()}" optionKey="id" value="${tratamentoVigenteInstance?.entrevistainicial?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: tratamentoVigenteInstance, field: 'entrevistainicial', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: tratamentoVigenteInstance, field: 'local', 'error')} ">
				<label for="local" class="control-label"><g:message code="tratamentoVigente.local.label" default="Local" /></label>
				<div>
					<g:textField class="form-control" name="local" value="${tratamentoVigenteInstance?.local}"/>
					<span class="help-inline">${hasErrors(bean: tratamentoVigenteInstance, field: 'local', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: tratamentoVigenteInstance, field: 'nome', 'error')} ">
				<label for="nome" class="control-label"><g:message code="tratamentoVigente.nome.label" default="Nome" /></label>
				<div>
					<g:textField class="form-control" name="nome" value="${tratamentoVigenteInstance?.nome}"/>
					<span class="help-inline">${hasErrors(bean: tratamentoVigenteInstance, field: 'nome', 'error')}</span>
				</div>
			</div>

