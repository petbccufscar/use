<div class="">
<!--
    <ul class="nav nav-tabs" data-role="listview" data-split-icon="gear" data-filter="true">

        <g:each status="i" var="c" in="${grailsApplication.controllerClasses.sort { it.logicalPropertyName } }">
            <li class="controller${params.controller == c.logicalPropertyName ? " active" : ""}">
                <g:link controller="${c.logicalPropertyName}" action="index">
                    <g:message code="${c.logicalPropertyName}.label" default="${c.logicalPropertyName.capitalize()}"/>
                </g:link>
            </li>
        </g:each>



    </ul>
-->


    <ul class="nav nav-tabs" data-role="listview" data-split-icon="gear" data-filter="true">
        <g:each status="i" var="c2" in="${["campus","departamento","origem","curso","tipoDeCurso","enderecoConsulta","questao"]}">
            <g:set var="c1" value="${grailsApplication.controllerClasses.find { it.logicalPropertyName == "${c2}" }}" />
            <li class="controller${params.controller == c1.logicalPropertyName ? " active" : ""}">
                <g:link controller="${c1.logicalPropertyName}" action="index">
                    <g:message code="${c1.logicalPropertyName}.label" default="${c1.logicalPropertyName.capitalize()}"/>
                </g:link>
            </li>
        </g:each>
    </ul>
    <ul class="nav nav-tabs" data-role="listview" data-split-icon="gear" data-filter="true">
        <g:each status="i" var="c2" in="${["relacoes","area","subArea","linhaDeCuidado","acao"]}">
            <g:set var="c1" value="${grailsApplication.controllerClasses.find { it.logicalPropertyName == "${c2}" }}" />
            <li class="controller${params.controller == c1.logicalPropertyName ? " active" : ""}">
                <g:link controller="${c1.logicalPropertyName}" action="index">
                    <g:message code="${c1.logicalPropertyName}.label" default="${c1.logicalPropertyName.capitalize()}"/>
                </g:link>
            </li>
        </g:each>
    </ul>
    <ul class="nav nav-tabs" data-role="listview" data-split-icon="gear" data-filter="true">
        <g:each status="i" var="c2" in="${["alunoExterno","alunoInterno","docenteExterno","docenteInterno","tecnicoAdministrativo","preceptor","terceirizado"]}">
            <g:set var="c1" value="${grailsApplication.controllerClasses.find { it.logicalPropertyName == "${c2}" }}" />
            <li class="controller${params.controller == c1.logicalPropertyName ? " active" : ""}">
                <g:link controller="${c1.logicalPropertyName}" action="index">
                    <g:message code="${c1.logicalPropertyName}.label" default="${c1.logicalPropertyName.capitalize()}"/>
                </g:link>
            </li>
        </g:each>

    </ul>
    <ul class="nav nav-tabs" data-role="listview" data-split-icon="gear" data-filter="true">
        <g:each status="i" var="c2" in="${["usuario"]}">
            <g:set var="c1" value="${grailsApplication.controllerClasses.find { it.logicalPropertyName == "${c2}" }}" />
            <li class="controller${params.controller == c1.logicalPropertyName ? " active" : ""}">
                <g:link controller="${c1.logicalPropertyName}" action="index">
                    <g:message code="${c1.logicalPropertyName}.label" default="${c1.logicalPropertyName.capitalize()}"/>
                </g:link>
            </li>
        </g:each>
    </ul>
</div>
