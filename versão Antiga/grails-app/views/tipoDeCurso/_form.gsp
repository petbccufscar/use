<%@ page import="useweb.TipoDeCurso" %>



			<div class="${hasErrors(bean: tipoDeCursoInstance, field: 'curso', 'error')} ">
				<label for="curso" class="control-label"><g:message code="tipoDeCurso.curso.label" default="Curso" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${tipoDeCursoInstance?.curso?}" var="c">
    <li><g:link controller="curso" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="curso" action="create" params="['tipoDeCurso.id': tipoDeCursoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'curso.label', default: 'Curso')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: tipoDeCursoInstance, field: 'curso', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: tipoDeCursoInstance, field: 'nome', 'error')} ">
				<label for="nome" class="control-label"><g:message code="tipoDeCurso.nome.label" default="Nome" /></label>
				<div>
					<g:textField class="form-control" name="nome" value="${tipoDeCursoInstance?.nome}"/>
					<span class="help-inline">${hasErrors(bean: tipoDeCursoInstance, field: 'nome', 'error')}</span>
				</div>
			</div>

