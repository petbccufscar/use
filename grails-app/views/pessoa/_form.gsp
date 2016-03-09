<%@ page import="useweb.Pessoa" %>

                    

			<div class="${hasErrors(bean: pessoaInstance, field: 'nome', 'error')} required">
				<label for="nome" class="control-label"><g:message code="pessoa.nome.label" default="Nome" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="nome" required="" value="${pessoaInstance?.nome}"/>
					<span class="help-inline">${hasErrors(bean: pessoaInstance, field: 'nome', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: pessoaInstance, field: 'dataNascimento', 'error')} required">
				<label for="dataNascimento" class="control-label"><g:message code="pessoa.dataNascimento.label" default="Data Nascimento" /><span class="required-indicator">*</span></label>
				<div>
					<g:datePicker name="dataNascimento" precision="day"  value="${pessoaInstance?.dataNascimento}"  />
					<span class="help-inline">${hasErrors(bean: pessoaInstance, field: 'dataNascimento', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: pessoaInstance, field: 'sexo', 'error')} required">
				<label for="sexo" class="control-label"><g:message code="pessoa.sexo.label" default="Sexo" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" name="sexo" from="${pessoaInstance.constraints.sexo.inList}" required="" value="${pessoaInstance?.sexo}" valueMessagePrefix="pessoa.sexo"/>
					<span class="help-inline">${hasErrors(bean: pessoaInstance, field: 'sexo', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: pessoaInstance, field: 'cpf', 'error')} required">
				<label for="cpf" class="control-label"><g:message code="pessoa.cpf.label" default="Cpf" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="cpf" required="" value="${pessoaInstance?.cpf}"/>
					<span class="help-inline">${hasErrors(bean: pessoaInstance, field: 'cpf', 'error')}</span>
				</div>
			</div>

			<div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'emails', 'error')} ">
                            
                           <!-- Campos de e-mail -->
                        
                        <script type="text/javascript">
                    $(document).ready(function(){
                    var appendRow = 
                      '<tr class = "row1">' 
                      +     '<td>'
                      +         '<div class="control-group ${hasErrors(bean: pessoaInstance?.emails, field: 'email', 'error')} ">'
                      +             '<label for="emails" class="control-label">'
                      +                 '<g:message code="email.email.label" default="Email" />'
                      +                 '<span class="required-indicator">*</span>'
                      +             '</label>'
                      +             '<g:textField id="email_0" name="email" required="" value=""/>'
                      +             '<span class="help-block">'
                      +                 '<g:eachError bean="${pessoaInstance?.emails}" field="email">'
                      +                 '<g:message error="${pessoaInstance?.emails}" encodeAs="HTML" />'
                      +                 '</g:eachError>'
                      +             '</span>' 
                      +             '</div>'
                      +      '</td>' 
                      +      '<td>' 
                      +         '</br>' 
                      +         '<input type="button" class="deleteThisRow" id="${0}" value="Deletar"/>' 
                      +      '</td>' 
                      + '</tr>'; 
                    
                    $('#btnAddMore').click(function(){
                        $('.EmailPessoa tr:last').after(appendRow);
                        });
                    
                    $('.EmailPessoa').on('click','.deleteThisRow',function(){
                        var RowLength = $('.row1').length;
                        if(RowLength > 1){
                            deleteRow(this);
                        }else{
                            $('.EmailPessoa tr:last').after(appendRow);
                            deleteRow(this);
                            }
                        });
                    
                    function deleteRow(currentNode){
                        $(currentNode).parent().parent().remove();
                        }
                    });
                </script>     
                        
                        <table class="EmailPessoa">
                            <g:each in="${pessoaInstance?.emails}" var="e" status="i">
                            <tr class = "row1"> 
                                <td>
                                    <div class="control-group ${hasErrors(bean: e, field: 'email', 'error')} ">
                                        <label for="email" class="control-label">
                                            <g:message code="email.email.label" default="Email" />
                                            <span class="required-indicator">*</span>
                                        </label>
          
                                        <g:textField id="email_${i}" name="email" value="${e?.email}"/>
                                        <span class="help-block">
                                        <g:eachError bean="${e}" field="email">
                                            <g:message error="${it}" encodeAs="HTML" />
                                        </g:eachError>
                                        </span>         
                                    </div>
                                </td>
                                <td></br><input type="button" class="deleteThisRow"  value="Deletar"/></td>
                            </tr>
                        </g:each> 
                        </table>
               
                    <g:if test="${!pessoaInstance?.emails}">
                        <table class="EmailPessoa">
                                <tr class = "row1">                
                                    <td>
                                        <div class="control-group ${hasErrors(bean: pessoaInstance, field: 'email', 'error')} ">
                                            <label for="emails" class="control-label">
                                                <g:message code="email.email.label" default="Email" />
                                                <span class="required-indicator">*</span>
                                            </label>
                                            <g:textField class="form-control" id="email_0" name="email" required="" value="${pessoaInstance?.emails}"/>
                                            <span class="help-block">
                                            <g:eachError bean="${pessoaIntance}" field="email">
                                                <g:message error="${pessoaInstance}" encodeAs="HTML" />
                                            </g:eachError>
                                            </span> 
                                        </div>
                                    </td>    
                                    <td></br><input type="button" class="deleteThisRow" id="${0}" value="Deletar" /></td>
                                    
                                </tr> 
                        </table>
                    </g:if>
                            
                    <input type="button" class="btn" id="btnAddMore"  value="Adicionar Email"/>
                    </div>

			<div class="${hasErrors(bean: pessoaInstance, field: 'endereco', 'error')} ">
				<label for="endereco" class="control-label"><g:message code="pessoa.endereco.label" default="Endereco" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${pessoaInstance?.endereco?}" var="e">
    <li><g:link controller="endereco" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="endereco" action="create" params="['pessoa.id': pessoaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'endereco.label', default: 'Endereco')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: pessoaInstance, field: 'endereco', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: pessoaInstance, field: 'orgaoEmissor', 'error')} ">
				<label for="orgaoEmissor" class="control-label"><g:message code="pessoa.orgaoEmissor.label" default="Orgao Emissor" /></label>
				<div>
					<g:textField class="form-control" name="orgaoEmissor" value="${pessoaInstance?.orgaoEmissor}"/>
					<span class="help-inline">${hasErrors(bean: pessoaInstance, field: 'orgaoEmissor', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: pessoaInstance, field: 'rg', 'error')} ">
				<label for="rg" class="control-label"><g:message code="pessoa.rg.label" default="Rg" /></label>
				<div>
					<g:textField class="form-control" name="rg" value="${pessoaInstance?.rg}"/>
					<span class="help-inline">${hasErrors(bean: pessoaInstance, field: 'rg', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: pessoaInstance, field: 'telefones', 'error')} ">
				<label for="telefones" class="control-label"><g:message code="pessoa.telefones.label" default="Telefones" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${pessoaInstance?.telefones?}" var="t">
    <li><g:link controller="telefone" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="telefone" action="create" params="['pessoa.id': pessoaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefone.label', default: 'Telefone')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: pessoaInstance, field: 'telefones', 'error')}</span>
				</div>
			</div>

