<%@ page import="linhasdecuidado.Relacoes" %>



<div class="fieldcontain ${hasErrors(bean: relacoesInstance, field: 'area', 'error')} required">
	<label for="area">
		<g:message code="relacoes.area.label" default="Area" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="area" name="area.id" from="${linhasdecuidado.Area.list()}" optionKey="id" required="" value="${relacoesInstance?.area?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: relacoesInstance, field: 'linhadecuidado', 'error')} required">
	<label for="linhadecuidado">
		<g:message code="relacoes.linhadecuidado.label" default="Linhadecuidado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="linhadecuidado" name="linhadecuidado.id" from="${linhasdecuidado.LinhaDeCuidado.list()}" optionKey="id" required="" value="${relacoesInstance?.linhadecuidado?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: relacoesInstance, field: 'subarea', 'error')} required">
	<label for="subarea">
		<g:message code="relacoes.subarea.label" default="Subarea" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subarea" name="subarea.id" from="${linhasdecuidado.SubArea.list()}" optionKey="id" required="" value="${relacoesInstance?.subarea?.id}" class="many-to-one"/>
</div>

