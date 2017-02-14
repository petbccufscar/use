<!doctype html>
<html lang="pt">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>
        <g:layoutTitle default="USE-WEB"/>
    </title>

    <!-- Bootstrap -->
    <asset:stylesheet src="bootstrap-3.3.7/css/bootstrap.min.css"/>
    <!-- Font Awesome -->
    <asset:stylesheet src="font-awesome-4.6.3/css/font-awesome.min.css"/>
    <!-- NProgress -->
    <asset:stylesheet src="nprogress/nprogress.css"/>
    <!-- Custom Theme Style -->
    <asset:stylesheet src="custom.css"/>

    <g:layoutHead/>
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">

        <g:render template="/layouts/menu"/>

        <g:render template="/layouts/topnavigation"/>

        <g:layoutBody/>

        <g:render template="/layouts/footer"/>

    </div>
</div>

<!-- jQuery -->
<asset:javascript src="jquery/dist/jquery.min.js"/>
<!-- Bootstrap -->
<asset:javascript src="bootstrap-3.3.7/js/bootstrap.min.js"/>
<!-- NProgress -->
<asset:javascript src="nprogress/nprogress.js"/>
<!-- jQuery custom content scroller -->
<asset:javascript src="malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"/>
<!-- Custom Theme Scripts -->
<asset:javascript src="custom.css"/>

<g:pageProperty name="page.javascript"/>


</body>
</html>