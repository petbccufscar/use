<%@ page import="useweb.TecnicoAdministrativo" %>

<div class="tabbable"> <!-- Only required for left/right tabs -->
    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab1" data-toggle="tab">Dados Pessoais</a></li>
        <li><a href="#tab2" data-toggle="tab">Email</a></li>
        <li><a href="#tab3" data-toggle="tab">Telefone</a></li>
        <li><a href="#tab4" data-toggle="tab">Endereço</a></li>
        <li><a href="#tab5" data-toggle="tab">Vinculo USE</a></li>
        <li><a href="#tab6" data-toggle="tab">Vinculo TA</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab1">
                 <!-- Aba de Dados pessoais -->
            <div class="${hasErrors(bean: tecnicoAdministrativoInstance, field: 'nome', 'error')} required">
                <label for="nome" class="control-label"><g:message code="tecnicoAdministrativo.nome.label" default="Nome" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="nome" required="" value="${tecnicoAdministrativoInstance?.nome}"/>
                    <span class="help-inline">${hasErrors(bean: tecnicoAdministrativoInstance, field: 'nome', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: tecnicoAdministrativoInstance, field: 'dataNascimento', 'error')} required">
                <label for="dataNascimento" class="control-label"><g:message code="tecnicoAdministrativo.dataNascimento.label" default="Data Nascimento" /><span class="required-indicator">*</span></label>
                <div>
                    <g:datePicker name="dataNascimento" precision="day"  value="${tecnicoAdministrativoInstance?.dataNascimento}"  />
                    <span class="help-inline">${hasErrors(bean: tecnicoAdministrativoInstance, field: 'dataNascimento', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: tecnicoAdministrativoInstance, field: 'sexo', 'error')} required">
                <label for="sexo" class="control-label"><g:message code="tecnicoAdministrativo.sexo.label" default="Sexo" /><span class="required-indicator">*</span></label>
                <div>
                    <g:select class="form-control" name="sexo" from="${tecnicoAdministrativoInstance.constraints.sexo.inList}" required="" value="${tecnicoAdministrativoInstance?.sexo}" valueMessagePrefix="tecnicoAdministrativo.sexo"/>
                    <span class="help-inline">${hasErrors(bean: tecnicoAdministrativoInstance, field: 'sexo', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: tecnicoAdministrativoInstance, field: 'cpf', 'error')} required">
                <label for="cpf" class="control-label"><g:message code="tecnicoAdministrativo.cpf.label" default="Cpf" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="cpf" required="" value="${tecnicoAdministrativoInstance?.cpf}"/>
                    <span class="help-inline">${hasErrors(bean: tecnicoAdministrativoInstance, field: 'cpf', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: tecnicoAdministrativoInstance, field: 'voluntario', 'error')} ">
                <label for="voluntario" class="control-label"><g:message code="tecnicoAdministrativo.voluntario.label" default="Voluntario" /></label>
                <div>
                    <g:checkBox name="voluntario" value="${tecnicoAdministrativoInstance?.voluntario}" />

                    <span class="help-inline">${hasErrors(bean: tecnicoAdministrativoInstance, field: 'voluntario', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: tecnicoAdministrativoInstance, field: 'cargo', 'error')} required">
                <label for="cargo" class="control-label"><g:message code="tecnicoAdministrativo.cargo.label" default="Cargo" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="cargo" required="" value="${tecnicoAdministrativoInstance?.cargo}"/>
                    <span class="help-inline">${hasErrors(bean: tecnicoAdministrativoInstance, field: 'cargo', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: tecnicoAdministrativoInstance, field: 'cbo', 'error')} required">
                <label for="cbo" class="control-label"><g:message code="tecnicoAdministrativo.cbo.label" default="Cbo" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="cbo" required="" value="${tecnicoAdministrativoInstance?.cbo}"/>
                    <span class="help-inline">${hasErrors(bean: tecnicoAdministrativoInstance, field: 'cbo', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: tecnicoAdministrativoInstance, field: 'conselhoCategoria', 'error')} ">
                <label for="conselhoCategoria" class="control-label"><g:message code="tecnicoAdministrativo.conselhoCategoria.label" default="Conselho Categoria" /></label>
                <div>
                    <g:textField class="form-control" name="conselhoCategoria" value="${tecnicoAdministrativoInstance?.conselhoCategoria}"/>
                    <span class="help-inline">${hasErrors(bean: tecnicoAdministrativoInstance, field: 'conselhoCategoria', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: tecnicoAdministrativoInstance, field: 'siape', 'error')} required">
                <label for="siape" class="control-label"><g:message code="tecnicoAdministrativo.siape.label" default="Siape" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="siape" required="" value="${tecnicoAdministrativoInstance?.siape}"/>
                    <span class="help-inline">${hasErrors(bean: tecnicoAdministrativoInstance, field: 'siape', 'error')}</span>
                </div>
            </div>



            <div class="${hasErrors(bean: tecnicoAdministrativoInstance, field: 'login', 'error')} ">
                <label for="login" class="control-label"><g:message code="tecnicoAdministrativo.login.label" default="Login" /></label>
                <div>
                    <g:textField class="form-control" name="login" value="${tecnicoAdministrativoInstance?.login}"/>
                    <span class="help-inline">${hasErrors(bean: tecnicoAdministrativoInstance, field: 'login', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: tecnicoAdministrativoInstance, field: 'orgaoEmissor', 'error')} ">
                <label for="orgaoEmissor" class="control-label"><g:message code="tecnicoAdministrativo.orgaoEmissor.label" default="Orgao Emissor" /></label>
                <div>
                    <g:textField class="form-control" name="orgaoEmissor" value="${tecnicoAdministrativoInstance?.orgaoEmissor}"/>
                    <span class="help-inline">${hasErrors(bean: tecnicoAdministrativoInstance, field: 'orgaoEmissor', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: tecnicoAdministrativoInstance, field: 'rg', 'error')} ">
                <label for="rg" class="control-label"><g:message code="tecnicoAdministrativo.rg.label" default="Rg" /></label>
                <div>
                    <g:textField class="form-control" name="rg" value="${tecnicoAdministrativoInstance?.rg}"/>
                    <span class="help-inline">${hasErrors(bean: tecnicoAdministrativoInstance, field: 'rg', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: tecnicoAdministrativoInstance, field: 'senha', 'error')} ">
                <label for="senha" class="control-label"><g:message code="tecnicoAdministrativo.senha.label" default="Senha" /></label>
                <div>
                    <g:textField class="form-control" name="senha" value="${tecnicoAdministrativoInstance?.senha}"/>
                    <span class="help-inline">${hasErrors(bean: tecnicoAdministrativoInstance, field: 'senha', 'error')}</span>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="tab2">
                        <!-- Aba de Email -->
                <g:render template="../email" model="[Instance:tecnicoAdministrativoInstance, controller:'tecnicoAdministrativo']" />
        </div>
        <div class="tab-pane" id="tab3">
            <!-- Aba de Telefone -->
                <g:render template="../telefone" model="[Instance:tecnicoAdministrativoInstance, controller:'tecnicoAdministrativo']" />


        </div>
        <div class="tab-pane" id="tab4">
             <!-- Aba de Endereço -->
            <script type="text/javascript">
                $(document).ready(function(){
                $("#cpf").mask("999.999.999-99");
                $("#cep").mask("99999-999");
                });
            </script>    

            <g:render template="../endereco" model="[Instance: tecnicoAdministrativoInstance]"/>

        </div>



        <div class="tab-pane" id="tab5">
            <!-- Aba de Vinculo Use -->
            <g:render template="../vinculoUSE" model="[Instance:tecnicoAdministrativoInstance, controller:'tecnicoAdministrativo']" />

        </div>
        <div class="tab-pane" id="tab6">
            <!-- Aba de Vinculo Tecnico Administrativo -->
            <div class="${hasErrors(bean: tecnicoAdministrativoInstance, field: 'departamento', 'error')} ">
                <label for="departamento" class="control-label"><g:message code="tecnicoAdministrativo.departamento.label" default="departamento" /></label>
                <div>
                    <g:select class="form-control many-to-one" id="departamento" name="departamento.id" from="${useweb.Departamento.list()}" optionKey="id" required="" value="${tecnicoAdministrativoInstance?.departamento?.id}" />
                    
                </div>
            </div>
            <div class="${hasErrors(bean: vinculoTAInstance, field: 'dataIniciovinculota', 'error')} required">
                <label for="dataIniciovinculota" class="control-label">
                    <g:message code="vinculoTA.dataInicio.label" default="Data Inicio" />
                    <span class="required-indicator">*</span>
                </label>
                <div>
                    <g:datePicker name="dataIniciovinculota" precision="day"  value="${tecnicoAdministrativoInstance?.vinculota?.dataInicio}"  />
                    <span class="help-inline">${hasErrors(bean: tecnicoAdministrativoInstance, field: 'dataIniciovinculota', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: vinculoTAInstance, field: 'dataTerminovinculota', 'error')} required">
                <label for="dataTerminovinculota" class="control-label">
                    <g:message code="vinculoTA.dataTermino.label" default="Data Termino" />
                    <span class="required-indicator">*</span>
                </label>
                <div>
                    <g:each in="${tecnicoAdministrativoInstance?.vinculota}" var="e" status="i">
                    <g:datePicker name="dataTerminovinculota" precision="day" default="none" noSelection="['':'']" value="${e?.dataTermino}" />
                    </g:each>
                    <g:if test="${!tecnicoAdministrativoInstance?.vinculota}">
                    <g:datePicker name="dataTerminovinculota" precision="day" default="none" noSelection="['':'']" value="" />
                    </g:if>
                    <span class="help-inline">${hasErrors(bean: tecnicoAdministrativoInstance, field: 'dataTerminovinculota', 'error')}</span>
                </div>
            </div>

        </div>
    </div>
</div>
