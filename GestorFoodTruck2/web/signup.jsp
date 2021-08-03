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
        <div id="cadastro">
        <form method="post" action=""> 
          <h1>Cadastro</h1> 
           
          <p> 
            <label for="nome_cad">Seu nome</label>
            <input id="nome_cad" name="nome_cad" required="required" type="text" placeholder="nome" />
          </p>
           
          <p> 
            <label for="email_cad">Seu e-mail</label>
            <input id="email_cad" name="email_cad" required="required" type="email" placeholder="contato@gmail.com"/> 
          </p>
           
          <p> 
            <label for="senha_cad">Sua senha</label>
            <input id="senha_cad" name="senha_cad" required="required" type="password" placeholder="ex. 1234"/>
          </p>
           
          <p> 
            <input type="submit" value="Cadastrar"/> 
          </p>
           
          <p class="link">  
            Já tem conta?
            <a href="login.jsp"> Ir para Login </a>
          </p>
        </form>
      </div>
    </body>
</html>

