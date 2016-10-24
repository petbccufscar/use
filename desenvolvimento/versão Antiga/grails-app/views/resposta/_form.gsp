<%@ page import="useweb.Resposta" %>



			<div class="${hasErrors(bean: respostaInstance, field: 'entrevistainicial', 'error')} ">
				<label for="entrevistainicial" class="control-label"><g:message code="resposta.entrevistainicial.label" default="Entrevistainicial" /></label>
				<div>
					<g:select class="form-control" id="entrevistainicial" name="entrevistainicial.id" from="${useweb.EntrevistaInicial.list()}" optionKey="id" value="${respostaInstance?.entrevistainicial?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: respostaInstance, field: 'entrevistainicial', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: respostaInstance, field: 'questao', 'error')} required">
				<label for="questao" class="control-label"><g:message code="resposta.questao.label" default="Questao" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="questao" name="questao.id" from="${useweb.Questao.list()}" optionKey="id" required="" value="${respostaInstance?.questao?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: respostaInstance, field: 'questao', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: respostaInstance, field: 'texto', 'error')} ">
				<label for="texto" class="control-label"><g:message code="resposta.texto.label" default="Texto" /></label>
				<div>
					<g:textField class="form-control" name="texto" value="${respostaInstance?.texto}"/>
					<span class="help-inline">${hasErrors(bean: respostaInstance, field: 'texto', 'error')}</span>
				</div>
			</div>

