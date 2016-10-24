<%@ page import="useweb.DocenteExterno" %>
<div class="tabbable"> <!-- Only required for left/right tabs -->
    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab1" data-toggle="tab">Dados Pessoais</a></li>
        <li><a href="#tab2" data-toggle="tab">Email</a></li>
        <li><a href="#tab3" data-toggle="tab">Telefone</a></li>
        <li><a href="#tab4" data-toggle="tab">Endereço</a></li>
        <li><a href="#tab5" data-toggle="tab">Vinculo USE</a></li>
        <li><a href="#tab6" data-toggle="tab">Vinculo Docente Externo</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab1">


            <div class="${hasErrors(bean: docenteExternoInstance, field: 'nome', 'error')} required">
                <label for="nome" class="control-label"><g:message code="docenteExterno.nome.label" default="Nome" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="nome" required="" value="${docenteExternoInstance?.nome}"/>
                    <span class="help-inline">${hasErrors(bean: docenteExternoInstance, field: 'nome', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: docenteExternoInstance, field: 'dataNascimento', 'error')} required">
                <label for="dataNascimento" class="control-label"><g:message code="docenteExterno.dataNascimento.label" default="Data Nascimento" /><span class="required-indicator">*</span></label>
                <div>
                    <g:datePicker name="dataNascimento" precision="day"  value="${docenteExternoInstance?.dataNascimento}"  />
                    <span class="help-inline">${hasErrors(bean: docenteExternoInstance, field: 'dataNascimento', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: docenteExternoInstance, field: 'sexo', 'error')} required">
                <label for="sexo" class="control-label"><g:message code="docenteExterno.sexo.label" default="Sexo" /><span class="required-indicator">*</span></label>
                <div>
                    <g:select class="form-control" name="sexo" from="${docenteExternoInstance.constraints.sexo.inList}" required="" value="${docenteExternoInstance?.sexo}" valueMessagePrefix="docenteExterno.sexo"/>
                    <span class="help-inline">${hasErrors(bean: docenteExternoInstance, field: 'sexo', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: docenteExternoInstance, field: 'cpf', 'error')} required">
                <label for="cpf" class="control-label"><g:message code="docenteExterno.cpf.label" default="Cpf" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="cpf" required="" value="${docenteExternoInstance?.cpf}"/>
                    <span class="help-inline">${hasErrors(bean: docenteExternoInstance, field: 'cpf', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: docenteExternoInstance, field: 'voluntario', 'error')} ">
                <label for="voluntario" class="control-label"><g:message code="docenteExterno.voluntario.label" default="Voluntario" /></label>
                <div>
                    <g:checkBox name="voluntario" value="${docenteExternoInstance?.voluntario}" />
                    <span class="help-inline">${hasErrors(bean: docenteExternoInstance, field: 'voluntario', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: docenteExternoInstance, field: 'cbo', 'error')} required">
                <label for="cbo" class="control-label"><g:message code="docenteExterno.cbo.label" default="Cbo" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="cbo" required="" value="${docenteExternoInstance?.cbo}"/>
                    <span class="help-inline">${hasErrors(bean: docenteExternoInstance, field: 'cbo', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: docenteExternoInstance, field: 'conselhoCategoria', 'error')} required">
                <label for="conselhoCategoria" class="control-label"><g:message code="docenteExterno.conselhoCategoria.label" default="Conselho Categoria" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="conselhoCategoria" maxlength="20" required="" value="${docenteExternoInstance?.conselhoCategoria}"/>
                    <span class="help-inline">${hasErrors(bean: docenteExternoInstance, field: 'conselhoCategoria', 'error')}</span>
                </div>
            </div>





            <div class="${hasErrors(bean: docenteExternoInstance, field: 'login', 'error')} ">
                <label for="login" class="control-label"><g:message code="docenteExterno.login.label" default="Login" /></label>
                <div>
                    <g:textField class="form-control" name="login" value="${docenteExternoInstance?.login}"/>
                    <span class="help-inline">${hasErrors(bean: docenteExternoInstance, field: 'login', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: docenteExternoInstance, field: 'orgaoEmissor', 'error')} ">
                <label for="orgaoEmissor" class="control-label"><g:message code="docenteExterno.orgaoEmissor.label" default="Orgao Emissor" /></label>
                <div>
                    <g:textField class="form-control" name="orgaoEmissor" value="${docenteExternoInstance?.orgaoEmissor}"/>
                    <span class="help-inline">${hasErrors(bean: docenteExternoInstance, field: 'orgaoEmissor', 'error')}</span>
                </div>
            </div>
            <div class="${hasErrors(bean: docenteExternoInstance, field: 'rg', 'error')} ">
                <label for="rg" class="control-label"><g:message code="docenteExterno.rg.label" default="Rg" /></label>
                <div>
                    <g:textField class="form-control" name="rg" value="${docenteExternoInstance?.rg}"/>
                    <span class="help-inline">${hasErrors(bean: docenteExternoInstance, field: 'rg', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: docenteExternoInstance, field: 'senha', 'error')} ">
                <label for="senha" class="control-label"><g:message code="docenteExterno.senha.label" default="Senha" /></label>
                <div>
                    <g:textField class="form-control" name="senha" value="${docenteExternoInstance?.senha}"/>
                    <span class="help-inline">${hasErrors(bean: docenteExternoInstance, field: 'senha', 'error')}</span>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="tab2">
             <!-- Aba de Email -->


             <g:render template="../email" model="[Instance:docenteExternoInstance, controller:'docenteExterno']" />
        </div>
        <div class="tab-pane" id="tab3">
            <!-- Aba de Telefone -->
            <g:render template="../telefone" model="[Instance:docenteExternoInstance, controller:'docenteExterno']" />


        </div>
        <div class="tab-pane" id="tab4">
             <!-- Aba de Endereço -->
            <script type="text/javascript">
                $(document).ready(function(){
                $("#cpf").mask("999.999.999-99");
                $("#cep").mask("99999-999");
                });
            </script>

            <g:render template="../endereco" model="[Instance: docenteExternoInstance]"/>
        </div>

        <div class="tab-pane" id="tab5">
            <!-- Aba de Vinculo Use -->

            <g:render template="../vinculoUSE" model="[Instance:docenteExternoInstance, controller:'docenteExterno']" />


        </div>
        <div class="tab-pane" id="tab6">
            <div class="${hasErrors(bean: docenteExternoInstance, field: 'Origem', 'error')} ">
                <label for="departamento" class="control-label"><g:message code="terceirizado.Origem.label" default="Origem" /></label>
                <div>
                    <g:select class="form-control many-to-one" id="origem" name="origem.id" from="${useweb.Origem.list()}" optionKey="id" required="" value="${docenteExternoInstance?.origem?.id}"/>

                </div>
            </div>
            <div class="${hasErrors(bean: vinculoTerceirizadoInstance, field: 'dataIniciovinculoDocenteExterno', 'error')} required">
                <label for="dataIniciovinculoDocenteExterno" class="control-label">
                    <g:message code="vinculoTerceriziado.dataInicio.label" default="Data Inicio" />
                    <span class="required-indicator">*</span>
                </label>
                <div>
                    <g:datePicker name="dataIniciovinculoDocenteExterno" precision="day"  value="${docenteExternoInstance?.vinculodocenteexterno?.dataInicio}"  />
                    <span class="help-inline">${hasErrors(bean: docenteExternoInstance, field: 'dataIniciovinculotercerizado', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: vinculoTerceirizadoInstance, field: 'dataTerminovinculotercerizado', 'error')} required">
                <label for="dataTerminovinculotercerizado" class="control-label">
                    <g:message code="vinculoTercerizado.dataTermino.label" default="Data Termino" />
                    <span class="required-indicator">*</span>
                </label>
                <div>
                    <g:each in="${docenteExternoInstance?.vinculodocenteexterno}" var="e" status="i">
                        <g:datePicker name="dataTerminovinculoDocenteExterno" precision="day" default="none" noSelection="['':'']" value="${e?.dataFim}" />
                    </g:each>
                    <g:if test="${!docenteExternoInstance?.vinculodocenteexterno}">
                        <g:datePicker name="dataTerminovinculoDocenteExterno" precision="day" default="none" noSelection="['':'']" value="" />
                    </g:if>
                    <span class="help-inline">${hasErrors(bean: docenteExternoInstance, field: 'dataTerminovinculoDocenteExterno', 'error')}</span>
                </div>
            </div>
        </div>
    </div>
</div>