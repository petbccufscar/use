<%@ page import="useweb.TecnicoAdministrativo" %>
<!DOCTYPE html>
<html>

    <head>
        <meta name="layout" content="kickstart" />
        <g:set var="entityName" value="${message(code: 'tecnicoAdministrativo.label', default: 'TecnicoAdministrativo')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
        <g:javascript src="jquery.maskedinput.min.js"/> 
        <g:javascript>
            var JQuery = jQuery.noConflict()
            JQuery(document).ready(function(){
            JQuery("#cpf").mask("999.999.999-99");
            JQuery("#cep").mask("99999-999");
            });
        </g:javascript>

    </head>

    <body>

        <section id="create-tecnicoAdministrativo" class="first">

            <g:hasErrors bean="${tecnicoAdministrativoInstance}">
                <div class="alert alert-danger">
                    <g:renderErrors bean="${tecnicoAdministrativoInstance}" as="list" />
                </div>
            </g:hasErrors>

            <g:form action="save" class="form-horizontal" role="form" >
                <g:render template="form"/>

                <div class="form-actions margin-top-medium">
                    <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
                </div>
            </g:form>

        </section>

    </body>

</html>
