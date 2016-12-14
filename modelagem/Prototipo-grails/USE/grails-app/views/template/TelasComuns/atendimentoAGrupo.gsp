<html>
<head>
    <meta name="layout" content="main"/>
    <title>Atendimento em Grupo</title>

    <!-- Datatables -->
    <asset:stylesheet src="datatables/datatables.net-bs/css/dataTables.bootstrap.min.css"/>
    <asset:stylesheet src="datatables.net-buttons-bs/css/buttons.bootstrap.min.css"/>
    <asset:stylesheet src="datatables/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"/>
    <asset:stylesheet src="datatables/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"/>
    <asset:stylesheet src="datatables/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"/>

</head>

<body>
<!-- page content -->
<div class="right_col" role="main">
    <div class="">

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Buscar Atendimentos de Atividades em Grupo</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <table id="datatable-fixed-header" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <!-- <th>Resumo</th> -->
                                <th>Código do Grupo</th>
                                <th>Data</th>
                                <th>Nome do Grupo</th>
                                <th>Responsável(s)</th>
                            </tr>
                            </thead>

                            <tbody>
                            <tr>
                                <td><a class="btn btn-info" data-toggle="modal" data-target=".infoUsuario"><i class="fa fa-info"></i></a>
                                    G56</td>
                                <td>11/10/2016</td>
                                <td>Grupo Terapia da Mão</td>
                                <td>Alfredo</td>
                            </tr>

                            <tr>
                                <td><a class="btn btn-info" data-toggle="modal" data-target=".infoUsuario"><i class="fa fa-info"></i></a>
                                    G89</td>
                                <td>10/10/2016</td>
                                <td>Grupo Cardiorespiratória</td>
                                <td>Gilve, Maria Helena</td>
                            </tr>
                            <tr>
                                <td><a class="btn btn-info" data-toggle="modal" data-target=".infoUsuario"><i class="fa fa-info"></i></a>
                                    G56</td>
                                <td>04/10/2016</td>
                                <td>Grupo Terapia da Mão</td>
                                <td>Alfredo</td>
                            </tr>
                            <tr>
                                <td><a class="btn btn-info" data-toggle="modal" data-target=".infoUsuario"><i class="fa fa-info"></i></a>
                                    G89</td>
                                <td>03/10/2016</td>
                                <td>Grupo Cardiorespiratória</td>
                                <td>Gilve, Maria Helena</td>
                            </tr>


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal de Resumo da atividade-->
    <div class="modal fade infoUsuario" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">Informações do atendimento</h4>
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12 form-group">

                    <div id="myTabContent" class="tab-content">
                        <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="realizar-tab">
                            <div class="x_content">
                                <div class="row">
                                    <form class="form-vertical">

                                        <div class="x_panel">
                                            <div class="col-md-10 col-sm-10 col-xs-10 form-group">
                                                <label class="">Atividade</label>
                                                <div class="">
                                                    <select class="form-control" disabled="disabled">
                                                        <option>Terapia da mão</option>

                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-md-2 col-sm-2 col-xs-2 form-group">
                                                <div class="">
                                                    <label class="control-label" for="first-name">Data</label>
                                                    <input type="text" id=""  placeholder="10/10/2016" class="form-control" disabled="disabled">
                                                </div>

                                            </div>

                                        </div><!--panel1-->


                                        <div class="x_panel">
                                            <h3>Evolução da atividade em grupo</h3>
                                            <div class="ln_solid"></div>

                                            <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                <div class="">
                                                    <label class="control-label" for="first-name">Resumo</label>
                                                    <input type="text" id=""  placeholder="Resumo" class="form-control" disabled="disabled">
                                                </div>
                                            </div>

                                            <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                <div class="">
                                                    <label class="control-label" for="first-name">Descrição</label>
                                                    <input type="text" id=""  placeholder="Descrição" class="form-control" style="height: 100px;" disabled="disabled">
                                                </div>
                                            </div>

                                        </div> <!--panel2-->

                                        <div class="x_panel">
                                            <h3>Equipe</h3>
                                            <div class="ln_solid"></div>

                                            <div class="col-md-6 col-sm-6 col-xs-6 form-group">
                                                <div class="x_panel">
                                                    <h4>Alunos</h4>
                                                    <div class="ln_solid"></div>

                                                    <div class="col-md-4 col-sm-4 col-xs-4 form-group">
                                                        <label class="control-label" for="first-name">RA</label><br>
                                                        <input type="text" id=""  placeholder="619973" class="form-control" disabled="disabled"><br>
                                                        <button type="button" class="btn btn-danger" data-toggle="collapse" data-target="#del3">Adicionar</button>

                                                    </div>





                                                    <div class="col-md-6 col-sm-8 col-xs-8 form-group">
                                                        <label class="control-label" for="first-name">Nome</label><br>

                                                        <div id="demo" class="panel-collapse collapse in">
                                                            <input type="text" id=""  placeholder="Yumi" class="form-control" disabled="disabled">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-1 col-sm-3 col-xs-3 form-group">
                                                        <label class="control-label" for="first-name"></label><br>
                                                        <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo">X</button>

                                                    </div>











                                                    <br>





                                                </div>
                                            </div>

                                            <div class="col-md-6 col-sm-6 col-xs-6 form-group">
                                                <div class="x_panel">
                                                    <h4>Responsáveis</h4>
                                                    <div class="ln_solid"></div>

                                                    <div class="col-md-10 col-sm-8 col-xs-8 form-group">
                                                        <input type="text" id=""  placeholder="Yumi" class="form-control" disabled="disabled">
                                                    </div>
                                                    <div class="col-md-2 col-sm-4 col-xs-4 form-group">
                                                        <button type="button" class="btn btn-danger" data-toggle="collapse" data-target="#del3">X</button>
                                                    </div>
                                                    <br>

                                                    <div class="col-md-10 col-sm-8 col-xs-8 form-group">
                                                        <input type="text" id=""  placeholder="Yumi" class="form-control" disabled="disabled">
                                                    </div>
                                                    <div class="col-md-2 col-sm-4 col-xs-4 form-group">
                                                        <button type="button" class="btn btn-danger" data-toggle="collapse" data-target="#del4">X</button>
                                                    </div>
                                                    <br>

                                                    <button type="button" class="btn btn-danger" data-toggle="collapse" data-target="#del3">Adicionar</button>

                                                </div>
                                            </div>
                                        </div> <!--panel3-->

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div> <!--<div class="col-md-8 col-sm-8 col-xs-8 form-group">-->


                <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                    <div class="accordion" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel">
                            <a class="panel-heading collapsed" role="tab" id="headingOne" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                <h4 class="panel-title">Usuário 1</h4>
                            </a>
                            <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                <div class="panel-body">

                                    <form data-parsley-validate class="form-horizontal form-label-left">
                                        <div class="form-group">
                                            <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">Nome</label>
                                            <div class="col-md-8 col-sm-6 col-xs-12">
                                                <input type="text" id="first-name" disabled="disabled" placeholder="Antonio Carlos" class="form-control col-md-4 col-xs-12">

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label class="control-label col-md-2 col-sm-2 col-xs-12">
                                                    <input type="checkbox" class="flat" checked="checked">Falta
                                                </label>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="panel">
                                                    <div class="ln_solid"></div>
                                                    <h5>Evolução individual</h5>
                                                    <div class="ln_solid"></div>

                                                    <div class="form-group">
                                                        <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">Resumo</label>
                                                        <div class="col-md-8 col-sm-6 col-xs-12">
                                                            <input type="text" id="first-name" disabled="disabled" placeholder="Resumo" class="form-control col-md-4 col-xs-12">
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">Descrição</label>
                                                        <div class="col-md-8 col-sm-6 col-xs-12">
                                                            <input type="text" id="first-name" disabled="disabled" placeholder="Descrição" class="form-control col-md-4 col-xs-12" row="5">
                                                        </div>
                                                    </div>
                                                    <div class="ln_solid"></div>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="panel">
                                                    <div class="ln_solid"></div>
                                                    <a class="panel-heading collapsed" role="tab" id="headingUserOne" data-toggle="collapse" data-parent="#accordion1" href="#collapseUserOne" aria-expanded="false" aria-controls="collapseUserOne">
                                                        <h5>Questionários</h5>
                                                    </a>
                                                    <div id="collapseUserOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingUserOne">
                                                        <div class="panel-body">
                                                            <div class="ln_solid"></div>

                                                            <table id="datatable-fixed-header" class="table table-striped table-bordered">
                                                                <thead>
                                                                <tr>
                                                                    <th>Código</th>
                                                                    <th>Nome do Grupo</th>
                                                                </tr>
                                                                </thead>

                                                                <tbody>
                                                                <tr>
                                                                    <td><a class="btn btn-info" data-toggle="modal" data-target=".infoUsuario"><i class="fa fa-info"></i></a>
                                                                        89</td>
                                                                    <td>Questionario 1</td>
                                                                </tr>
                                                                <tr>
                                                                    <td><a class="btn btn-info" data-toggle="modal" data-target=".infoUsuario"><i class="fa fa-info"></i></a>
                                                                        56</td>
                                                                    <td>Questionario 2</td>
                                                                </tr>


                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>



                                        <div class="ln_solid"></div>
                                    </form>

                                </div>
                            </div>
                        </div>





                    </div>
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                    <div class="accordion" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel">
                            <a class="panel-heading collapsed" role="tab" id="headingTwo" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                <h4 class="panel-title">Usuário 2</h4>
                            </a>
                            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                <div class="panel-body">

                                    <form data-parsley-validate class="form-horizontal form-label-left">
                                        <div class="form-group">
                                            <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">Nome</label>
                                            <div class="col-md-8 col-sm-6 col-xs-12">
                                                <input type="text" id="first-name" disabled="disabled" placeholder="Antonio Carlos" class="form-control col-md-4 col-xs-12">

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label class="control-label col-md-2 col-sm-2 col-xs-12">
                                                    <input type="checkbox" class="flat" checked="checked">Falta
                                                </label>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="panel">
                                                    <div class="ln_solid"></div>
                                                    <h5>Evolução individual</h5>
                                                    <div class="ln_solid"></div>

                                                    <div class="form-group">
                                                        <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">Resumo</label>
                                                        <div class="col-md-8 col-sm-6 col-xs-12">
                                                            <input type="text" id="first-name" disabled="disabled" placeholder="Resumo" class="form-control col-md-4 col-xs-12">
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">Descrição</label>
                                                        <div class="col-md-8 col-sm-6 col-xs-12">
                                                            <input type="text" id="first-name" disabled="disabled" placeholder="Descrição" class="form-control col-md-4 col-xs-12" row="5">
                                                        </div>
                                                    </div>
                                                    <div class="ln_solid"></div>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="panel">

                                                    <a class="panel-heading collapsed" role="tab" id="headingUserTwo" data-toggle="collapse" data-parent="#accordion" href="#collapseUserTwo" aria-expanded="false" aria-controls="collapseUserTwo">
                                                        <h5>Questionários</h5>
                                                    </a>
                                                    <div id="collapseUserTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingUserTwo">
                                                        <div class="panel-body">
                                                            <div class="ln_solid"></div>

                                                            <table id="datatable-fixed-header" class="table table-striped table-bordered">
                                                                <thead>
                                                                <tr>
                                                                    <th>Código</th>
                                                                    <th>Nome do Grupo</th>
                                                                </tr>
                                                                </thead>

                                                                <tbody>
                                                                <tr>
                                                                    <td><a class="btn btn-info" data-toggle="modal" data-target=".infoUsuario"><i class="fa fa-info"></i></a>
                                                                        89</td>
                                                                    <td>Questionario 1</td>
                                                                </tr>
                                                                <tr>
                                                                    <td><a class="btn btn-info" data-toggle="modal" data-target=".infoUsuario"><i class="fa fa-info"></i></a>
                                                                        56</td>
                                                                    <td>Questionario 2</td>
                                                                </tr>


                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>



                                        <div class="ln_solid"></div>
                                    </form>

                                </div>
                            </div>
                        </div>





                    </div>
                </div>


                <div class="clearfix"></div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                </div>

            </div>
        </div>
    </div>
    <!-- Modal de Resumo do Usuário-->

</div>
<!-- /page content -->

<content tag="javascript">
    <!-- Datatables -->
    <asset:javascript src="datatables/datatables.net/js/jquery.dataTables.js"/>
    <asset:javascript src="datatables/datatables.net-bs/js/dataTables.bootstrap.min.js"/>
    <asset:javascript src="datatables/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"/>
    <asset:javascript src="datatables/datatables.net-keytable/js/dataTables.keyTable.min.js"/>

    <!-- Datatables -->
    <script>
        $(document).ready(function () {

            $('#datatable').dataTable();

            $('#datatable-keytable').DataTable({
                keys: true
            });

            $('#datatable-fixed-header').DataTable({
                fixedHeader: true
            });

            $datatable.dataTable({
                'order': [[1, 'asc']],
                'columnDefs': [
                    {orderable: false, targets: [0]}
                ]
            });

            TableManageButtons.init();
        });
    </script>
    <!-- /Datatables -->
</content>
</body>
</html>