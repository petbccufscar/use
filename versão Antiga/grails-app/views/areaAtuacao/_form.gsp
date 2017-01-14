<%@ page import="useweb.AreaAtuacao" %>



<div class="fieldcontain ${hasErrors(bean: areaAtuacaoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="areaAtuacao.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${areaAtuacaoInstance?.nome}"/>
</div>

