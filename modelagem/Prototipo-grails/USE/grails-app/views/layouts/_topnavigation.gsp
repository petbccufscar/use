
<!-- top navigation -->
<div class="top_nav">
    <div class="nav_menu">
        <nav>
            <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>

            <ul class="nav navbar-nav navbar-right">
                <li class="">
                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <asset:image src="user.png" alt="Foto de Perfil"/>
                        <span class="fa fa-angle-down"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                        <li><g:link controller="template" action="dadosCadastrais">Dados Cadastrais</g:link></li>
                        <li><a href="#">Ajuda</a></li>
                        <li><g:link controller="template" action="login"><i class="fa fa-sign-out pull-right"></i>Sair</g:link></li>
                    </ul>
                </li>

                <li role="presentation" class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-envelope"></i>
                        <span class="badge bg-red">1</span>
                    </a>
                    <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                        <li>
                            <a>
                                <span>
                                    <span>Deferimento</span>
                                    <span class="time">15:30</span>
                                </span>
                                <span class="message">
                                    Um usuário do acolhimento aguarda aceitação para a lista fechada da atividade fisioterapia.
                                </span>
                            </a>
                        </li>
                        <li>
                            <div class="text-center">
                                <a>
                                    <strong>Ver tudo</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- /top navigation -->
