<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">

    <title>USEWEB - Login</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Font Awesome -->
    <asset:stylesheet src="fonts/font-awesome-4.6.3/css/font-awesome.min.css"/>
    <!-- NProgress -->
    <asset:stylesheet src="plugins/nprogress/nprogress.css"/>
    <!-- Custom Theme Style -->
    <asset:stylesheet src="custom.css"/>

    <style type="text/css">
    html, body, .container-table {
        height: 100%;
    }

    .container {
        max-width: 300px
    }

    .container-table {
        display: table;
    }

    .vertical-center-row {
        display: table-cell;
        vertical-align: middle;
    }
    </style>

</head>

<body class="login">
<div class="container container-table">
    <div class="row vertical-center-row">
        <form class="form-signin">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-user"></span></span>
                <input type="text" id="usuario" class="form-control" placeholder="Usuário"
                       aria-describedby="basic-addon1" required autofocus>
            </div>

            <div class="input-group">
                <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-lock"></span></span>
                <input type="password" class="form-control" placeholder="Senha" aria-describedby="basic-addon1">
            </div>

            <div>
                <button class="btn btn-primary btn-block" onclick="login()" type="submit">Entrar</button>
                <a class="reset_pass" href="#">Esqueci minha senha</a>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    function login() {
        let usuario = document.getElementById("usuario").value
        if (usuario === "professor") {
            window.location.href = '../professor/home_professor.html';
            %{--window.location.href = "<g:createLink controller="template" action="home_professor"/>";--}%
        }
        else if (usuario === "aluno") {
            window.location.href = '../aluno/home_aluno.html';
        }
        else if (usuario === "admin") {
            window.location.href = '../admin/home_admin.html';
        }
    }
</script>
</body>
</html>
