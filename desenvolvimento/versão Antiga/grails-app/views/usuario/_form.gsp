<%@ page import="useweb.Usuario" %>

<br>
<div class="tabbable"> <!-- Only required for left/right tabs -->
    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab11" data-toggle="tab">Cadastro</a></li>
        <li><a href="#tab21" data-toggle="tab">Triagem</a></li>
        <li><a href="#tab31" data-toggle="tab">Atendimento</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab11">
                    <!-- Aba de cadastro -->

            <div class="tabbable"> <!-- Only required for left/right tabs -->
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab1" data-toggle="tab">Dados Pessoais</a></li>
                    <li><a href="#tab2" data-toggle="tab">Email</a></li>
                    <li><a href="#tab3" data-toggle="tab">Cuidador</a></li>
                    <li><a href="#tab4" data-toggle="tab">Telefone</a></li>
                    <li><a href="#tab5" data-toggle="tab">Endereço</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="tab1">
                            <!-- Aba de Dados pessoais -->
                        <div class="${hasErrors(bean: usuarioInstance, field: 'nome', 'error')} required">
                            <label for="nome" class="control-label"><g:message code="usuario.nome.label" default="Nome" /><span class="required-indicator">*</span></label>
                            <div>
                                <g:textField class="form-control" name="nome" required="" value="${usuarioInstance?.nome}"/>
                                <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'nome', 'error')}</span>
                            </div>
                        </div>

                        <div class="${hasErrors(bean: usuarioInstance, field: 'dataNascimento', 'error')} required">
                            <label for="dataNascimento" class="control-label"><g:message code="usuario.dataNascimento.label" default="Data Nascimento" /><span class="required-indicator">*</span></label>
                            <div>
                                <g:datePicker name="dataNascimento" precision="day"  value="${usuarioInstance?.dataNascimento}"  />
                                <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'dataNascimento', 'error')}</span>
                            </div>
                        </div>

                        <div class="${hasErrors(bean: usuarioInstance, field: 'sexo', 'error')} required">
                            <label for="sexo" class="control-label"><g:message code="usuario.sexo.label" default="Sexo" /><span class="required-indicator">*</span></label>
                            <div>
                                <g:select class="form-control" name="sexo" from="${usuarioInstance.constraints.sexo.inList}" required="" value="${usuarioInstance?.sexo}" valueMessagePrefix="usuario.sexo"/>
                                <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'sexo', 'error')}</span>
                            </div>
                        </div>

                        <div class="${hasErrors(bean: usuarioInstance, field: 'cpf', 'error')} required">
                            <label for="cpf" class="control-label"><g:message code="usuario.cpf.label" default="Cpf" /><span class="required-indicator">*</span></label>
                            <div>
                                <g:textField class="form-control" name="cpf" required="" value="${usuarioInstance?.cpf}"/>
                                <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'cpf', 'error')}</span>
                            </div>
                        </div>

                        <div class="${hasErrors(bean: usuarioInstance, field: 'cns', 'error')} required">
                            <label for="cns" class="control-label"><g:message code="usuario.cns.label" default="Cns" /><span class="required-indicator">*</span></label>
                            <div>
                                <g:textField class="form-control" name="cns" required="" value="${usuarioInstance?.cns}"/>
                                <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'cns', 'error')}</span>
                            </div>
                        </div>

                        <div class="${hasErrors(bean: usuarioInstance, field: 'nomeMae', 'error')} ">
                            <label for="nomeMae" class="control-label"><g:message code="usuario.nomeMae.label" default="Nome Mae" /></label>
                            <div>
                                <g:textField class="form-control" name="nomeMae" value="${usuarioInstance?.nomeMae}"/>
                                <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'nomeMae', 'error')}</span>
                            </div>
                        </div>

                        <div class="${hasErrors(bean: usuarioInstance, field: 'corRaca', 'error')} ">
                            <label for="corRaca" class="control-label"><g:message code="usuario.corRaca.label" default="Cor Raca" /></label>
                            <div>
                                <g:select class="form-control" name="corRaca" from="${usuarioInstance.constraints.corRaca.inList}" value="${usuarioInstance?.corRaca}" valueMessagePrefix="usuario.corRaca" noSelection="['': '']"/>
                                <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'corRaca', 'error')}</span>
                            </div>
                        </div>

                        <div class="${hasErrors(bean: usuarioInstance, field: 'etnia', 'error')} ">
                            <label for="etnia" class="control-label"><g:message code="usuario.etnia.label" default="Etnia" /></label>
                            <div>
                                <g:textField class="form-control" name="etnia" value="${usuarioInstance?.etnia}"/>
                                <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'etnia', 'error')}</span>
                            </div>
                        </div>

                        <div class="${hasErrors(bean: usuarioInstance, field: 'escolaridade', 'error')} ">
                            <label for="escolaridade" class="control-label"><g:message code="usuario.escolaridade.label" default="Escolaridade" /></label>
                            <div>
                                <g:textField class="form-control" name="escolaridade" value="${usuarioInstance?.escolaridade}"/>
                                <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'escolaridade', 'error')}</span>
                            </div>
                        </div>

                        <div class="${hasErrors(bean: usuarioInstance, field: 'profissao', 'error')} ">
                            <label for="profissao" class="control-label"><g:message code="usuario.profissao.label" default="Profissao" /></label>
                            <div>
                                <g:textField class="form-control" name="profissao" value="${usuarioInstance?.profissao}"/>
                                <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'profissao', 'error')}</span>
                            </div>
                        </div>

                        <div class="${hasErrors(bean: usuarioInstance, field: 'statusProfissao', 'error')} ">
                            <label for="statusProfissao" class="control-label"><g:message code="usuario.statusProfissao.label" default="Status Profissao" /></label>
                            <div>
                                <g:select class="form-control" name="statusProfissao" from="${usuarioInstance.constraints.statusProfissao.inList}" value="${usuarioInstance?.statusProfissao}" valueMessagePrefix="usuario.statusProfissao" noSelection="['': '']"/>
                                <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'statusProfissao', 'error')}</span>
                            </div>
                        </div>



                        <div class="${hasErrors(bean: usuarioInstance, field: 'orgaoEmissor', 'error')} ">
                            <label for="orgaoEmissor" class="control-label"><g:message code="usuario.orgaoEmissor.label" default="Orgao Emissor" /></label>
                            <div>
                                <g:textField class="form-control" name="orgaoEmissor" value="${usuarioInstance?.orgaoEmissor}"/>
                                <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'orgaoEmissor', 'error')}</span>
                            </div>
                        </div>



                        <div class="${hasErrors(bean: usuarioInstance, field: 'rg', 'error')} ">
                            <label for="rg" class="control-label"><g:message code="usuario.rg.label" default="Rg" /></label>
                            <div>
                                <g:textField class="form-control" name="rg" value="${usuarioInstance?.rg}"/>
                                <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'rg', 'error')}</span>
                            </div>
                        </div>

                        <div class="${hasErrors(bean: usuarioInstance, field: 'tecnicoadministrativo', 'error')} required">
                            <label for="tecnicoadministrativo" class="control-label"><g:message code="usuario.tecnicoadministrativo.label" default="Tecnicoadministrativo" /><span class="required-indicator">*</span></label>
                            <div>
                                <g:select class="form-control" id="tecnicoadministrativo" name="tecnicoadministrativo.id" from="${useweb.TecnicoAdministrativo.list()}" optionKey="id" required="" value="${usuarioInstance?.tecnicoadministrativo?.id}" class="many-to-one"/>
                                <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'tecnicoadministrativo', 'error')}</span>
                            </div>
                        </div>



                    </div>
                    <div class="tab-pane" id="tab2">
                        <!-- Aba de Email -->

                        <g:set var="counter_email2" value="${-1}" />
                        <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'emails', 'error')} ">
                            <g:each in="${usuarioInstance?.emails}" var="e" status="i">
                                <div class="control-group ${hasErrors(bean: e, field: 'email', 'error')} " id="E_${counter_email2}">
                                    <label for="email" class="control-label">
                                        <g:message code="email.email.label" default="Email" />
                                        <span class="required-indicator">*</span>
                                    </label>
                                    <g:textField id="email_${i}" name="email" value="${e?.email}"/>
                                    <g:submitToRemote url="[controller:'usuario', action:'delete_email']" update="E_${counter_email2}" value="Deletar" /><br/>
                                    <span class="help-block">
                                        <g:eachError bean="${e}" field="email">
                                            <g:message error="${it}" encodeAs="HTML" />
                                        </g:eachError>
                                    </span>        
                                </div>
                            </g:each>
                        </div>
                        <g:if test="${!usuarioInstance?.emails}">
                            <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'emails', 'error')} ">
                                <div class="control-group ${hasErrors(bean: usuarioInstance?.emails, field: 'email', 'error')} " id="E_${counter_email2}">
                                    <label for="email" class="control-label">
                                        <g:message code="email.email.label" default="Email" />
                                        <span class="required-indicator">*</span>
                                    </label>
                                    <g:textField id="email_0" name="email" value="${usuarioInstance?.emails?.email}"/>
                                    <g:submitToRemote url="[controller:'usuario', action:'delete_email']" update="E_${counter_email2}" value="Deletar" /><br/>
                                    <span class="help-block">
                                        <g:eachError bean="${usuarioInstance?.emails}" field="email">
                                            <g:message error="${usuarioInstance?.emails}" encodeAs="HTML" />
                                        </g:eachError>
                                    </span>        
                                </div>
                            </div> 
                        </g:if>

                        <g:set var="counter_email" value="0" />
                        <div id="E_${counter_email}">  
                            <g:submitToRemote url="[controller:'usuario', action:'add_email']" update="E_${counter_email}"  value="Adicionar"/> 
                        </div>


                    </div>
                    <div class="tab-pane" id="tab3">
                        <!-- Aba de cuidador -->

                        <div id="addcuidador">
                            <div class="${hasErrors(bean: usuarioInstance, field: 'cuidador', 'error')} required">
                                <label for="cuidador" class="control-label">
                                    <g:message code="usuario.cuidador.label" default="Cuidador" />
                                    <span class="required-indicator">*</span></label>
                                <div>
                                    <g:select class="form-control" id="cuidador" name="cuidador" from="${useweb.Cuidador.list()}" multiple="true" optionKey="id" required="" value="${usuarioInstance?.cuidador?.id}" class="many-to-one"/>
                                    <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'cuidador', 'error')}</span>
                                </div>
                            </div>
                            <g:set var="theID" value="${cuidador}"/>
                            <br>
                            <g:remoteLink controller="usuario" action="cuidadorrender" update="addcuidador"><input type="button" class="btn" value="Criar Cuidador"/></g:remoteLink>
                            <g:submitToRemote class="btn" url="[controller:'usuario', action:'editcuidador']" update="addcuidador" value="Editar Cuidador"/>
                            <br>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab4">
                      <!-- Aba de Telefone -->
                      

                            <g:set var="counter_telefone2" value="${-1}" />                 
                            <g:each in="${usuarioInstance?.telefones}" var="e" status="i"> 
                                <div id="T_${counter_telefone2}">
                                    <div class="${hasErrors(bean: usuarioInstance, field: 'tipo', 'error')} required">
                                        <label for="tipo" class="control-label"><g:message code="telefone.tipo.label" default="Tipo" /><span class="required-indicator">*</span></label>
                                        <div>
                                            <g:select class="form-control" name="tipo" from="${useweb.Telefone.constraints.tipo.inList}" required="" value="${e?.tipo}" valueMessagePrefix="telefone.tipo"/>
                                            <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'tipo', 'error')}</span>
                                        </div>
                                    </div>

                                    <div class="${hasErrors(bean: usuarioInstance, field: 'codigoArea', 'error')} required">
                                        <label for="codigoArea" class="control-label"><g:message code="telefone.codigoArea.label" default="Codigo Area" /><span class="required-indicator">*</span></label>
                                        <div>
                                            <g:textField class="form-control" name="codArea" required="" value="${e?.codigoArea}"/>
                                            <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'codigoArea', 'error')}</span>
                                        </div>
                                    </div>

                                    <div class="${hasErrors(bean: usuarioInstance, field: 'telefone', 'error')} required">
                                        <label for="telefone" class="control-label"><g:message code="telefone.telefone.label" default="Telefone" /><span class="required-indicator">*</span></label>
                                        <div>
                                            <g:textField class="form-control" name="telefone" required="" value="${e?.telefone}"/>
                                            <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'telefone', 'error')}</span>
                                        </div>
                                    </div>

                                    <div class="${hasErrors(bean: telefoneInstance, field: 'observacao', 'error')} ">
                                        <label for="observacao" class="control-label"><g:message code="telefone.observacao.label" default="Observacao" /></label>
                                        <div>
                                            <g:textField class="form-control" name="observacao" value="${e?.observacao}"/>
                                            <g:submitToRemote url="[controller:'usuario', action:'delete_telefone']" update="T_${counter_telefone2}" value="Deletar" /><br/>
                                            <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'observacao', 'error')}</span>
                                        </div>
                                    </div>
                                </div>
                            </g:each>
                            
                            <g:if test="${!usuarioInstance?.telefones}">
                            <div id="T_${counter_telefone2}">
                                    <div class="${hasErrors(bean: usuarioInstance, field: 'tipo', 'error')} required">
                                        <label for="tipo" class="control-label"><g:message code="telefone.tipo.label" default="Tipo" /><span class="required-indicator">*</span></label>
                                        <div>
                                            <g:select class="form-control" name="tipo" from="${useweb.Telefone.constraints.tipo.inList}" required="" value="${usuarioInstance?.telefones?.tipo}" valueMessagePrefix="telefone.tipo"/>
                                            <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'tipo', 'error')}</span>
                                        </div>
                                    </div>

                                    <div class="${hasErrors(bean: usuarioInstance, field: 'codigoArea', 'error')} required">
                                        <label for="codigoArea" class="control-label"><g:message code="telefone.codigoArea.label" default="Codigo Area" /><span class="required-indicator">*</span></label>
                                        <div>
                                            <g:textField class="form-control" name="codigoArea" required="" value="${usuarioInstance?.telefones?.codigoArea}"/>
                                            <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'codigoArea', 'error')}</span>
                                        </div>
                                    </div>

                                    <div class="${hasErrors(bean: usuarioInstance, field: 'telefone', 'error')} required">
                                        <label for="telefone" class="control-label"><g:message code="telefone.telefone.label" default="Telefone" /><span class="required-indicator">*</span></label>
                                        <div>
                                            <g:textField class="form-control" name="telefone" required="" value="${usuarioInstance?.telefones?.telefone}"/>
                                            <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'telefone', 'error')}</span>
                                        </div>
                                    </div>

                                    <div class="${hasErrors(bean: telefoneInstance, field: 'observacao', 'error')} ">
                                        <label for="observacao" class="control-label"><g:message code="telefone.observacao.label" default="Observacao" /></label>
                                        <div>
                                            <g:textField class="form-control" name="observacao" value="${usuarioInstance?.telefones?.observacao}"/>
                                            <g:submitToRemote url="[controller:'usuario', action:'delete_telefone']" update="T_${counter_telefone2}" value="Deletar" /><br/>
                                            <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'observacao', 'error')}</span>
                                        </div>
                                    </div>
                                </div>
                                </g:if>
                               

                        <g:set var="counter_telefone" value="0" />
                        <div id="T_${counter_telefone}">  
                            <g:submitToRemote url="[controller:'usuario', action:'add_telefone']" update="T_${counter_telefone}"  value="Adicionar"/> 
                        </div>


                    </div>
                    <div class="tab-pane" id="tab5">
                        <!-- Aba de Endereço -->
                        <script type="text/javascript">
                            $(document).ready(function(){
                            $("#cpf").mask("999.999.999-99");
                            $("#cep").mask("99999-999");
                            });
                        </script>    

                        <g:each in="${usuarioInstance?.endereco}" var="e" status="i">
                            <div class="${hasErrors(bean: usuarioInstance, field: 'Cep', 'error')} ">
                                <label for="cep" class="control-label"><g:message code="usuario.cep.label" default="Cep" /><span class="required-indicator">*</span></label>
                                <div>
                                    <g:textField class="form-control" name="cep" id="cep" value="${e?.cep}" />
                                    <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'cep', 'error')}</span>
                                </div>
                            </div>

                            <div class="${hasErrors(bean: usuarioInstance, field: 'tipoLogradouro', 'error')} ">
                                <label for="tipoLogradouro" class="control-label"><g:message code="usuario.tipoLogradouro.label" default="Tipo de Logradouro" /><span class="required-indicator">*</span></label>
                                <div>
                                    <g:textField class="form-control" name="tipoLogradouro" value="${e?.tipoLogradouro}"/>
                                    <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'tipoLogradouro', 'error')}</span>
                                </div>
                            </div>

                            <div class="${hasErrors(bean: usuarioInstance, field: 'logradouro', 'error')} ">
                                <label for="logradouro" class="control-label"><g:message code="usuario.logradouro.label" default="Logradouro" /><span class="required-indicator">*</span></label>
                                <div>
                                    <g:textField class="form-control" name="logradouro" value="${e?.logradouro}"/>
                                    <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'logradouro', 'error')}</span>
                                </div>
                            </div>

                            <div class="${hasErrors(bean: usuarioInstance, field: 'bairro', 'error')} ">
                                <label for="bairro" class="control-label"><g:message code="usuario.bairro.label" default="Bairro" /><span class="required-indicator">*</span></label>
                                <div>
                                    <g:textField class="form-control" name="bairro" value="${e?.bairro}"/>
                                    <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'bairro', 'error')}</span>
                                </div>
                            </div>

                            <div class="${hasErrors(bean: usuarioInstance, field: 'estado', 'error')} ">
                                <label for="estado" class="control-label"><g:message code="usuario.estado.label" default="Estado" /><span class="required-indicator">*</span></label>
                                <div>
                                    <g:textField class="form-control" name="estado" value="${e?.estado}"/>
                                    <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'estado', 'error')}</span>
                                </div>
                            </div>

                            <div class="${hasErrors(bean: usuarioInstance, field: 'cidade', 'error')} ">
                                <label for="cidade" class="control-label"><g:message code="usuario.cidade.label" default="Cidade" /><span class="required-indicator">*</span></label>
                                <div>
                                    <g:textField class="form-control" name="cidade" value="${e?.cidade}"/>
                                    <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'cidade', 'error')}</span>
                                </div>
                            </div>

                            <div class="${hasErrors(bean: usuarioInstance, field: 'numero', 'error')} ">
                                <label for="numero" class="control-label"><g:message code="usuario.numero.label" default="Numero" /><span class="required-indicator">*</span></label>
                                <div>
                                    <g:textField class="form-control" name="numero" value="${e?.numero}"/>
                                    <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'numero', 'error')}</span>
                                </div>
                            </div>

                            <div class="${hasErrors(bean: usuarioInstance, field: 'complemento', 'error')} ">
                                <label for="complemento" class="control-label"><g:message code="usuario.complemento.label" default="Complemento" /><span class="required-indicator">*</span></label>
                                <div>
                                    <g:textField class="form-control" name="complemento" value="${e?.complemento}"/>
                                    <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'complemento', 'error')}</span>
                                </div>
                            </div>
                        </g:each>
                        <g:if test="${!usuarioInstance?.endereco}">
                            <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'cep', 'error')} required">
                                <label for="cep">
                                    <g:message code="endereco.cep.label" default="Cep" />
                                    <span class="required-indicator">*</span>
                                </label>
                                <g:textField class="form-control" name="cep" onblur="${remoteFunction(action: 'addressByCEP', update: [success: 'addressContainer'], params: '\'cep=\' + this.value')}" required="" value="${usuarioInstance?.endereco?.cep}"/>
                            </div>
                            <div id="addressContainer">
                                <g:render template="../busca_endereco"/>
                            </div>
                        </g:if>
                    </div>
                </div>
            </div>


        </div>
        <div class="tab-pane" id="tab21">
            <!-- Aba de Triagem -->
            <div class="${hasErrors(bean: usuarioInstance, field: 'registrousuario', 'error')} ">
                <label for="registrousuario" class="control-label"><g:message code="usuario.registrousuario.label" default="Registrousuario" /></label>
                <div>

                    <ul class="one-to-many">
                        <g:each in="${usuarioInstance?.registrousuario?}" var="r">
                            <li><g:link controller="registroUsuario" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        <li class="add">
                            <g:link controller="registroUsuario" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'registroUsuario.label', default: 'RegistroUsuario')])}</g:link>
                            </li>
                        </ul>

                    <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'registrousuario', 'error')}</span>
                </div>
            </div>
            <div class="${hasErrors(bean: usuarioInstance, field: 'entrevistainicial', 'error')} ">
                <label for="entrevistainicial" class="control-label"><g:message code="usuario.entrevistainicial.label" default="Entrevistainicial" /></label>
                <div>

                    <ul class="one-to-many">
                        <g:each in="${usuarioInstance?.entrevistainicial?}" var="e">
                            <li><g:link controller="entrevistaInicial" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        <li class="add">
                            <g:link controller="entrevistaInicial" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'entrevistaInicial.label', default: 'EntrevistaInicial')])}</g:link>
                            </li>
                        </ul>

                    <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'entrevistainicial', 'error')}</span>
                </div>
            </div>


        </div>
        <div class="tab-pane" id="tab31">
            <!-- Aba de Atendimento -->
            <div class="${hasErrors(bean: usuarioInstance, field: 'atendimentoconsulta', 'error')} ">
                <label for="atendimentoconsulta" class="control-label"><g:message code="usuario.atendimentoconsulta.label" default="Atendimentoconsulta" /></label>
                <div>

                    <ul class="one-to-many">
                        <g:each in="${usuarioInstance?.atendimentoconsulta?}" var="a">
                            <li><g:link controller="atendimentoConsulta" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        <li class="add">
                            <g:link controller="atendimentoConsulta" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'atendimentoConsulta.label', default: 'AtendimentoConsulta')])}</g:link>
                            </li>
                        </ul>

                    <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'atendimentoconsulta', 'error')}</span>
                </div>
            </div>
        </div>
    </div>
</div>
