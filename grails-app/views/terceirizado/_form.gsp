<%@ page import="useweb.Terceirizado" %>
<div class="tabbable"> <!-- Only required for left/right tabs -->
    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab1" data-toggle="tab">Dados Pessoais</a></li>
        <li><a href="#tab2" data-toggle="tab">Email</a></li>
        <li><a href="#tab3" data-toggle="tab">Telefone</a></li>
        <li><a href="#tab4" data-toggle="tab">Endereço</a></li>
        <li><a href="#tab5" data-toggle="tab">Vinculo USE</a></li>
        <li><a href="#tab6" data-toggle="tab">Vinculo Tercerizado</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab1">
                 <!-- Aba de Dados pessoais -->
            <div class="${hasErrors(bean: terceirizadoInstance, field: 'nome', 'error')} required">
                <label for="nome" class="control-label"><g:message code="terceirizado.nome.label" default="Nome" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="nome" required="" value="${terceirizadoInstance?.nome}"/>
                    <span class="help-inline">${hasErrors(bean: terceirizadoInstance, field: 'nome', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: terceirizadoInstance, field: 'dataNascimento', 'error')} required">
                <label for="dataNascimento" class="control-label"><g:message code="terceirizado.dataNascimento.label" default="Data Nascimento" /><span class="required-indicator">*</span></label>
                <div>
                    <g:datePicker name="dataNascimento" precision="day"  value="${terceirizadoInstance?.dataNascimento}"  />
                    <span class="help-inline">${hasErrors(bean: terceirizadoInstance, field: 'dataNascimento', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: terceirizadoInstance, field: 'sexo', 'error')} required">
                <label for="sexo" class="control-label"><g:message code="terceirizado.sexo.label" default="Sexo" /><span class="required-indicator">*</span></label>
                <div>
                    <g:select class="form-control" name="sexo" from="${terceirizadoInstance.constraints.sexo.inList}" required="" value="${terceirizadoInstance?.sexo}" valueMessagePrefix="terceirizado.sexo"/>
                    <span class="help-inline">${hasErrors(bean: terceirizadoInstance, field: 'sexo', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: terceirizadoInstance, field: 'cpf', 'error')} required">
                <label for="cpf" class="control-label"><g:message code="terceirizado.cpf.label" default="Cpf" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="cpf" required="" value="${terceirizadoInstance?.cpf}"/>
                    <span class="help-inline">${hasErrors(bean: terceirizadoInstance, field: 'cpf', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: terceirizadoInstance, field: 'voluntario', 'error')} ">
                <label for="voluntario" class="control-label"><g:message code="terceirizado.voluntario.label" default="Voluntario" /></label>
                <div>
                    <g:checkBox name="voluntario" value="${terceirizadoInstance?.voluntario}" />
                    <span class="help-inline">${hasErrors(bean: terceirizadoInstance, field: 'voluntario', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: terceirizadoInstance, field: 'codigo', 'error')} ">
                <label for="codigo" class="control-label"><g:message code="terceirizado.codigo.label" default="Codigo" /></label>
                <div>
                    <g:textField class="form-control" name="codigo" value="${terceirizadoInstance?.codigo}"/>
                    <span class="help-inline">${hasErrors(bean: terceirizadoInstance, field: 'codigo', 'error')}</span>
                </div>
            </div>



            <div class="${hasErrors(bean: terceirizadoInstance, field: 'login', 'error')} ">
                <label for="login" class="control-label"><g:message code="terceirizado.login.label" default="Login" /></label>
                <div>
                    <g:textField class="form-control" name="login" value="${terceirizadoInstance?.login}"/>
                    <span class="help-inline">${hasErrors(bean: terceirizadoInstance, field: 'login', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: terceirizadoInstance, field: 'orgaoEmissor', 'error')} ">
                <label for="orgaoEmissor" class="control-label"><g:message code="terceirizado.orgaoEmissor.label" default="Orgao Emissor" /></label>
                <div>
                    <g:textField class="form-control" name="orgaoEmissor" value="${terceirizadoInstance?.orgaoEmissor}"/>
                    <span class="help-inline">${hasErrors(bean: terceirizadoInstance, field: 'orgaoEmissor', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: terceirizadoInstance, field: 'rg', 'error')} ">
                <label for="rg" class="control-label"><g:message code="terceirizado.rg.label" default="Rg" /></label>
                <div>
                    <g:textField class="form-control" name="rg" value="${terceirizadoInstance?.rg}"/>
                    <span class="help-inline">${hasErrors(bean: terceirizadoInstance, field: 'rg', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: terceirizadoInstance, field: 'senha', 'error')} ">
                <label for="senha" class="control-label"><g:message code="terceirizado.senha.label" default="Senha" /></label>
                <div>
                    <g:textField class="form-control" name="senha" value="${terceirizadoInstance?.senha}"/>
                    <span class="help-inline">${hasErrors(bean: terceirizadoInstance, field: 'senha', 'error')}</span>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="tab2">
          <!-- Aba de Email -->
          <g:render template="../email" model="[Instance:terceirizadoInstance, controller:'terceirizado']" />
        </div>
        
        <div class="tab-pane" id="tab3">

            <!-- Aba de Telefone -->
            <g:render template="../telefone" model="[Instance:terceirizadoInstance, controller:'terceirizado']" />
        </div>
        <div class="tab-pane" id="tab4">
             <!-- Aba de Endereço -->
                        <script type="text/javascript">
                            $(document).ready(function(){
                                    $("#cpf").mask("999.999.999-99");
                                    $("#cep").mask("99999-999");
                            });
                        </script>

            <g:render template="../endereco" model="[Instance: terceirizadoInstance]"/>
        </div>
        <div class="tab-pane" id="tab5">
            <!-- Aba de Vinculo Use -->

            <g:render template="../vinculoUSE" model="[Instance:terceirizadoInstance, controller:'terceirizado']" />
        </div>
        
        <div class="tab-pane" id="tab6">
            <!-- Aba de Vinculo Terceirizado -->
            <div class="${hasErrors(bean: terceirizadoInstance, field: 'Origem', 'error')} ">
                <label for="Origem" class="control-label"><g:message code="terceirizado.Origem.label" default="Origem" /></label>
                <div>
                    <g:select class="form-control many-to-one" id="origem" name="origem.id" from="${useweb.Origem.list()}" optionKey="id" required="" value="${terceirizadoInstance?.origem?.id}"/>
                    
                </div>
            </div>
            <div class="${hasErrors(bean: vinculoTerceirizadoInstance, field: 'dataIniciovinculoterceirizado', 'error')} required">
                <label for="dataIniciovinculoterceirizado" class="control-label">
                    <g:message code="vinculoTerceriziado.dataInicio.label" default="Data Inicio" />
                    <span class="required-indicator">*</span>
                </label>
                <div>
                    <g:datePicker name="dataIniciovinculoterceirizado" precision="day"  value="${terceirizadoInstance?.vinculotercerizado?.dataInicio}"  />
                    <span class="help-inline">${hasErrors(bean: terceirizadoInstance, field: 'dataIniciovinculotercerizado', 'error')}</span>
                </div>
            </div>
            
            <div class="${hasErrors(bean: vinculoTerceirizadoInstance, field: 'dataTerminovinculotercerizado', 'error')} required">
                <label for="dataTerminovinculotercerizado" class="control-label">
                    <g:message code="vinculoTercerizado.dataTermino.label" default="Data Termino" />
                    <span class="required-indicator">*</span>
                </label>
                <div>
                    <g:each in="${terceirizadoInstance?.vinculotercerizado}" var="e" status="i">
                    <g:datePicker name="dataTerminovinculoterceirizado" precision="day" default="none" noSelection="['':'']" value="${e?.dataFim}" />
                    </g:each>
                    <g:if test="${!terceirizadoInstance?.vinculotercerizado}">
                    <g:datePicker name="dataTerminovinculoterceirizado" precision="day" default="none" noSelection="['':'']" value="" />
                    </g:if>
                    <span class="help-inline">${hasErrors(bean: terceirizadoInstance, field: 'dataTerminovinculoterceirizado', 'error')}</span>
                </div>
            </div>
            
        </div>
    </div>
</div>