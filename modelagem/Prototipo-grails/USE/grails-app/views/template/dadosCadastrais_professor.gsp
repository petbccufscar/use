<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Dados Cadastrais</title>
</head>

<body>
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <!-- <h3>Dados Cadastrais</h3> -->
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Dados Cadastrais</h2>

                        <div class="clearfix"></div>
                    </div>

                    <div class="x_content">
                        <div class="col-md-3 col-sm-3 col-xs-12 profile_left">
                            <div class="profile_img">
                                <div id="crop-avatar">
                                    <!-- Current avatar -->
                                    <asset:image src="user.png" class="img-responsive avatar-view" alt="Foto de Perfil"/>
                                </div>
                            </div>

                            <h3>Nome do Professor</h3>

                            <ul class="list-unstyled user_data">
                                <li>
                                    <i class="fa fa-archive"></i> N° Cadastro
                                </li>

                                <li><i class="fa fa-folder-open"></i> N° Prontuário
                                </li>

                                <li><i class="fa fa-check" style="color: #00da00;"></i> Ativo / <i class="fa fa-close"
                                                                                                   style="color: #c80000;"></i> Inativo
                                </li>

                            </ul>
                            <br/>
                        </div>

                        <div class="col-md-9 col-sm-9 col-xs-12">
                            <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                <ul id="myTab" class="nav nav-tabs bar_tabs nav-justified" role="tablist">
                                    <li role="presentation" class="active"><a href="#tab_content1" id="dadosgerais-tab"
                                                                              role="tab" data-toggle="tab"
                                                                              aria-expanded="true">Dados Gerais</a>
                                    </li>
                                    <li role="presentation" class=""><a href="#tab_content2" role="tab" id="contato-tab"
                                                                        data-toggle="tab"
                                                                        aria-expanded="false">Contato</a>
                                    </li>
                                    <li role="presentation" class=""><a href="#tab_content3" role="tab"
                                                                        id="endereco-tab" data-toggle="tab"
                                                                        aria-expanded="false">Endereço</a>
                                </ul>

                                <div id="myTabContent" class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade active in" id="tab_content1"
                                         aria-labelledby="dadosgerais-tab">

                                        <div class="x_content">
                                            <div class="row">
                                                <form class="form-vertical">
                                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                        <label class="control-label" for="first-name">Nome</label>

                                                        <div class="">
                                                            <input type="text" id=""
                                                                   placeholder="Felipe Sampaio de Souza"
                                                                   class="form-control" disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                        <label class="control-label"
                                                               for="first-name">Nome Social</label>

                                                        <div class="">
                                                            <input type="text" id="" placeholder="" class="form-control"
                                                                   disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                        <label class="control-label"
                                                               for="first-name">Data de Nascimento</label>

                                                        <div class="">
                                                            <input type="text" id="" placeholder="26/02/1997"
                                                                   class="form-control" disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                        <label class="control-label" for="first-name">Sexo</label>

                                                        <div class="">
                                                            <input type="text" id="" placeholder="Masculino"
                                                                   class="form-control" disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="clearfix"></div>

                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                        <label class="control-label" for="first-name">CPF</label>

                                                        <div class="">
                                                            <input type="text" id="" placeholder="999.999.999-99"
                                                                   class="form-control" disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="clearfix"></div>

                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                        <label class="control-label" for="first-name">CNS</label>

                                                        <div class="">
                                                            <input type="text" id="" placeholder="619523"
                                                                   class="form-control" disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                        <label class="control-label"
                                                               for="first-name">Data de Cadastro USE</label>

                                                        <div class="">
                                                            <input type="text" id="" placeholder="02/10/2015"
                                                                   class="form-control" disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                        <label class="control-label"
                                                               for="first-name">Nome da Mãe</label>

                                                        <div class="">
                                                            <input type="text" id=""
                                                                   placeholder="Maria Sônia Sampaio de Souza"
                                                                   class="form-control" disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                        <label class="control-label" for="first-name">Cor</label>

                                                        <div class="">
                                                            <input type="text" id="" placeholder="" class="form-control"
                                                                   disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                        <label class="control-label" for="first-name">Etnia</label>

                                                        <div class="">
                                                            <input type="text" id="" placeholder="" class="form-control"
                                                                   disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="clearfix"></div>

                                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                        <label class="control-label"
                                                               for="first-name">Escolaridade</label>

                                                        <div class="">
                                                            <input type="text" id="" placeholder="" class="form-control"
                                                                   disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                                                        <label class="control-label" for="first-name">Profissão</label>

                                                        <div class="">
                                                            <input type="text" id="" placeholder="" class="form-control"
                                                                   disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                                                        <label class="control-label"
                                                               for="first-name">Status da Profissão</label>

                                                        <div class="">
                                                            <input type="text" id="" placeholder="" class="form-control"
                                                                   disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                        <label class="control-label" for="first-name">RG</label>

                                                        <div class="">
                                                            <input type="text" id="" placeholder="99.999.999-X"
                                                                   class="form-control" disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                        <label class="control-label"
                                                               for="first-name">Órgão Emissor</label>

                                                        <div class="">
                                                            <input type="text" id="" placeholder="SSP"
                                                                   class="form-control" disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="clearfix"></div>

                                                    <div class="ln_solid"></div>

                                                    <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                                        <div class="">
                                                            <a class="btn btn-success"><i
                                                                    class="fa fa-edit m-right-xs"></i> Editar Dados</a>
                                                        </div>
                                                    </div>

                                                </form>
                                            </div>
                                        </div>

                                    </div>

                                    <div role="tabpanel" class="tab-pane fade" id="tab_content2"
                                         aria-labelledby="contato-tab">

                                        <div class="content_x">
                                            <div class="row">
                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <!-- start accordion -->
                                                    <div class="accordion" id="accordion" role="tablist"
                                                         aria-multiselectable="true">
                                                        <div class="panel">
                                                            <a class="panel-heading" role="tab" id="headingOne"
                                                               data-toggle="collapse" data-parent="#accordion"
                                                               href="#collapseOne" aria-expanded="false"
                                                               aria-controls="collapseOne">
                                                                <h4 class="panel-title">Telefones</h4>
                                                            </a>

                                                            <div id="collapseOne" class="panel-collapse collapse in"
                                                                 role="tabpanel" aria-labelledby="headingOne">
                                                                <div class="panel-body">

                                                                    <div class="telefone col-md-6 col-sm-6 col-xs-12">
                                                                        <div class="x_panel">
                                                                            <form class="form-horizontal form-label-left">

                                                                                <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                                                    <label>Tipo</label>
                                                                                    <input type="text" id=""
                                                                                           placeholder="Residencial"
                                                                                           class="form-control"
                                                                                           disabled="disabled">
                                                                                </div>

                                                                                <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                                                    <input type="text"
                                                                                           class="form-control has-feedback-left"
                                                                                           placeholder="(11) 91234-5678"
                                                                                           disabled="disabled">
                                                                                    <span class="fa fa-phone form-control-feedback left"
                                                                                          aria-hidden="true"></span>
                                                                                </div>

                                                                                <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                                                    <label>Observações</label>
                                                                                    <textarea class="form-control"
                                                                                              disabled="disabled"
                                                                                              placeholder="Aqui vão as observações"
                                                                                              style="resize:none;"></textarea>
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </div>

                                                                    <div class="telefone col-md-6 col-sm-6 col-xs-12">
                                                                        <div class="x_panel">
                                                                            <form class="form-horizontal form-label-left">

                                                                                <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                                                    <label>Tipo</label>
                                                                                    <input type="text" id=""
                                                                                           placeholder="Residencial"
                                                                                           class="form-control"
                                                                                           disabled="disabled">
                                                                                </div>

                                                                                <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                                                    <input type="text"
                                                                                           class="form-control has-feedback-left"
                                                                                           placeholder="(11) 91234-5678"
                                                                                           disabled="disabled">
                                                                                    <span class="fa fa-phone form-control-feedback left"
                                                                                          aria-hidden="true"></span>
                                                                                </div>

                                                                                <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                                                    <label>Observações</label>
                                                                                    <textarea class="form-control"
                                                                                              disabled="disabled"
                                                                                              placeholder="Aqui vão as observações"
                                                                                              style="resize:none;"></textarea>
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </div>

                                                                    <div class="telefone col-md-6 col-sm-6 col-xs-12">
                                                                        <div class="x_panel">
                                                                            <form class="form-horizontal form-label-left">

                                                                                <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                                                    <label>Tipo</label>
                                                                                    <input type="text" id=""
                                                                                           placeholder="Residencial"
                                                                                           class="form-control"
                                                                                           disabled="disabled">
                                                                                </div>

                                                                                <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                                                    <input type="text"
                                                                                           class="form-control has-feedback-left"
                                                                                           placeholder="(11) 91234-5678"
                                                                                           disabled="disabled">
                                                                                    <span class="fa fa-phone form-control-feedback left"
                                                                                          aria-hidden="true"></span>
                                                                                </div>

                                                                                <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                                                    <label>Observações</label>
                                                                                    <textarea class="form-control"
                                                                                              disabled="disabled"
                                                                                              placeholder="Aqui vão as observações"
                                                                                              style="resize:none;"></textarea>
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="panel">
                                                            <a class="panel-heading collapsed" role="tab"
                                                               id="headingTwo" data-toggle="collapse"
                                                               data-parent="#accordion" href="#collapseTwo"
                                                               aria-expanded="false" aria-controls="collapseTwo">
                                                                <h4 class="panel-title">Emails</h4>
                                                            </a>

                                                            <div id="collapseTwo" class="panel-collapse collapse"
                                                                 role="tabpanel" aria-labelledby="headingTwo">
                                                                <div class="panel-body">
                                                                    <div class="col-md-6 col-sm-6 col-xs-6 form-group">
                                                                        <input type="text"
                                                                               class="form-control has-feedback-left"
                                                                               placeholder="user1@email.com"
                                                                               disabled="disabled">
                                                                        <span class="fa fa-mail-forward form-control-feedback left"
                                                                              aria-hidden="true"></span>
                                                                    </div>

                                                                    <div class="col-md-6 col-sm-6 col-xs-6 form-group">
                                                                        <input type="text"
                                                                               class="form-control has-feedback-left"
                                                                               placeholder="user2@email.com"
                                                                               disabled="disabled">
                                                                        <span class="fa fa-mail-forward form-control-feedback left"
                                                                              aria-hidden="true"></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- end of accordion -->
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                    <div role="tabpanel" class="tab-pane fade" id="tab_content3"
                                         aria-labelledby="endereco-tab">

                                        <div class="content_x">
                                            <div class="row">
                                                <form class="form-vertical">
                                                    <div class="col-md-4 col-sm-4 col-xs-4 form-group">
                                                        <label class="control-label" for="first-name">CEP</label>

                                                        <div class="">
                                                            <input type="text" id="" placeholder="99999-999"
                                                                   class="form-control" disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="clearfix"></div>

                                                    <div class="col-md-4 col-sm-4 col-xs-4 form-group">
                                                        <label class="control-label"
                                                               for="first-name">Tipo Logradouro</label>

                                                        <div class="">
                                                            <input type="text" id="" placeholder="Rua"
                                                                   class="form-control" disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-8 col-sm-8 col-xs-8 form-group">
                                                        <label class="control-label" for="first-name">Logradouro</label>

                                                        <div class="">
                                                            <input type="text" id="" placeholder="Alexandrina"
                                                                   class="form-control" disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-4 col-sm-4 col-xs-4 form-group">
                                                        <label class="control-label" for="first-name">Número</label>

                                                        <div class="">
                                                            <input type="text" id="" placeholder="90"
                                                                   class="form-control" disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-8 col-sm-8 col-xs-8 form-group">
                                                        <label class="control-label"
                                                               for="first-name">Complemento</label>

                                                        <div class="">
                                                            <input type="text" id="" placeholder="Casa 2"
                                                                   class="form-control" disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                        <label class="control-label" for="first-name">Bairro</label>

                                                        <div class="">
                                                            <input type="text" id="" placeholder="JD. Guanabara"
                                                                   class="form-control" disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                        <label class="control-label" for="first-name">Cidade</label>

                                                        <div class="">
                                                            <input type="text" id="" placeholder="São Carlos"
                                                                   class="form-control" disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                        <label class="control-label" for="first-name">Estado</label>

                                                        <div class="">
                                                            <input type="text" id="" placeholder="São Paulo"
                                                                   class="form-control" disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="clearfix"></div>

                                                    <div class="ln_solid"></div>

                                                    <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                                        <div class="">
                                                            <a class="btn btn-success"><i
                                                                    class="fa fa-edit m-right-xs"></i> Editar Dados</a>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->
</body>
</html>