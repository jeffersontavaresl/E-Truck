<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles/cadastro.css">
        <title>Cadastro</title>
        
    </head>
    
    <body>
        
    <main class="cadastro">
        <div class="cadastroContainer">
               <%
                if (request.getParameter("pmensagem") != null)
                out.write(request.getParameter("pmensagem"));
                %>
            <h1 class="cadastroTitulo">Cadastro</h1>
            <form class="cadastroForm" action="recebecadastrousuario.jsp" method="POST">
                   
            <input type="text" class="cadastroInput" maxlength="15" name="login" placeholder="Informe um usuario" required>
            <span class="cadastroBorder"></span>
            <input type="password" class="cadastroInput" maxlength="15" name="senha" placeholder="Digite uma senha" required>
            <span class="cadastroBorder"></span>
            <input type="button"  class="cadastroSubmit" value="Cadastrar" onclick="enviarCadastro()"/>
            
                </form>
            </div>
        </main>
    
        <script>
            function enviarCadastro() {
                var login = document.getElementsByName("login");
                if (login[0].value === "") {
                    login[0].focus();
                    alert("Informe o usuário");
                    exit();
                }

                var senha = document.getElementsByName("senha");
                if (senha[0].value === "") {
                    senha[0].focus();
                    alert("Informe a senha");
                    exit();
                }

                document.forms[0].submit();
            }

        </script>  
    </body>
</html>
