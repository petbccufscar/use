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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
    <!-- Font Awesome -->
    <asset:stylesheet src="fonts/font-awesome-4.6.3/css/font-awesome.min.css"/>
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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
<!-- NProgress -->
<asset:javascript src="nprogress/nprogress.js"/>
<!-- jQuery custom content scroller -->
<asset:javascript src="malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"/>
<!-- Custom Theme Scripts -->
<asset:javascript src="custom.min.js"/>

</body>
</html>