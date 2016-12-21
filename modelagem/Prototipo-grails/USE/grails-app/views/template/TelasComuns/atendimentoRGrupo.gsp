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
                        <h2>Buscar Atividades em Grupo</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <table id="datatable-fixed-header" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <!-- <th>Resumo</th> -->
                                <th>Código</th>
                                <th>Nome do Grupo</th>
                            </tr>
                            </thead>

                            <tbody>
                            <tr>
                                <td><a class="btn btn-info" data-toggle="modal" data-target=".infoUsuario"><i class="fa fa-info"></i></a>
                                    G81</td>
                                <td>Grupo Terapia da mão</td>
                            </tr>
                            <tr>
                                <td><a class="btn btn-info" data-toggle="modal" data-target=".infoUsuario"><i class="fa fa-info"></i></a>
                                    H56</td>
                                <td>Grupo 1</td>
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
                    <h4 class="modal-title" id="myModalLabel">Informações da atividade em grupo</h4>
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                    <div id="myTabContent" class="tab-content">
                        <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="realizar-tab">
                            <div class="x_content">
                                <div class="row">
                                    <form class="form-vertical">
                                        <div class="x_panel">
                                            <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                <div class="col-md-4 col-sm-2 col-xs-2 form-group">
                                                    <label class="">Código da Atividade</label>
                                                    <div class="">
                                                        <input type="text" id=""  placeholder="G81" class="form-control" disabled="disabled">
                                                    </div>
                                                </div>
                                                <div class="col-md-8 col-sm-10 col-xs-10 form-group">
                                                    <label class="">Nome da Atividade</label>
                                                    <div class="">
                                                        <input type="text" id=""  placeholder="Terapia da mão" class="form-control" disabled="disabled">
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-md-12 col-sm-10 col-xs-10 form-group">
                                                <div class="col-md-4 col-sm-10 col-xs-10 form-group">
                                                    <label class="">Linha de cuidado</label>
                                                    <input type="text" id=""  placeholder="Músculo Esquelética" class="form-control" disabled="disabled">
                                                </div>
                                                <div class="col-md-4 col-sm-10 col-xs-10 form-group">
                                                    <label class="">Área</label>
                                                    <input type="text" id=""  placeholder="TO" class="form-control" disabled="disabled">
                                                </div>
                                                <div class="col-md-4 col-sm-10 col-xs-10 form-group">
                                                    <label class="">Sub Área</label>
                                                    <input type="text" id=""  placeholder="TO" class="form-control" disabled="disabled">
                                                </div>

                                            </div>


                                            <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                                                    <h4>Equipe</h4>
                                                    <table id="datatable-fixed-header" class="table table-striped table-bordered">
                                                        <thead>
                                                        <tr>
                                                            <th>RA/Código</th>
                                                            <th>Nome</th>
                                                        </tr>
                                                        </thead>

                                                        <tbody>
                                                        <tr>
                                                            <td>619973</td>
                                                            <td>Letícia Yumi Katsurada</td>
                                                        </tr>
                                                        <tr>
                                                            <td>60000</td>
                                                            <td>Maria</td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                                                    <h4>Responsáveis</h4>
                                                    <table id="datatable-fixed-header" class="table table-striped table-bordered">
                                                        <thead>
                                                        <tr>
                                                            <th>Código</th>
                                                            <th>Nome</th>
                                                        </tr>
                                                        </thead>

                                                        <tbody>
                                                        <tr>
                                                            <td>123456</td>
                                                            <td>Gilve</td>
                                                        </tr>
                                                        <tr>
                                                            <td>456789</td>
                                                            <td>Maria Helena</td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                <h4>Público Alvo, crtérios de inscrição e prioridades</h4>
                                                <textarea disabled="disabled">
                                                    -Crianças de 2 a 10 anos
                                                    -Crianças entre 11 e 16 anos
                                                    *Todos os anteriors se a condição aguda ou se for submetido a procedimento cirúrgico ou aplicação de bloqueio químico com no máximo um mês após o procedimento.
                                                </textarea>
                                            </div>

                                            <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                <h4>CID'S</h4>
                                                <table id="datatable-fixed-header" class="table table-striped table-bordered">
                                                    <thead>
                                                    <tr>
                                                        <th>Código</th>
                                                        <th>Nome</th>
                                                    </tr>
                                                    </thead>

                                                    <tbody>
                                                    <tr>
                                                        <td>P14</td>
                                                        <td>Descrição</td>
                                                    </tr>
                                                    <tr>
                                                        <td>P18</td>
                                                        <td>Descrição</td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>









                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <g:link controller="template" action="atendimentoRGrupo2"><button type="button" class="btn btn-default">Realizar</button></g:link>
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