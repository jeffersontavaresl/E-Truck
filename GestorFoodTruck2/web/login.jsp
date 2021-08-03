<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="styles/style.css">
    </head>
<body>
    <nav class="navbar sticky-top bg-light navbar-expand-lg navbar-light mt-1">

        <!--BOTÕES DO MENU-->
        <div class="container-fluid">
            <a href="#" class="navbar-brand">
                <i class="fa fa-truck" alt="" width="30" height="24" class="d-inline-block align-text-top"></i>
            </a>
            <a class="navbar-brand" href="#" id="etruck">E-TRUCK</a>
            <button class="navbar-toggler" data-toggle="collapse" data-target="#expandir">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="expandir">

                <ul class="navbar-nav ml-auto ">
                    <a class="opcoesnav nav-link active" aria-current="page" href="index.html">Início</a>
                    <a class="opcoesnav nav-link" href="#">Funções</a>
                    <a class="opcoesnav nav-link" href="#">Sobre</a>
                    <a class="opcoesnav nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                </ul>
            </div>
        </div>
    </nav>
    <div id="login">
        <form method="post" action=""> 
          <h1>Login</h1> 
          <p> 
            <label for="nome_login">Seu nome</label>
            <input id="nome_login" name="nome_login" required="required" type="text" placeholder="ex. contato@gmail.com"/>
          </p>
           
          <p> 
            <label for="email_login">Seu e-mail</label>
            <input id="email_login" name="email_login" required="required" type="password" placeholder="ex. senha" /> 
          </p>
           
          <p> 
            <input type="checkbox" name="manterlogado" id="manterlogado" value="" /> 
            <label for="manterlogado">Manter-me logado</label>
          </p>
           
          <p> 
            <input type="submit" value="Logar" /> 
          </p>
           
          <p class="link">
            Ainda não tem conta?
            <a href="signin.jsp">Cadastre-se</a>
          </p>
        </form>
      </div>
</body>
</html>
