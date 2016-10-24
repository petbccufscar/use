<%@ page import="useweb.Questao" %>



			<div class="${hasErrors(bean: questaoInstance, field: 'resposta', 'error')} ">
				<label for="resposta" class="control-label"><g:message code="questao.resposta.label" default="Resposta" /></label>
				<div>
					<g:select class="form-control" id="resposta" name="resposta.id" from="${useweb.Resposta.list()}" optionKey="id" value="${questaoInstance?.resposta?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: questaoInstance, field: 'resposta', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: questaoInstance, field: 'entrevistainicial', 'error')} ">
				<label for="entrevistainicial" class="control-label"><g:message code="questao.entrevistainicial.label" default="Entrevistainicial" /></label>
				<div>
					<g:select class="form-control" id="entrevistainicial" name="entrevistainicial.id" from="${useweb.EntrevistaInicial.list()}" optionKey="id" value="${questaoInstance?.entrevistainicial?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: questaoInstance, field: 'entrevistainicial', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: questaoInstance, field: 'texto', 'error')} ">
				<label for="texto" class="control-label"><g:message code="questao.texto.label" default="Texto" /></label>
				<div>
					<g:textField class="form-control" name="texto" value="${questaoInstance?.texto}"/>
					<span class="help-inline">${hasErrors(bean: questaoInstance, field: 'texto', 'error')}</span>
				</div>
			</div>

