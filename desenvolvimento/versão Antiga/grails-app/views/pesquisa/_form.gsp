<%@ page import="linhasdecuidado.Pesquisa" %>



			<div class="${hasErrors(bean: pesquisaInstance, field: 'nome', 'error')} ">
				<label for="nome" class="control-label"><g:message code="pesquisa.nome.label" default="Nome" /></label>
				<div>
					<g:textField class="form-control" name="nome" value="${pesquisaInstance?.nome}"/>
					<span class="help-inline">${hasErrors(bean: pesquisaInstance, field: 'nome', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: pesquisaInstance, field: 'descricao', 'error')} ">
				<label for="descricao" class="control-label"><g:message code="pesquisa.descricao.label" default="Descricao" /></label>
				<div>
					<g:textField class="form-control" name="descricao" value="${pesquisaInstance?.descricao}"/>
					<span class="help-inline">${hasErrors(bean: pesquisaInstance, field: 'descricao', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: pesquisaInstance, field: 'dataDeInicio', 'error')} required">
				<label for="dataDeInicio" class="control-label"><g:message code="pesquisa.dataDeInicio.label" default="Data De Inicio" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataDeInicio" precision="day"  value="${pesquisaInstance?.dataDeInicio}"  />
					<span class="help-inline">${hasErrors(bean: pesquisaInstance, field: 'dataDeInicio', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: pesquisaInstance, field: 'dataDeTermino', 'error')} required">
				<label for="dataDeTermino" class="control-label"><g:message code="pesquisa.dataDeTermino.label" default="Data De Termino" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dataDeTermino" precision="day"  value="${pesquisaInstance?.dataDeTermino}"  />
					<span class="help-inline">${hasErrors(bean: pesquisaInstance, field: 'dataDeTermino', 'error')}</span>
				</div>
			</div>

