<%@ page import="useweb.Curso" %>



			<div class="${hasErrors(bean: cursoInstance, field: 'aluno', 'error')} ">
				<label for="aluno" class="control-label"><g:message code="curso.aluno.label" default="Aluno" /></label>
				<div>
					<g:select class="form-control" id="aluno" name="aluno.id" from="${useweb.Aluno.list()}" optionKey="id" value="${cursoInstance?.aluno?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: cursoInstance, field: 'aluno', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: cursoInstance, field: 'nome', 'error')} ">
				<label for="nome" class="control-label"><g:message code="curso.nome.label" default="Nome" /></label>
				<div>
					<g:textField class="form-control" name="nome" value="${cursoInstance?.nome}"/>
					<span class="help-inline">${hasErrors(bean: cursoInstance, field: 'nome', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: cursoInstance, field: 'tipodecurso', 'error')} required">
				<label for="tipodecurso" class="control-label"><g:message code="curso.tipodecurso.label" default="Tipodecurso" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="tipodecurso" name="tipodecurso.id" from="${useweb.TipoDeCurso.list()}" optionKey="id" required="" value="${cursoInstance?.tipodecurso?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: cursoInstance, field: 'tipodecurso', 'error')}</span>
				</div>
			</div>

