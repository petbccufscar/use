<%@ page import="linhasdecuidado.LinhadeCuidadoArea" %>



			<div class="${hasErrors(bean: linhadeCuidadoAreaInstance, field: 'area', 'error')} required">
				<label for="area" class="control-label"><g:message code="linhadeCuidadoArea.area.label" default="Area" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="area" name="area.id" from="${linhasdecuidado.Area.list()}" optionKey="id" required="" value="${linhadeCuidadoAreaInstance?.area?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: linhadeCuidadoAreaInstance, field: 'area', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: linhadeCuidadoAreaInstance, field: 'lcareasubarea', 'error')} ">
				<label for="lcareasubarea" class="control-label"><g:message code="linhadeCuidadoArea.lcareasubarea.label" default="Lcareasubarea" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${linhadeCuidadoAreaInstance?.lcareasubarea?}" var="l">
    <li><g:link controller="LCAreaSubArea" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="LCAreaSubArea" action="create" params="['linhadeCuidadoArea.id': linhadeCuidadoAreaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'LCAreaSubArea.label', default: 'LCAreaSubArea')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: linhadeCuidadoAreaInstance, field: 'lcareasubarea', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: linhadeCuidadoAreaInstance, field: 'linhadecuidado', 'error')} required">
				<label for="linhadecuidado" class="control-label"><g:message code="linhadeCuidadoArea.linhadecuidado.label" default="Linhadecuidado" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="linhadecuidado" name="linhadecuidado.id" from="${linhasdecuidado.LinhaDeCuidado.list()}" optionKey="id" required="" value="${linhadeCuidadoAreaInstance?.linhadecuidado?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: linhadeCuidadoAreaInstance, field: 'linhadecuidado', 'error')}</span>
				</div>
			</div>

