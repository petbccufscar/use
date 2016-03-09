<%@ page import="useweb.Preceptor" %>
<div class="tabbable"> <!-- Only required for left/right tabs -->
    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab1" data-toggle="tab">Dados Pessoais</a></li>
        <li><a href="#tab2" data-toggle="tab">Email</a></li>
        <li><a href="#tab3" data-toggle="tab">Telefone</a></li>
        <li><a href="#tab4" data-toggle="tab">Endereço</a></li>
        <li><a href="#tab5" data-toggle="tab">Vinculo USE</a></li>
        <li><a href="#tab6" data-toggle="tab">Vinculo Preceptor</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab1">

            <div class="${hasErrors(bean: preceptorInstance, field: 'nome', 'error')} required">
                <label for="nome" class="control-label"><g:message code="preceptor.nome.label" default="Nome" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="nome" required="" value="${preceptorInstance?.nome}"/>
                    <span class="help-inline">${hasErrors(bean: preceptorInstance, field: 'nome', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: preceptorInstance, field: 'dataNascimento', 'error')} required">
                <label for="dataNascimento" class="control-label"><g:message code="preceptor.dataNascimento.label" default="Data Nascimento" /><span class="required-indicator">*</span></label>
                <div>
                    <g:datePicker name="dataNascimento" precision="day"  value="${preceptorInstance?.dataNascimento}"  />
                    <span class="help-inline">${hasErrors(bean: preceptorInstance, field: 'dataNascimento', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: preceptorInstance, field: 'sexo', 'error')} required">
                <label for="sexo" class="control-label"><g:message code="preceptor.sexo.label" default="Sexo" /><span class="required-indicator">*</span></label>
                <div>
                    <g:select class="form-control" name="sexo" from="${preceptorInstance.constraints.sexo.inList}" required="" value="${preceptorInstance?.sexo}" valueMessagePrefix="preceptor.sexo"/>
                    <span class="help-inline">${hasErrors(bean: preceptorInstance, field: 'sexo', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: preceptorInstance, field: 'cpf', 'error')} required">
                <label for="cpf" class="control-label"><g:message code="preceptor.cpf.label" default="Cpf" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="cpf" required="" value="${preceptorInstance?.cpf}"/>
                    <span class="help-inline">${hasErrors(bean: preceptorInstance, field: 'cpf', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: preceptorInstance, field: 'voluntario', 'error')} ">
                <label for="voluntario" class="control-label"><g:message code="preceptor.voluntario.label" default="Voluntario" /></label>
                <div>
                    <g:checkBox name="voluntario" value="${preceptorInstance?.voluntario}" />
                    <span class="help-inline">${hasErrors(bean: preceptorInstance, field: 'voluntario', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: preceptorInstance, field: 'cbo', 'error')} required">
                <label for="cbo" class="control-label"><g:message code="preceptor.cbo.label" default="Cbo" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="cbo" required="" value="${preceptorInstance?.cbo}"/>
                    <span class="help-inline">${hasErrors(bean: preceptorInstance, field: 'cbo', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: preceptorInstance, field: 'conselhoCategoria', 'error')} required">
                <label for="conselhoCategoria" class="control-label"><g:message code="preceptor.conselhoCategoria.label" default="Conselho Categoria" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="conselhoCategoria" required="" value="${preceptorInstance?.conselhoCategoria}"/>
                    <span class="help-inline">${hasErrors(bean: preceptorInstance, field: 'conselhoCategoria', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: preceptorInstance, field: 'origem', 'error')} required">
                <label for="origem" class="control-label"><g:message code="preceptor.origem.label" default="Origem" /><span class="required-indicator">*</span></label>
                <div>
                    <g:select class="form-control" id="origem" name="origem.id" from="${useweb.Origem.list()}" optionKey="id" required="" value="${preceptorInstance?.origem?.id}" class="many-to-one"/>
                    <span class="help-inline">${hasErrors(bean: preceptorInstance, field: 'origem', 'error')}</span>
                </div>
            </div>


            <div class="${hasErrors(bean: preceptorInstance, field: 'login', 'error')} ">
                <label for="login" class="control-label"><g:message code="preceptor.login.label" default="Login" /></label>
                <div>
                    <g:textField class="form-control" name="login" value="${preceptorInstance?.login}"/>
                    <span class="help-inline">${hasErrors(bean: preceptorInstance, field: 'login', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: preceptorInstance, field: 'orgaoEmissor', 'error')} ">
                <label for="orgaoEmissor" class="control-label"><g:message code="preceptor.orgaoEmissor.label" default="Orgao Emissor" /></label>
                <div>
                    <g:textField class="form-control" name="orgaoEmissor" value="${preceptorInstance?.orgaoEmissor}"/>
                    <span class="help-inline">${hasErrors(bean: preceptorInstance, field: 'orgaoEmissor', 'error')}</span>
                </div>
            </div>
            <div class="${hasErrors(bean: preceptorInstance, field: 'rg', 'error')} ">
                <label for="rg" class="control-label"><g:message code="preceptor.rg.label" default="Rg" /></label>
                <div>
                    <g:textField class="form-control" name="rg" value="${preceptorInstance?.rg}"/>
                    <span class="help-inline">${hasErrors(bean: preceptorInstance, field: 'rg', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: preceptorInstance, field: 'senha', 'error')} ">
                <label for="senha" class="control-label"><g:message code="preceptor.senha.label" default="Senha" /></label>
                <div>
                    <g:textField class="form-control" name="senha" value="${preceptorInstance?.senha}"/>
                    <span class="help-inline">${hasErrors(bean: preceptorInstance, field: 'senha', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: preceptorInstance, field: 'tipoOrigem', 'error')} ">
                <label for="tipoOrigem" class="control-label"><g:message code="preceptor.tipoOrigem.label" default="Tipo Origem" /></label>
                <div>
                    <g:textField class="form-control" name="tipoOrigem" value="${preceptorInstance?.tipoOrigem}"/>
                    <span class="help-inline">${hasErrors(bean: preceptorInstance, field: 'tipoOrigem', 'error')}</span>
                </div>
            </div>

        </div>
        <div class="tab-pane" id="tab2">
            <!-- Aba de Email -->
            <g:render template="../email" model="[Instance:preceptorInstance, controller:'preceptor']" />
        </div>
        <div class="tab-pane" id="tab3">
            <!-- Aba de Telefone -->
            <g:render template="../telefone" model="[Instance:preceptorInstance, controller:'preceptor']" />
        </div>
        <div class="tab-pane" id="tab4">
             <!-- Aba de Endereço -->
            <script type="text/javascript">
                $(document).ready(function(){
                $("#cpf").mask("999.999.999-99");
                $("#cep").mask("99999-999");
                });
            </script>

            <g:render template="../endereco" model="[Instance: preceptorInstance]"/>
        </div>

        <div class="tab-pane" id="tab5">
            <!-- Aba de Vinculo Use -->

            <g:render template="../vinculoUSE" model="[Instance:preceptorInstance, controller:'preceptor']" />
        </div>

        <div class="tab-pane" id="tab6">
            <div class="${hasErrors(bean: preceptorInstance, field: 'departamento', 'error')} ">
                <label for="departamento" class="control-label"><g:message code="tecnicoAdministrativo.departamento.label" default="departamento" /></label>
                <div>
                    <g:select class="form-control" id="departamento" name="departamento.id" from="${useweb.Departamento.list()}" optionKey="id" required="" value="${preceptorInstance?.departamento?.id}" class="many-to-one"/>
                    
                </div>
            </div>
            <div class="${hasErrors(bean: vinculoPreceptorInstance, field: 'dataIniciovinculoPreceptor', 'error')} required">
                <label for="dataIniciovinculoPreceptor" class="control-label">
                    <g:message code="vinculoPreceptor.dataInicio.label" default="Data Inicio" />
                    <span class="required-indicator">*</span>
                </label>
                <div>
                    <g:datePicker name="dataIniciovinculoPreceptor" precision="day"  value="${preceptorInstance?.vinculopreceptor?.dataInicio}"  />
                    <span class="help-inline">${hasErrors(bean: preceptorInstance, field: 'dataIniciovinculoPreceptor', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: vinculoPreceptorInstance, field: 'dataTerminovinculoPreceptor', 'error')} required">
                <label for="dataTerminovinculoPreceptor" class="control-label">
                    <g:message code="vinculoPreceptor.dataTermino.label" default="Data Termino" />
                    <span class="required-indicator">*</span>
                </label>
                <div>
                    <g:each in="${preceptorInstance?.vinculopreceptor}" var="e" status="i">
                    <g:datePicker name="dataTerminovinculoPreceptor" precision="day" default="none" noSelection="['':'']" value="${e?.dataFim}" />
                    </g:each>
                    <g:if test="${!preceptorInstance?.vinculopreceptor}">
                    <g:datePicker name="dataTerminovinculoPreceptor" precision="day" default="none" noSelection="['':'']" value="" />
                    </g:if>
                    <span class="help-inline">${hasErrors(bean: preceptorInstance, field: 'dataTerminovinculoPreceptor', 'error')}</span>
                </div>
            </div>

        </div>
    </div>
</div>