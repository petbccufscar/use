<!-- sidebar -->
<div class="col-md-3 left_col menu_fixed">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <g:link controller="template" href="#" class="site_title"><span>USE-WEB</span></g:link>
        </div>

        <div class="clearfix"></div>

        <!-- menu profile quick info -->
        <div class="profile">
            <div class="profile_info">
                <span>Bem-vindo,</span>

                <h2>${nome}</h2>
            </div>

            <div class="clearfix"></div>
        </div>
        <!-- /menu profile quick info -->
        <br/>
        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <h3>Funções</h3>

            %{--Se for professor--}%
                <g:if test="${tipo == 'professor'}">
                    <ul class="nav side-menu">
                        <li>
                            <g:link controller="template" action="home_professor"><i
                                    class="fa fa-home"></i>Home</g:link>
                        </li>
                        <li>
                            <g:link controller="template" action="atividades"><i
                                    class="fa fa-edit"></i>Atividades</g:link>
                        </li>
                        <li>
                            <g:link controller="template" action="atendimentoIndividual"><i
                                    class="fa fa-user"></i>Atendimento Individual</g:link>
                        </li>
                        <li>
                            <a><i class="fa fa-users"></i>Atividades em Grupo
                            <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li>
                                    <g:link controller="template" action="atendimentoAGrupo"><i
                                    ></i>Atendimentos Realizados</g:link>
                                </li>
                                <li>
                                    <g:link controller="template" action="atendimentoRGrupo"><i
                                    ></i>Realizar Atendimento</g:link>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <g:link controller="template" action="atendimentosPendentes"><i class="fa fa-book"></i><span
                                    class="badge bg-red pull-right">2</span>Atendimentos Pendentes</g:link>
                        </li>

                        <li>
                            <a><i class="fa fa-list-ul"></i>Listas
                            <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li>
                                    <a>Triagem</a>
                                </li>
                                <li>
                                    <a>Atendimento</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </g:if>

            %{--Se for Aluno--}%
                <g:elseif test="${tipo == 'aluno'}">
                    <ul class="nav side-menu">
                        <li>
                            <g:link controller="template" action="home_aluno"><i class="fa fa-home"></i>Home</g:link>
                        </li>
                        <li>
                            <g:link controller="template" action="atividades"><i
                                    class="fa fa-edit"></i>Atividades</g:link>
                        </li>
                        <li>
                            <g:link controller="template" action="atendimentoIndividual"><i
                                    class="fa fa-user"></i>Atendimento Individual</g:link>
                        </li>
                        <li>
                            <g:link controller="template" action="atendimentoGrupo"><i
                                    class="fa fa-users"></i>Atendimento em Grupo</g:link>
                        </li>
                        <li>
                            <g:link controller="template" action="questoesPendentes"><i class="fa fa-book"></i><span
                                    class="badge bg-red pull-right">2</span>Questões Pendentes</g:link>
                        </li>
                    </ul>
                </g:elseif>
            %{--Se for Terceirizado--}%
                <g:elseif test="${tipo == 'terceirizado'}">
                    <ul class="nav side-menu">
                        <li>
                            <g:link controller="template" action="home_terceirizado" params="[user: 'terceirizado']"><i class="fa fa-home"></i>Home</g:link>
                        </li>
                        <li>
                            <g:link controller="template" action="consultarCadastro"><i
                                    class="fa fa-search"></i>Consultar cadastro</g:link>
                        </li>
                    </ul>
                </g:elseif>
                <g:else>
                    <ul class="nav side-menu">
                        <li>
                            <g:link controller="template" action="home"><i class="fa fa-home"></i>Home</g:link>
                    </ul>
                </g:else>

            </div>
        </div>
        <!-- sidebar menu -->

        <!-- /menu footer buttons -->
        <div class="sidebar-footer hidden-small">
            <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Logout">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
            </a>
        </div>
        <!-- /menu footer buttons -->
    </div>
</div>
<!-- sidebar -->
