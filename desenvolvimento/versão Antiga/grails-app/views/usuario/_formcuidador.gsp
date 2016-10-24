<%@ page import="useweb.Cuidador" %>
<%@ page import="useweb.Usuario" %>
<div class="tabbable"> <!-- Only required for left/right tabs -->
    <br>
    <ul class="nav nav-tabs">
        <li class="active"><a href="#tabc1" data-toggle="tab">Dados Pessoais</a></li>
        <li><a href="#tabc2" data-toggle="tab">Email</a></li>
        <li><a href="#tabc3" data-toggle="tab">Telefone</a></li>
        <li><a href="#tabc4" data-toggle="tab">Endereço</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tabc1">
        <!-- Aba de Dados pessoais -->
            <div class="${hasErrors(bean: usuarioInstance, field: 'cuidador_nome', 'error')} required">
                <label for="cuidador_nome" class="control-label">
                    <g:message code="usuario.cuidador.nome.label" default="Nome do Cuidador" />
                    <span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="cuidador_nome" required="" value="${cuidadoredit?.nome}"/>
                    <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'cuidador_nome', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: usuarioInstance, field: 'cuidador_dataNascimento', 'error')} required">
                <label for="cuidador_dataNascimento" class="control-label">
                    <g:message code="usuario.cuidador.dataNascimento.label" default="Data Nascimento do Cuidador" />
                    <span class="required-indicator">*</span></label>
                <div>
                    <g:datePicker name="cuidador_dataNascimento" precision="day"  value="${cuidadoredit?.dataNascimento}"  />
                    <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'cuidador_dataNascimento', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: usuarioInstance, field: 'cuidador_sexo', 'error')} required">
                <label for="cuidador_sexo" class="control-label">
                    <g:message code="usuario.cuidador.sexo.label" default="Sexo do Cuidador" />
                    <span class="required-indicator">*</span></label>
                <div>
                    <g:select class="form-control" name="cuidador_sexo" from="${Cuidador.constraints.sexo.inList}" required="" value="${cuidadoredit?.sexo}" valueMessagePrefix="usuario.cuidador.sexo"/>
                    <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'cuidador_sexo', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: usuarioInstance, field: 'cuidador_cpf', 'error')} required">
                <label for="cuidador_cpf" class="control-label">
                    <g:message code="usuario.cuidador.cpf.label" default="Cpf do Cuidador" />
                    <span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="cuidador_cpf" required="" value="${cuidadoredit?.cpf}"/>
                    <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'cuidador_cpf', 'error')}</span>
                </div>
            </div>

            <div class="${hasErrors(bean: usuarioInstance, field: 'cuidador_orgaoEmissor', 'error')} ">
                <label for="cuidador_orgaoEmissor" class="control-label">
                    <g:message code="usuario.cuidador.orgaoEmissor.label" default="Orgao Emissor do Cuidador" /></label>
                <div>
                    <g:textField class="form-control" name="cuidador_orgaoEmissor" value="${cuidadoredit?.orgaoEmissor}"/>
                    <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'cuidador_orgaoEmissor', 'error')}</span>
                </div>
            </div>



            <div class="${hasErrors(bean: usuarioInstance, field: 'cuidador_rg', 'error')} ">
                <label for="cuidador_rg" class="control-label">
                    <g:message code="usuario.cuidador.rg.label" default="Rg do Cuidador" /></label>
                <div>
                    <g:textField class="form-control" name="cuidador_rg" value="${cuidadoredit?.rg}"/>
                    <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'cuidador_rg', 'error')}</span>
                </div>
            </div>
            <div class="${hasErrors(bean: cuidadorInstance, field: 'cuidador_vinculo', 'error')} required">
                <label for="cuidador_vinculo" class="control-label">
                    <g:message code="usuario.cuidador.vinculo.label" default="Vinculo do Cuidador" />
                    <span class="required-indicator">*</span></label>
                <div>
                    <g:select class="form-control" name="cuidador_vinculo" from="${Cuidador.constraints.vinculo.inList}" required="" value="${cuidadoredit?.vinculo}" valueMessagePrefix="usuario.cuidador.vinculo"/>
                    <span class="help-inline">${hasErrors(bean: cuidadorInstance, field: 'cuidador_vinculo', 'error')}</span>
                </div>
            </div>

        </div>
        <div class="tab-pane" id="tabc2">
            <!-- Aba de Email -->
            <script type="text/javascript">
                $(document).ready(function(){
                var appendRow = 
                      '<tr class = "rowc1">' 
                      +     '<td>'
                      +         '<div class="control-group ${hasErrors(bean: usuarioInstance?.emails, field: 'cuidador_emails', 'error')} ">'
                      +             '<label for="cuidador_emails" class="control-label">'
                      +                 '<g:message code="email.email.label" default="Email do Cuidador" />'
                      +                 '<span class="required-indicator">*</span>'
                      +             '</label>'
                      +             '<g:textField class="form-control" id="email_0" name="cuidador_emails" required="" value=""/>'
                      +             '<span class="help-block">'
                      +                 '<g:eachError bean="${usuarioInstance?.emails}" field="email">'
                      +                 '<g:message error="${usuarioInstance?.emails}" encodeAs="HTML" />'
                      +                 '</g:eachError>'
                      +             '</span>' 
                      +             '</div>'
                      +      '</td>' 
                      +      '<td>' 
                      +         '</br>' 
                      +         '<input type="button" class="deleteThisRow btn btn-danger" id="${0}" value="Deletar"/>' 
                      +      '</td>' 
                      + '</tr>'; 

                $('#btnAddMorec').click(function(){
                $('.EmailPessoac tr:last').after(appendRow);
                });

                $('.EmailPessoac').on('click','.deleteThisRow',function(){
                var RowLength = $('.rowc1').length;
                        if(RowLength > 1){
                deleteRow(this);
                }else{
                $('.EmailPessoac tr:last').after(appendRow);
                deleteRow(this);
                }
                });

                function deleteRow(currentNode){
                $(currentNode).parent().parent().remove();
                }
                });
            </script>           

            <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'emails', 'error')} ">


                <table class="EmailPessoac">
                    <g:each in="${cuidadoredit?.emails}" var="e" status="i">

                        <tr class = "rowc1"> 
                            <td>
                                <div class="control-group ${hasErrors(bean: e, field: 'cuidador_emails', 'error')} ">
                                    <label for="cuidador_emails" class="control-label">
                                        <g:message code="email.email.label" default="Email do Cuidador" />
                                        <span class="required-indicator">*</span>
                                    </label>

                                    <g:textField class="form-control" id="email_${i}" name="cuidador_emails" value="${e?.email}"/>
                                    <span class="help-block">
                                        <g:eachError bean="${e}" field="email">
                                            <g:message error="${it}" encodeAs="HTML" />
                                        </g:eachError>
                                    </span>

                                </div></td>


                            <td></br><input type="button" class="deleteThisRow btn btn-danger"  value="Deletar"/></td>
                        </tr>

                    </g:each> 
                </table>

                <g:if test="${!cuidadoredit?.emails}">
                    <table class="EmailPessoac">
                        <tr class = "rowc1">                
                            <td>
                                <div class="control-group ${hasErrors(bean: usuarioInstance, field: 'cuidador_emails', 'error')} ">
                                    <label for="cuidador_emails" class="control-label">
                                        <g:message code="email.email.label" default="Email do Cuidador" />
                                        <span class="required-indicator">*</span>
                                    </label>
                                    <g:textField class="form-control" id="email_0" name="cuidador_emails" required="" value="${cuidadoredit?.emails?.email}"/>
                                    <span class="help-block">
                                        <g:eachError bean="${usuarioIntance}" field="cuidador_emails">
                                            <g:message error="${usuarioInstance}" encodeAs="HTML" />
                                        </g:eachError>
                                    </span> 
                                </div>
                            </td>    
                            <td></br><input type="button" class="deleteThisRow btn btn-danger" id="${0}" value="Deletar" /></td>

                        </tr> 
                    </table>
                </g:if>

                <input type="button" class="btn" id="btnAddMorec"  value="Adicionar Email"/>
            </div>


        </div>
        <div class="tab-pane" id="tabc3">
            <!-- Aba de Telefone -->
            <script type="text/javascript">
                $(document).ready(function(){
                var appendRow = 
                      '<tr class = "rowc2">' 
                      +     '<td>'
                      +         '<div class="control-group ${hasErrors(bean: usuarioInstance?.telefones, field: 'cuidador_telefones', 'error')} ">'
                      +             '<label for="cuidador_telefones" class="control-label">'
                      +                 '<g:message code="telefones.telefone.label" default="Telefone do Cuidador" />'
                      +                 '<span class="required-indicator">:</span>'
                      +             '</label>'
                      +             '<br>'
                      +             '<label for="cuidador_telefones" class="control-label">'
                      +                 '<g:message code="telefones.telefone.label" default="Tipo" />'
                      +                 '<span class="required-indicator">*</span>'
                      +             '</label>'

                      +            '<select class="form-control" name="cuidador_tipo">'
                      +             '<option value="Residencial">Residencial</option>'
                      +             '<option value="Comercial">Comercial</option>'
                      +             '<option value="Celular">Celular</option>'
                      +             '<option value="Recado">Recado</option>'
                      +            '</select>'                     

                      +             '<span class="help-block">'
                      +             '<label for="cuidador_telefones" class="control-label">'
                      +                 '<g:message code="telefones.telefone.label" default="Código de Área" />'
                      +                 '<span class="required-indicator">*</span>'
                      +             '</label>'
                      +             '<g:textField class="form-control" id="codTelefone_0" name="cuidador_codArea" required="" value=""/>'
                      +             '<label for="cuidador_telefones" class="control-label">'
                      +                 '<g:message code="telefones.telefone.label" default="Numero" />'
                      +                 '<span class="required-indicator">*</span>'
                      +             '</label>'
                      +             '<g:textField class="form-control" id="telefone_0" name="cuidador_telefone" required="" value=""/>'
                      +             '<label for="cuidador_telefones" class="control-label">'
                      +                 '<g:message code="telefones.telefone.label" default="Observação" />'
                      +                 '<span class="required-indicator">*</span>'
                      +             '</label>'
                      +             '<g:textField class="form-control" id="obsTelefone_0" name="cuidador_observacao" required="" value=""/>'
                      +             '<span class="help-block">'
                      +                 '<g:eachError bean="${usuarioInstance?.telefones}" field="telefone">'
                      +                 '<g:message error="${usuarioInstance?.telefones}" encodeAs="HTML" />'
                      +                 '</g:eachError>'
                      +             '</span>' 
                      +             '</div>'
                      +      '</td>' 
                      +      '<td>' 
                      +         '</br>' 
                      +         '<input type="button" class="deleteThisRow btn btn-danger" id="${0}" value="Deletar"/>' 
                      +      '</td>' 
                      + '</tr>'; 

                $('#btnAddMoreTelc').click(function(){
                $('.TelefonePessoac tr:last').after(appendRow);
                });

                $('.TelefonePessoac').on('click','.deleteThisRow',function(){
                var RowLength = $('.rowc2').length;
                        if(RowLength > 1){
                deleteRow(this);
                }else{
                $('.TelefonePessoac tr:last').after(appendRow);
                deleteRow(this);
                }
                });

                function deleteRow(currentNode){
                $(currentNode).parent().parent().remove();
                }
                });
            </script>           

            <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'cuidador_telefones', 'error')} ">


                <table class="TelefonePessoac">
                    <g:each in="${cuidadoredit?.telefones}" var="e" status="i">

                        <tr class = "rowc2"> 
                            <td>
                                <div class="control-group ${hasErrors(bean: e, field: 'cuidador_telefone', 'error')} ">
                                    <label for="cuidador_telefone" class="control-label">
                                        <g:message code="telefone.telefone.label" default="Telefone do Cuidador" />
                                        <span class="required-indicator">:</span>
                                    </label>
                                    <br>
                                    <label for="cuidador_telefone" class="control-label">
                                        <g:message code="telefone.telefone.label" default="Tipo" />
                                        <span class="required-indicator">*</span>
                                    </label>
                                    <select class="form-control" name="cuidador_tipo">
                                        <option value="Residencial" <g:if test="${e?.tipo == 'Residencial'}"> selected </g:if>>Residencial</option>
                                        <option value="Comercial" <g:if test="${e?.tipo == 'Comercial'}"> selected </g:if>>Comercial</option>
                                        <option value="Celular" <g:if test="${e?.tipo == 'Celular'}"> selected </g:if>>Celular</option>
                                        <option value="Recado" <g:if test="${e?.tipo == 'Recado'}"> selected </g:if>>Recado</option>
                                        </select>
                                        <label for="cuidador_telefone" class="control-label">
                                        <g:message code="telefone.telefone.label" default="Código de Àrea" />
                                        <span class="required-indicator">*</span>
                                    </label>
                                    <g:textField class="form-control" id="codTelefone_${i}" name="cuidador_codArea" value="${e?.codigoArea}"/>
                                    <label for="cuidador_telefone" class="control-label">
                                        <g:message code="telefone.telefone.label" default="Numero" />
                                        <span class="required-indicator">*</span>
                                    </label>
                                    <g:textField class="form-control" id="telefone_${i}" name="cuidador_telefone" value="${e?.telefone}"/>
                                    <label for="cuidador_telefone" class="control-label">
                                        <g:message code="telefone.telefone.label" default="Observação" />
                                        <span class="required-indicator">*</span>
                                    </label>
                                    <g:textField class="form-control" id="obsTelefone_${i}" name="cuidador_observacao" value="${e?.observacao}"/>

                                    <span class="help-block">
                                        <g:eachError bean="${e}" field="cuidador_telefone">
                                            <g:message error="${it}" encodeAs="HTML" />
                                        </g:eachError>
                                    </span>

                                </div></td>


                            <td></br><input type="button" class="deleteThisRow btn btn-danger"  value="Deletar"/></td>
                        </tr>

                    </g:each> 
                </table>

                <g:if test="${!cuidadoredit?.telefones}">
                    <table class="TelefonePessoac">
                        <tr class = "rowc2">                
                            <td>
                                <div class="control-group ${hasErrors(bean: usuarioInstance, field: 'cuidador_telefone', 'error')} ">
                                    <label for="cuidador_telefones" class="control-label">
                                        <g:message code="telefone.telefone.label" default="Telefone do Cuidador" />
                                        <span class="required-indicator">:</span>
                                    </label>
                                    <br>
                                    <label for="cuidador_telefones" class="control-label">
                                        <g:message code="telefone.telefone.label" default="Tipo" />
                                        <span class="required-indicator">*</span>
                                    </label>
                                    <select class="form-control" name="cuidador_tipo">
                                        <option value="Residencial">Residencial</option>
                                        <option value="Comercial">Comercial</option>
                                        <option value="Celular">Celular</option>
                                        <option value="Recado">Recado</option>
                                    </select>
                                    <label for="cuidador_telefones" class="control-label">
                                        <g:message code="telefone.telefone.label" default="Código de Área" />
                                        <span class="required-indicator">*</span>
                                    </label>
                                    <g:textField class="form-control" id="codTelefone_0" name="cuidador_codArea" value=""/>
                                    <label for="cuidador_telefones" class="control-label">
                                        <g:message code="telefone.telefone.label" default="Numero" />
                                        <span class="required-indicator">*</span>
                                    </label>
                                    <g:textField class="form-control" id="telefone_0" name="cuidador_telefone" value=""/>
                                    <label for="cuidador_telefones" class="control-label">
                                        <g:message code="telefone.telefone.label" default="Observação" />
                                        <span class="required-indicator">*</span>
                                    </label>
                                    <g:textField class="form-control" id="obsTelefone_0" name="cuidador_observacao" value=""/>
                                    <span class="help-block">
                                        <g:eachError bean="${usuarioIntance}" field="cuidador_telefone">
                                            <g:message error="${usuarioInstance}" encodeAs="HTML" />
                                        </g:eachError>
                                    </span> 
                                </div>
                            </td>    
                            <td></br><input type="button" class="deleteThisRow btn btn-danger" id="${0}" value="Deletar" /></td>

                        </tr> 
                    </table>
                </g:if>

                <input type="button" class="btn" id="btnAddMoreTelc"  value="Adicionar Telefone"/>
            </div>                        

        </div>
        <div class="tab-pane" id="tabc4">
            <!-- Aba de Endereço -->
            <script type="text/javascript">
                $(document).ready(function(){
                $("#cuidador_cpf").mask("999.999.999-99");
                $("#cuidador_cep").mask("99999-999");
                });
            </script>    

            <g:each in="${cuidadoredit?.endereco}" var="e" status="i">
                <div class="${hasErrors(bean: usuarioInstance, field: 'cuidador_Cep', 'error')} ">
                    <label for="cuidador_cep" class="control-label">
                        <g:message code="usuario.cuidador.cep.label" default="Cep do Cuidador" /><span class="required-indicator">*</span>
                    </label>
                    <div>
                        <g:textField class="form-control" name="cuidador_cep" id="cep" value="${e?.cep}" />
                        <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'cuidador_cep', 'error')}</span>
                    </div>
                </div>

                <div class="${hasErrors(bean: usuarioInstance, field: 'cuidador_tipoLogradouro', 'error')} ">
                    <label for="cuidador_tipoLogradouro" class="control-label">
                        <g:message code="usuario.cuidador.tipoLogradouro.label" default="Tipo de Logradouro do Cuidador" />
                        <span class="required-indicator">*</span></label>
                    <div>
                        <g:textField class="form-control" name="cuidador_tipoLogradouro" value="${e?.tipoLogradouro}"/>
                        <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'cuidador_tipoLogradouro', 'error')}</span>
                    </div>
                </div>

                <div class="${hasErrors(bean: usuarioInstance, field: 'cuidador_logradouro', 'error')} ">
                    <label for="cuidador_logradouro" class="control-label">
                        <g:message code="usuario.cuidador.logradouro.label" default="Logradouro do Cuidador" />
                        <span class="required-indicator">*</span></label>
                    <div>
                        <g:textField class="form-control" name="cuidador_logradouro" value="${e?.logradouro}"/>
                        <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'cuidador_logradouro', 'error')}</span>
                    </div>
                </div>

                <div class="${hasErrors(bean: usuarioInstance, field: 'cuidador_bairro', 'error')} ">
                    <label for="cuidador_bairro" class="control-label">
                        <g:message code="usuario.cuidador.bairro.label" default="Bairro do Cuidador" />
                        <span class="required-indicator">*</span></label>
                    <div>
                        <g:textField class="form-control" name="cuidador_bairro" value="${e?.bairro}"/>
                        <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'cuidador_bairro', 'error')}</span>
                    </div>
                </div>

                <div class="${hasErrors(bean: usuarioInstance, field: 'cuidador_estado', 'error')} ">
                    <label for="cuidador_estado" class="control-label">
                        <g:message code="usuario.cuidador.estado.label" default="Estado" />
                        <span class="required-indicator">*</span></label>
                    <div>
                        <g:textField class="form-control" name="cuidador_estado" value="${e?.estado}"/>
                        <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'cuidador_estado', 'error')}</span>
                    </div>
                </div>

                <div class="${hasErrors(bean: usuarioInstance, field: 'cuidador_cidade', 'error')} ">
                    <label for="cuidador_cidade" class="control-label">
                    <g:message code="usuario.cuidador.cidade.label" default="Cidade do Cuidador" />
                     <span class="required-indicator">*</span></label>
                    <div>
                        <g:textField class="form-control" name="cuidador_cidade" value="${e?.cidade}"/>
                        <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'cuidador_cidade', 'error')}</span>
                    </div>
                </div>

                <div class="${hasErrors(bean: usuarioInstance, field: 'cuidador_numero', 'error')} ">
                    <label for="cuidador_numero" class="control-label">
                        <g:message code="usuario.cuidador.numero.label" default="Numero do Cuidador" />
                            <span class="required-indicator">*</span></label>
                    <div>
                        <g:textField class="form-control" name="cuidador_numero" value="${e?.numero}"/>
                        <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'cuidador_numero', 'error')}</span>
                    </div>
                </div>

                <div class="${hasErrors(bean: usuarioInstance, field: 'cuidador_complemento', 'error')} ">
                    <label for="cuidador_complemento" class="control-label">
                    <g:message code="usuario.cuidador.complemento.label" default="Complemento do Cuidador" />
                        <span class="required-indicator">*</span></label>
                    <div>
                        <g:textField class="form-control" name="cuidadir_complemento" value="${e?.complemento}"/>
                        <span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'cuidador_complemento', 'error')}</span>
                    </div>
                </div>
            </g:each>
            <g:if test="${!cuidadoredit?.endereco}">
                <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'cuidador_cep', 'error')} required">
                    <label for="cuidador_cep">
                        <g:message code="endereco.cuidador.cep.label" default="Cep do Cuidador" />
                        <span class="required-indicator">*</span>
                    </label>
                    <g:textField class="form-control" name="cuidador_cep" onblur="${remoteFunction(action: 'addressByCEPcuidador', update: [success: 'addressContainercuidador'], params: '\'cuidador_cep=\' + this.value')}" required="" value="${usuarioInstance?.cuidador?.endereco?.cep}"/>
                </div>
                <div id="addressContainercuidador">
                    <g:render template="enderecocuidador"/>
                </div>
            </g:if>

        </div>
    </div>
</div>
<br>
<g:submitToRemote class="btn" url="[controller:'usuario', action:'createcuidador']" update="addcuidador" value="Criar Cuidador"/>
<g:remoteLink controller="usuario" action="cancelcuidador" update="addcuidador"><input type="button" class="btn" value="Cancelar"/></g:remoteLink><br/>
<br>
<br>