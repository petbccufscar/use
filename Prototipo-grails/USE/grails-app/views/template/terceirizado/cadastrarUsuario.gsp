<html>

<head>
    <meta name="layout"    content="main" />
    <title>Home Terceirizado</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">


        <!-- Bootstrap -->
        <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- NProgress -->
        <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">

        <!-- Custom Theme Style -->
        <link href="../build/css/custom.min.css" rel="stylesheet">

</head>
<body>
<!-- page content -->
<div class="right_col" role="main">
    <div class="">

                <div class="row">

                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div id="wizard" class="form_wizard wizard_horizontal">
                                <ul class="wizard_steps anchor">
                                    <li>
                                        <a href="#step-1" class="selected" isdone="1" rel="1">
                                            <span class="step_no"><i class="fa fa-list-alt"></i></span>
                                            <span class="step_descr">
                                                Dados Gerais<br />
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#step-2" class="disabled" isdone="0" rel="2">
                                            <span class="step_no"><i class="fa fa-map-marker"></i></span>
                                            <span class="step_descr">
                                                Endereço<br />
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#step-3" class="disabled" isdone="0" rel="3">
                                            <span class="step_no"><i class="fa fa-phone"></i></span>
                                            <span class="step_descr">
                                                Contato<br />
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#step-4" class="disabled" isdone="0" rel="4">
                                            <span class="step_no"><i class="fa fa-user"></i></span>
                                            <span class="step_descr">
                                                Acompanhante<br />
                                            </span>
                                        </a>
                                    </li>
                                </ul>





                                <div class="stepContainer" style="height: 281px;"><div id="step-1" class="content" style="display: block;">
                                    <form class="form-horizontal form-label-left">

                                        <div class="item form-group bad">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nome">Nome: <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="nome" id="nome" name="name" required="required" class="form-control col-md-7 col-xs-12">                                            </div>
                                            <div class="alert">Por favor preencha o campo</div></div>
                                        <div class="item form-group bad">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nomeSocial">Nome social:
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="nomeSocial" id="nomeSocial" name="nomeSocial" required="required" class="form-control col-md-7 col-xs-12">                                            </div></div>
                                        <div class="item form-group bad">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="cpf">CPF:
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="cpf" id="cpf" name="cpf" required="required" class="form-control col-md-7 col-xs-12">                                            </div></div>
                                        <div class="item form-group bad">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dataNascimento">Data de nascimento: <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="email" id="dataNascimento" name="dataNascimento" required="required" class="form-control col-md-7 col-xs-12">                                            </div>
                                            <div class="alert">Por favor preencha o campo</div></div>
                                            <div class="item form-group bad">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="Rg">Rg:
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="email" id="Rg" name="Rg" required="required" class="form-control col-md-7 col-xs-12">                                            </div>

                                                </div>
                                            <div class="item form-group bad">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="orgEmissor">Orgao emissor: 
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="orgEmissor" id="orgEmissor" name="orgEmissor" required="required" class="form-control col-md-7 col-xs-12">                                          </div>

                                            </div>


                                    </form>

                                </div><div id="step-2" class="content" style="display: none;">
                                    <h2 class="StepTitle">Pagina de cadastro de endereços</h2>

                                </div><div id="step-3" class="content" style="display: none;">
                                    <h2 class="StepTitle">Pagina para cadastro de contatos</h2>

                                </div><div id="step-4" class="content" style="display: none;">
                                    <h2 class="StepTitle">Pagina para cadastro do acompanhante</h2>

                                </div></div><div class="actionBar"><div class="msgBox"><div class="content"></div><a href="#" class="close">X</a></div><div class="loader">Loading</div><a href="#" class="buttonFinish buttonDisabled btn btn-default">Finish</a><a href="#" class="buttonNext btn btn-success">Next</a><a href="#" class="buttonPrevious buttonDisabled btn btn-primary">Previous</a></div></div>
     </div>

                </div>


    </div>
</div>
</div>
<!-- /page content -->

<content tag="javascript">

    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- jQuery Smart Wizard -->
    <script src="../vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
</content>





</html>