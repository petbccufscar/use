<%@ page import="linhasdecuidado.LCAreaSubArea" %>



			<div class="${hasErrors(bean: LCAreaSubAreaInstance, field: 'linhadecuidadoarea', 'error')} required">
				<label for="linhadecuidadoarea" class="control-label"><g:message code="LCAreaSubArea.linhadecuidadoarea.label" default="Linhadecuidadoarea" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="linhadecuidadoarea" name="linhadecuidadoarea.id" from="${linhasdecuidado.LinhadeCuidadoArea.list()}" optionKey="id" required="" value="${LCAreaSubAreaInstance?.linhadecuidadoarea?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: LCAreaSubAreaInstance, field: 'linhadecuidadoarea', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: LCAreaSubAreaInstance, field: 'subarea', 'error')} required">
				<label for="subarea" class="control-label"><g:message code="LCAreaSubArea.subarea.label" default="Subarea" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="subarea" name="subarea.id" from="${linhasdecuidado.SubArea.list()}" optionKey="id" required="" value="${LCAreaSubAreaInstance?.subarea?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: LCAreaSubAreaInstance, field: 'subarea', 'error')}</span>
				</div>
			</div>

