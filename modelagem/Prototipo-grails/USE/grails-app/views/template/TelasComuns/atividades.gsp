<html>
<head>
    <meta name="layout" content="main"/>
    <title>Atividades</title>
</head>

<body>
<!-- page content -->
<div class="right_col" role="main">
    <div class="">

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                %{--<div class="form-group">--}%
                    <label class="col-md-2 col-sm-2 col-xs-12"
                           for="last-name">Data de Cadastro USE</label>

                    <div class="col-md-2 col-sm-6 col-xs-12">
                        <input type="text" id="last-name" name="last-name"
                               disabled="disabled" class="form-control col-md-8 col-xs-12" placeholder="11/02/2016">
                    </div>
                %{--</div>--}%
            </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Atividades</h2>

                        <div class="clearfix"></div>
                    </div>

                    <div class="x_content">

                        <!-- start accordion -->
                        <div class="accordion" id="accordion" role="tablist" aria-multiselectable="true">
                            <div class="panel">
                                <a class="panel-heading collapsed" role="tab" id="headingOne" data-toggle="collapse"
                                   data-parent="#accordion" href="#collapseOne" aria-expanded="false"
                                   aria-controls="collapseOne">
                                    <h4 class="panel-title">Atividade 1</h4>
                                </a>

                                <div id="collapseOne" class="panel-collapse collapse" role="tabpanel"
                                     aria-labelledby="headingOne">
                                    <div class="panel-body">

                                        <form data-parsley-validate class="form-horizontal form-label-left">
                                            <div class="form-group">
                                                <label class="control-label col-md-2 col-sm-2 col-xs-12"
                                                       for="first-name">Linha de Cuidado</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input type="text" id="first-name" disabled="disabled"
                                                           class="form-control col-md-8 col-xs-12">
                                                </div>
                                                <a class="btn btn-success" data-toggle="modal"
                                                   data-target=".infoLinhaCuidado">+</a>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-2 col-sm-2 col-xs-12"
                                                       for="last-name">Área</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input type="text" id="last-name" name="last-name"
                                                           disabled="disabled" class="form-control col-md-8 col-xs-12">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="middle-name"
                                                       class="control-label col-md-2 col-sm-2 col-xs-12">Sub Área</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input id="middle-name" class="form-control col-md-8 col-xs-12"
                                                           type="text" name="middle-name" disabled="disabled">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-2 col-sm-3 col-xs-12">Atividade</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input id="birthday"
                                                           class="date-picker form-control col-md-8 col-xs-12"
                                                           disabled="disabled" type="text">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-2 col-sm-3 col-xs-12">Data de Início</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input id="birthday"
                                                           class="date-picker form-control col-md-8 col-xs-12"
                                                           disabled="disabled" type="text">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-2 col-sm-3 col-xs-12">Data de Término</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input id="birthday"
                                                           class="date-picker form-control col-md-8 col-xs-12"
                                                           disabled="disabled" type="text">
                                                </div>
                                            </div>

                                            <div class="ln_solid"></div>
                                        </form>

                                    </div>
                                </div>
                            </div>

                            <div class="panel">
                                <a class="panel-heading collapsed" role="tab" id="headingTwo" data-toggle="collapse"
                                   data-parent="#accordion" href="#collapseTwo" aria-expanded="false"
                                   aria-controls="collapseTwo">
                                    <h4 class="panel-title">Atividade 2</h4>
                                </a>

                                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"
                                     aria-labelledby="headingTwo">
                                    <div class="panel-body">

                                        <form data-parsley-validate class="form-horizontal form-label-left">
                                            <div class="form-group">
                                                <label class="control-label col-md-2 col-sm-2 col-xs-12"
                                                       for="first-name">Linha de Cuidado</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input type="text" id="first-name" disabled="disabled"
                                                           class="form-control col-md-8 col-xs-12">
                                                </div>
                                                <a class="btn btn-success" data-toggle="modal"
                                                   data-target=".infoLinhaCuidado">+</a>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-2 col-sm-2 col-xs-12"
                                                       for="last-name">Área</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input type="text" id="last-name" name="last-name"
                                                           disabled="disabled" class="form-control col-md-8 col-xs-12">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="middle-name"
                                                       class="control-label col-md-2 col-sm-2 col-xs-12">Sub Área</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input id="middle-name" class="form-control col-md-8 col-xs-12"
                                                           type="text" name="middle-name" disabled="disabled">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-2 col-sm-3 col-xs-12">Atividade</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input id="birthday"
                                                           class="date-picker form-control col-md-8 col-xs-12"
                                                           disabled="disabled" type="text">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-2 col-sm-3 col-xs-12">Data de Início</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input id="birthday"
                                                           class="date-picker form-control col-md-8 col-xs-12"
                                                           disabled="disabled" type="text">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-2 col-sm-3 col-xs-12">Data de Término</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input id="birthday"
                                                           class="date-picker form-control col-md-8 col-xs-12"
                                                           disabled="disabled" type="text">
                                                </div>
                                            </div>

                                            <div class="ln_solid"></div>
                                        </form>

                                    </div>
                                </div>
                            </div>

                            <div class="panel">
                                <a class="panel-heading collapsed" role="tab" id="headingThree" data-toggle="collapse"
                                   data-parent="#accordion" href="#collapseThree" aria-expanded="false"
                                   aria-controls="collapseThree">
                                    <h4 class="panel-title">Atividade 3</h4>
                                </a>

                                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel"
                                     aria-labelledby="headingThree">
                                    <div class="panel-body">

                                        <form data-parsley-validate class="form-horizontal form-label-left">
                                            <div class="form-group">
                                                <label class="control-label col-md-2 col-sm-2 col-xs-12"
                                                       for="first-name">Linha de Cuidado</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input type="text" id="first-name" disabled="disabled"
                                                           class="form-control col-md-8 col-xs-12">
                                                </div>
                                                <a class="btn btn-success" data-toggle="modal"
                                                   data-target=".infoLinhaCuidado">+</a>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-2 col-sm-2 col-xs-12"
                                                       for="last-name">Área</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input type="text" id="last-name" name="last-name"
                                                           disabled="disabled" class="form-control col-md-8 col-xs-12">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="middle-name"
                                                       class="control-label col-md-2 col-sm-2 col-xs-12">Sub Área</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input id="middle-name" class="form-control col-md-8 col-xs-12"
                                                           type="text" name="middle-name" disabled="disabled">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-2 col-sm-3 col-xs-12">Atividade</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input id="birthday"
                                                           class="date-picker form-control col-md-8 col-xs-12"
                                                           disabled="disabled" type="text">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-2 col-sm-3 col-xs-12">Data de Início</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input id="birthday"
                                                           class="date-picker form-control col-md-8 col-xs-12"
                                                           disabled="disabled" type="text">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-2 col-sm-3 col-xs-12">Data de Término</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input id="birthday"
                                                           class="date-picker form-control col-md-8 col-xs-12"
                                                           disabled="disabled" type="text">
                                                </div>
                                            </div>

                                            <div class="ln_solid"></div>
                                        </form>

                                    </div>
                                </div>
                            </div>

                            <div class="panel">
                                <a class="panel-heading collapsed" role="tab" id="headingFour" data-toggle="collapse"
                                   data-parent="#accordion" href="#collapseFour" aria-expanded="false"
                                   aria-controls="collapseFour">
                                    <h4 class="panel-title">Atividade 4</h4>
                                </a>

                                <div id="collapseFour" class="panel-collapse collapse" role="tabpanel"
                                     aria-labelledby="headingFour">
                                    <div class="panel-body">

                                        <form data-parsley-validate class="form-horizontal form-label-left">
                                            <div class="form-group">
                                                <label class="control-label col-md-2 col-sm-2 col-xs-12"
                                                       for="first-name">Linha de Cuidado</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input type="text" id="first-name" disabled="disabled"
                                                           class="form-control col-md-8 col-xs-12">
                                                </div>
                                                <a class="btn btn-success" data-toggle="modal"
                                                   data-target=".infoLinhaCuidado">+</a>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-2 col-sm-2 col-xs-12"
                                                       for="last-name">Área</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input type="text" id="last-name" name="last-name"
                                                           disabled="disabled" class="form-control col-md-8 col-xs-12">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="middle-name"
                                                       class="control-label col-md-2 col-sm-2 col-xs-12">Sub Área</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input id="middle-name" class="form-control col-md-8 col-xs-12"
                                                           type="text" name="middle-name" disabled="disabled">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-2 col-sm-3 col-xs-12">Atividade</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input id="birthday"
                                                           class="date-picker form-control col-md-8 col-xs-12"
                                                           disabled="disabled" type="text">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-2 col-sm-3 col-xs-12">Data de Início</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input id="birthday"
                                                           class="date-picker form-control col-md-8 col-xs-12"
                                                           disabled="disabled" type="text">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-2 col-sm-3 col-xs-12">Data de Término</label>

                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <input id="birthday"
                                                           class="date-picker form-control col-md-8 col-xs-12"
                                                           disabled="disabled" type="text">
                                                </div>
                                            </div>

                                            <div class="ln_solid"></div>
                                        </form>

                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- end of accordion -->

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- /page content -->

<!-- Modal de Resumo do Usuário-->
<div class="modal fade infoLinhaCuidado" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Resumo da Linha de Cuidado</h4>
            </div>

            <div class="modal-body">
                <div class="col-md-8 col-sm-8 col-xs-12">
                    <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>

                    <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla.</p>
                </div>

                <div class="clearfix"></div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal de Resumo do Usuário-->
</body>
</html>