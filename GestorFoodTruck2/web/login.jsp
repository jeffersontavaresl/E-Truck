<%@page import="modelos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles/login.css" />
    </head>
    <body>
    <main class="login">
        <div class="loginContainer">
            <h1 class="loginTitulo">Login</h1>
            <form action="login.jsp" class="loginForm">
                <input class="loginInput" type="text" name="login" placeholder="Usuário">
                <span class="loginBorder"></span>
                <input class="loginInput" type="password" name="senha" placeholder="Senha">
                <span class="loginBorder"></span>
                <button class="loginSubmit">Login</button>
                <a class="resetSenha" href="cadastrousuario.jsp"><b>Cadastre-se</b></a>
            </form>
        </div>
    </main>           
        <%
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        Usuario usu = new Usuario();
        //crie a seção 
        if(usu.podeLogar(login,senha)){            
            session.setAttribute("login", login);
            session.setAttribute("senha", senha);
            response.sendRedirect("functions.jsp");
        }
        
        %>
    </body>
</html>
