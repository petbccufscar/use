<%@ page import="linhasdecuidado.Extensao" %>



			<div class="${hasErrors(bean: extensaoInstance, field: 'nome', 'error')} ">
				<label for="nome" class="control-label"><g:message code="extensao.nome.label" default="Nome" /></label>
				<div>
					<g:textField class="form-control" name="nome" value="${extensaoInstance?.nome}"/>
					<span class="help-inline">${hasErrors(bean: extensaoInstance, field: 'nome', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: extensaoInstance, field: 'descricao', 'error')} ">
				<label for="descricao" class="control-label"><g:message code="extensao.descricao.label" default="Descricao" /></label>
				<div>
					<g:textField class="form-control" name="descricao" value="${extensaoInstance?.descricao}"/>
					<span class="help-inline">${hasErrors(bean: extensaoInstance, field: 'descricao', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: extensaoInstance, field: 'dataDeInicio', 'error')} required">
				<label for="dataDeInicio" class="control-label"><g:message code="extensao.dataDeInicio.label" default="Data De Inicio" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataDeInicio" precision="day"  value="${extensaoInstance?.dataDeInicio}"  />
					<span class="help-inline">${hasErrors(bean: extensaoInstance, field: 'dataDeInicio', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: extensaoInstance, field: 'dataDeTermino', 'error')} required">
				<label for="dataDeTermino" class="control-label"><g:message code="extensao.dataDeTermino.label" default="Data De Termino" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataDeTermino" precision="day"  value="${extensaoInstance?.dataDeTermino}"  />
					<span class="help-inline">${hasErrors(bean: extensaoInstance, field: 'dataDeTermino', 'error')}</span>
				</div>
			</div>

