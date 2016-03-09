<%@ page import="useweb.AlunoInterno" %>
<div class="tabbable"> <!-- Only required for left/right tabs -->
    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab1" data-toggle="tab">Dados Pessoais</a></li>
        <li><a href="#tab2" data-toggle="tab">Email</a></li>
        <li><a href="#tab3" data-toggle="tab">Telefone</a></li>
        <li><a href="#tab4" data-toggle="tab">Endereço</a></li>
        <li><a href="#tab5" data-toggle="tab">Vinculo USE</a></li>
        <li><a href="#tab6" data-toggle="tab">Curso</a></li>
        <li><a href="#tab7" data-toggle="tab">Estagio</a></li>
        <li><a href="#tab8" data-toggle="tab">Periodo de Responsabilidade</a></li>

    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab1">


            <div class="${hasErrors(bean: alunoInternoInstance, field: 'nome', 'error')} required">
                <label for="nome" class="control-label"><g:message code="alunoExterno.nome.label" default="Nome" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="nome" required="" value="${alunoInternoInstance?.nome}"/>
                    <span class="help-inline">${hasErrors(bean: alunoInternoInstance, field: 'nome', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: alunoInternoInstance, field: 'dataNascimento', 'error')} required">
                <label for="dataNascimento" class="control-label"><g:message code="alunoExterno.dataNascimento.label" default="Data Nascimento" /><span class="required-indicator">*</span></label>
                <div>
                    <g:datePicker name="dataNascimento" precision="day"  value="${alunoInternoInstance?.dataNascimento}"  />
                    <span class="help-inline">${hasErrors(bean: alunoInternoInstance, field: 'dataNascimento', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: alunoInternoInstance, field: 'sexo', 'error')} required">
                <label for="sexo" class="control-label"><g:message code="alunoExterno.sexo.label" default="Sexo" /><span class="required-indicator">*</span></label>
                <div>
                    <g:select class="form-control" name="sexo" from="${alunoInternoInstance.constraints.sexo.inList}" required="" value="${alunoInternoInstance?.sexo}" valueMessagePrefix="alunoExterno.sexo"/>
                    <span class="help-inline">${hasErrors(bean: alunoInternoInstance, field: 'sexo', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: alunoInternoInstance, field: 'cpf', 'error')} required">
                <label for="cpf" class="control-label"><g:message code="alunoExterno.cpf.label" default="Cpf" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="cpf" required="" value="${alunoInternoInstance?.cpf}"/>
                    <span class="help-inline">${hasErrors(bean: alunoInternoInstance, field: 'cpf', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: alunoInternoInstance, field: 'voluntario', 'error')} ">
                <label for="voluntario" class="control-label"><g:message code="alunoExterno.voluntario.label" default="Voluntario" /></label>
                <div>
                    <g:checkBox name="voluntario" value="${alunoInternoInstance?.voluntario}" />
                    <span class="help-inline">${hasErrors(bean: alunoInternoInstance, field: 'voluntario', 'error')}</span>
                </div>
            </div>
            <div class="${hasErrors(bean: alunoInternoInstance, field: 'login', 'error')} ">
                <label for="login" class="control-label"><g:message code="alunoExterno.login.label" default="Login" /></label>
                <div>
                    <g:textField class="form-control" name="login" value="${alunoInternoInstance?.login}"/>
                    <span class="help-inline">${hasErrors(bean: alunoInternoInstance, field: 'login', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: alunoInternoInstance, field: 'ra', 'error')} required">
                <label for="ra" class="control-label"><g:message code="alunoInterno.ra.label" default="Ra" /><span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="ra" required="" value="${alunoInternoInstance?.ra}"/>
                    <span class="help-inline">${hasErrors(bean: alunoInternoInstance, field: 'ra', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: alunoInternoInstance, field: 'orgaoEmissor', 'error')} ">
                <label for="orgaoEmissor" class="control-label"><g:message code="alunoExterno.orgaoEmissor.label" default="Orgao Emissor" /></label>
                <div>
                    <g:textField class="form-control" name="orgaoEmissor" value="${alunoInternoInstance?.orgaoEmissor}"/>
                    <span class="help-inline">${hasErrors(bean: alunoInternoInstance, field: 'orgaoEmissor', 'error')}</span>
                </div>
            </div>
            <div class="${hasErrors(bean: alunoInternoInstance, field: 'rg', 'error')} ">
                <label for="rg" class="control-label"><g:message code="alunoExterno.rg.label" default="Rg" /></label>
                <div>
                    <g:textField class="form-control" name="rg" value="${alunoInternoInstance?.rg}"/>
                    <span class="help-inline">${hasErrors(bean: alunoInternoInstance, field: 'rg', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: alunoInternoInstance, field: 'senha', 'error')} ">
                <label for="senha" class="control-label"><g:message code="alunoExterno.senha.label" default="Senha" /></label>
                <div>
                    <g:textField class="form-control" name="senha" value="${alunoInternoInstance?.senha}"/>
                    <span class="help-inline">${hasErrors(bean: alunoInternoInstance, field: 'senha', 'error')}</span>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="tab2">
            <!-- Aba de Email -->
            <g:render template="../email" model="[Instance:alunoInternoInstance, controller:'alunoInterno']" />
        </div>
        <div class="tab-pane" id="tab3">
            <!-- Aba de Telefone -->
            <g:render template="../telefone" model="[Instance:alunoInternoInstance, controller:'alunoInterno']" />
        </div>
        <div class="tab-pane" id="tab4">
             <!-- Aba de Endereço -->
            <script type="text/javascript">
                $(document).ready(function(){
                $("#cpf").mask("999.999.999-99");
                $("#cep").mask("99999-999");
                });
            </script>

            <g:render template="../endereco" model="[Instance: alunoInternoInstance]"/>
        </div>
        <div class="tab-pane" id="tab5">
            <!-- Aba de VinculoUSE -->
            <g:render template="../vinculoUSE" model="[Instance:alunoInternoInstance, controller:'alunoInterno']" />

        </div>
        <div class="tab-pane" id="tab6">
            <div class="${hasErrors(bean: alunoInternoInstance, field: 'curso', 'error')} ">
                <label for="curso" class="control-label"><g:message code="alunoExterno.curso.label" default="Curso" /></label>
                <div>

                    <ul class="one-to-many">
                        <g:each in="${alunoInternoInstance?.curso?}" var="c">
                            <li><g:link controller="curso" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        <li class="add">
                            <g:link controller="curso" action="create" params="['alunoExterno.id': alunoInternoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'curso.label', default: 'Curso')])}</g:link>
                            </li>
                        </ul>

                    <span class="help-inline">${hasErrors(bean: alunoInternoInstance, field: 'curso', 'error')}</span>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="tab7">

            <div class="${hasErrors(bean: alunoInternoInstance, field: 'estagio', 'error')} ">
                <label for="estagio" class="control-label"><g:message code="alunoExterno.estagio.label" default="Estagio" /></label>
                <div>

                    <ul class="one-to-many">
                        <g:each in="${alunoInternoInstance?.estagio?}" var="e">
                            <li><g:link controller="estagio" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        <li class="add">
                            <g:link controller="estagio" action="create" params="['alunoExterno.id': alunoInternoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'estagio.label', default: 'Estagio')])}</g:link>
                            </li>
                        </ul>

                    <span class="help-inline">${hasErrors(bean: alunoInternoInstance, field: 'estagio', 'error')}</span>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="tab8">
            <div class="${hasErrors(bean: alunoInternoInstance, field: 'responsalve', 'error')} required">
                <label for="responsalve" class="control-label"><g:message code="alunoExterno.responsalve.label" default="Responsavel" /><span class="required-indicator">*</span></label>
                <div>
                    <g:select class="form-control" id="responsalve" name="responsalve.id" from="${useweb.Responsavel.list()}" optionKey="id" required="" value="${alunoInternoInstance?.responsalve?.id}" class="many-to-one"/>
                    <span class="help-inline">${hasErrors(bean: alunoInternoInstance, field: 'responsalve', 'error')}</span>
                </div>
            </div>
            <div class="${hasErrors(bean: alunoInternoInstance, field: 'Acao', 'error')} ">
                <label for="departamento" class="control-label"><g:message code="tecnicoAdministrativo.departamento.label" default="Ação" /></label>
                <div>
                    <g:select class="form-control" id="acao" name="acao.id" from="${linhasdecuidado.Acao.list()}" optionKey="id" required="" value="${alunoInternoInstance?.periododeresponsabilidade?.Acao?.id}" class="many-to-one"/>

                </div>
            </div>
            <div class="${hasErrors(bean: PeriodoDeResponsabilidadeInstance, field: 'dataInicioPeriodoDeResponsabilidade', 'error')} required">
                <label for="dataInicioPeriodoDeResponsabilidade" class="control-label">
                    <g:message code="PeriodoDeResponsabilidade.dataInicio.label" default="Data Inicio" />
                    <span class="required-indicator">*</span>
                </label>
                <div>
                    <g:datePicker name="dataInicioPeriodoDeResponsabilidade" precision="day"  value="${alunoInternoInstance?.periododeresponsabilidade?.dataInicio}"  />
                    <span class="help-inline">${hasErrors(bean: alunoInternoInstance, field: 'dataInicioPeriodoDeResponsabilidade', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: PeriodoDeResponsabilidadeInstance, field: 'dataTerminoPeriodoDeResponsabilidade', 'error')} required">
                <label for="dataTerminoPeriodoDeResponsabilidade" class="control-label">
                    <g:message code="PeriodoDeResponsabilidade.dataTermino.label" default="Data Termino" />
                    <span class="required-indicator">*</span>
                </label>
                <div>
                    <g:each in="${alunoInternoInstance?.periododeresponsabilidade}" var="e" status="i">
                        <g:datePicker name="dataTerminoPeriodoDeResponsabilidade" precision="day" default="none" noSelection="['':'']" value="${e?.dataDeTermino}" />
                    </g:each>
                    <g:if test="${!alunoInternoInstance?.periododeresponsabilidade}">
                        <g:datePicker name="dataTerminoPeriodoDeResponsabilidade" precision="day" default="none" noSelection="['':'']" value="" />
                    </g:if>
                    <span class="help-inline">${hasErrors(bean: alunoInternoInstance, field: 'dataTerminoPeriodoDeResponsabilidade', 'error')}</span>
                </div>
            </div>



        </div>
    </div>
</div>
