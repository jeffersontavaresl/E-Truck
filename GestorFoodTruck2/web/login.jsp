<%@page import="modelos.Login"%>
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
            <form class="loginForm">
                <input class="loginInput" type="text" name="usuario" placeholder="Usuário">
                <span class="loginBorder"></span>
                <input class="loginInput" type="password" name="senha" placeholder="Senha">
                <span class="loginBorder"></span>
                <button class="loginSubmit">Login</button>
                <a class="resetSenha" href="#">Esqueceu a senha?</a>
            </form>
        </div>
    </main>           
        <%
        String usuario = request.getParameter("usuario");
        String senha = request.getParameter("senha");
        Login log = new Login();
        //crie a seção 
        if(log.podeLogar(usuario,senha)){            
            session.setAttribute("usuario", usuario);
            session.setAttribute("senha", senha);
            response.sendRedirect("functions.jsp");
        }
        
        %>
    </body>
</html>
