<%@ page import="useweb.DocenteInterno" %>
<div class="tabbable"> <!-- Only required for left/right tabs -->
    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab1" data-toggle="tab">Dados Pessoais</a></li>
        <li><a href="#tab2" data-toggle="tab">Email</a></li>
        <li><a href="#tab3" data-toggle="tab">Telefone</a></li>
        <li><a href="#tab4" data-toggle="tab">Endereço</a></li>
        <li><a href="#tab5" data-toggle="tab">Vinculo USE</a></li>
        <li><a href="#tab6" data-toggle="tab">Vinculo Docente Interno</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab1">


            <div class="${hasErrors(bean: docenteInternoInstance, field: 'nome', 'error')} required">
                <label for="nome" class="control-label"><g:message code="docenteInterno.nome.label" default="Nome" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="nome" required="" value="${docenteInternoInstance?.nome}"/>
                    <span class="help-inline">${hasErrors(bean: docenteInternoInstance, field: 'nome', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: docenteInternoInstance, field: 'dataNascimento', 'error')} required">
                <label for="dataNascimento" class="control-label"><g:message code="docenteInterno.dataNascimento.label" default="Data Nascimento" /><span class="required-indicator">*</span></label>
                <div>
                    <g:datePicker name="dataNascimento" precision="day"  value="${docenteInternoInstance?.dataNascimento}"  />
                    <span class="help-inline">${hasErrors(bean: docenteInternoInstance, field: 'dataNascimento', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: docenteInternoInstance, field: 'sexo', 'error')} required">
                <label for="sexo" class="control-label"><g:message code="docenteInterno.sexo.label" default="Sexo" /><span class="required-indicator">*</span></label>
                <div>
                    <g:select class="form-control" name="sexo" from="${docenteInternoInstance.constraints.sexo.inList}" required="" value="${docenteInternoInstance?.sexo}" valueMessagePrefix="docenteInterno.sexo"/>
                    <span class="help-inline">${hasErrors(bean: docenteInternoInstance, field: 'sexo', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: docenteInternoInstance, field: 'cpf', 'error')} required">
                <label for="cpf" class="control-label"><g:message code="docenteInterno.cpf.label" default="Cpf" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="cpf" required="" value="${docenteInternoInstance?.cpf}"/>
                    <span class="help-inline">${hasErrors(bean: docenteInternoInstance, field: 'cpf', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: docenteInternoInstance, field: 'voluntario', 'error')} ">
                <label for="voluntario" class="control-label"><g:message code="docenteInterno.voluntario.label" default="Voluntario" /></label>
                <div>
                    <g:checkBox name="voluntario" value="${docenteInternoInstance?.voluntario}" />
                    <span class="help-inline">${hasErrors(bean: docenteInternoInstance, field: 'voluntario', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: docenteInternoInstance, field: 'cbo', 'error')} required">
                <label for="cbo" class="control-label"><g:message code="docenteInterno.cbo.label" default="Cbo" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="cbo" required="" value="${docenteInternoInstance?.cbo}"/>
                    <span class="help-inline">${hasErrors(bean: docenteInternoInstance, field: 'cbo', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: docenteInternoInstance, field: 'conselhoCategoria', 'error')} required">
                <label for="conselhoCategoria" class="control-label"><g:message code="docenteInterno.conselhoCategoria.label" default="Conselho Categoria" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="conselhoCategoria" maxlength="20" required="" value="${docenteInternoInstance?.conselhoCategoria}"/>
                    <span class="help-inline">${hasErrors(bean: docenteInternoInstance, field: 'conselhoCategoria', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: docenteInternoInstance, field: 'siape', 'error')} required">
                <label for="siape" class="control-label"><g:message code="docenteInterno.siape.label" default="Siape" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="siape" maxlength="30" required="" value="${docenteInternoInstance?.siape}"/>
                    <span class="help-inline">${hasErrors(bean: docenteInternoInstance, field: 'siape', 'error')}</span>
                </div>
            </div>
            <div class="${hasErrors(bean: docenteInternoInstance, field: 'login', 'error')} ">
                <label for="login" class="control-label"><g:message code="docenteInterno.login.label" default="Login" /></label>
                <div>
                    <g:textField class="form-control" name="login" value="${docenteInternoInstance?.login}"/>
                    <span class="help-inline">${hasErrors(bean: docenteInternoInstance, field: 'login', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: docenteInternoInstance, field: 'orgaoEmissor', 'error')} ">
                <label for="orgaoEmissor" class="control-label"><g:message code="docenteInterno.orgaoEmissor.label" default="Orgao Emissor" /></label>
                <div>
                    <g:textField class="form-control" name="orgaoEmissor" value="${docenteInternoInstance?.orgaoEmissor}"/>
                    <span class="help-inline">${hasErrors(bean: docenteInternoInstance, field: 'orgaoEmissor', 'error')}</span>
                </div>
            </div>
            <div class="${hasErrors(bean: docenteInternoInstance, field: 'rg', 'error')} ">
                <label for="rg" class="control-label"><g:message code="docenteInterno.rg.label" default="Rg" /></label>
                <div>
                    <g:textField class="form-control" name="rg" value="${docenteInternoInstance?.rg}"/>
                    <span class="help-inline">${hasErrors(bean: docenteInternoInstance, field: 'rg', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: docenteInternoInstance, field: 'senha', 'error')} ">
                <label for="senha" class="control-label"><g:message code="docenteInterno.senha.label" default="Senha" /></label>
                <div>
                    <g:textField class="form-control" name="senha" value="${docenteInternoInstance?.senha}"/>
                    <span class="help-inline">${hasErrors(bean: docenteInternoInstance, field: 'senha', 'error')}</span>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="tab2">
            <!-- Aba de Email -->
            <g:render template="../email" model="[Instance:docenteInternoInstance, controller:'docenteInterno']" />
        </div>
        <div class="tab-pane" id="tab3">
            <!-- Aba de Telefone -->
            <g:render template="../telefone" model="[Instance:docenteInternoInstance, controller:'docenteInterno']" />


        </div>
        <div class="tab-pane" id="tab4">
             <!-- Aba de Endereço -->
            <script type="text/javascript">
                $(document).ready(function(){
                $("#cpf").mask("999.999.999-99");
                $("#cep").mask("99999-999");
                });
            </script>

            <g:render template="../endereco" model="[Instance: docenteInternoInstance]"/>
        </div>
        <div class="tab-pane" id="tab5">

            <!-- Aba de Vinculo Use -->

            <g:render template="../vinculoUSE" model="[Instance:docenteInternoInstance, controller:'docenteInterno']" />


        </div>
        <div class="tab-pane" id="tab6">
            <!-- Vinculo Docente Interno -->

            <div class="${hasErrors(bean: docenteInternoInstance, field: 'departamento', 'error')} ">
                <label for="departamento" class="control-label"><g:message code="docenteInterno.departamento.label" default="departamento" /></label>
                <div>
                    <g:select class="form-control many-to-one" id="departamento" name="departamento.id" from="${useweb.Departamento.list()}" optionKey="id" required="" value="${docenteInternoInstance?.departamento?.id}" />

                </div>
            </div>
            <div class="${hasErrors(bean: vinculoDocenteInternoInstance, field: 'dataIniciovinculoDocenteInterno', 'error')} required">
                <label for="dataIniciovinculoDocenteInterno" class="control-label">
                    <g:message code="vinculoDocenteInterno.dataInicio.label" default="Data Inicio" />
                    <span class="required-indicator">*</span>
                </label>
                <div>
                    <g:datePicker name="dataIniciovinculoDocenteInterno" precision="day"  value="${docenteInternoInstance?.vinculodocenteinterno?.dataDeInicio}"  />
                    <span class="help-inline">${hasErrors(bean: docenteInternoInstance, field: 'dataIniciovinculoDocenteInterno', 'error')}</span>
                </div>
            </div>
            <div class="${hasErrors(bean: vinculoDocenteInternoInstance, field: 'dataTerminovinculoDocenteInterno', 'error')} required">
                <label for="dataTerminovinculoDocenteInterno" class="control-label">
                    <g:message code="vinculoDocenteInterno.dataTermino.label" default="Data Termino" />
                    <span class="required-indicator">*</span>
                </label>
                <div>
                    <g:each in="${docenteInternoInstance?.vinculodocenteinterno}" var="e" status="i">
                        <g:datePicker name="dataTerminovinculoDocenteInterno" precision="day" default="none" noSelection="['':'']" value="${e?.datadeTermino}" />
                    </g:each>
                    <g:if test="${!docenteInternoInstance?.vinculodocenteinterno}">
                        <g:datePicker name="dataTerminovinculoDocenteInterno" precision="day" default="none" noSelection="['':'']" value="" />
                    </g:if>
                    <span class="help-inline">${hasErrors(bean: docenteInternoInstance, field: 'dataTerminovinculoDocenteInterno', 'error')}</span>
                </div>
            </div>

        </div>
    </div>
</div>