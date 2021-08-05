<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastro</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>

    <body>
        <form action="recebecadastrousuario.jsp" method="POST">
            <div class="container">
                <h1 class="display-2">Cadastro</h1>

                <div class="form-row">
                    <div class="form-group col">
                        <label>Usuário</label>
                        <input type="text" class="form-control" name="usuario" placeholder="Digite um usuário" required>
                    </div>

                </div>
                <div class="form-group">
                    <label>Senha</label>
                    <input type="password" class="form-control" name="senha" placeholder="Digite uma senha" required>
                </div>

                <div class="form-row">
                    <div class="form-group col-0.5">
                        <input type="button" class="btn btn-success" value="Cadastrar" onclick="enviarCadastro()"/>
                    </div>
                    <div class="form-group">
                        <button type="reset" class="btn btn-danger">Cancelar</button>
                    </div>

                </div>
                <div class="form-row">
                    <div class="form-group">
                        <a href="index.html">Início</a>
                    </div>
                    <div class="form-group ml-auto">
                        <a href="loginusuario.jsp">Já possui uma conta? Clique aqui para logar</a>
                    </div>
                </div>
                <%
                    if (request.getParameter("pmensagem") != null)
                        out.write(request.getParameter("pmensagem"));
                %>
            </div>
        </form>

        <script>
            function enviarCadastro() {
                var usuario = document.getElementsByName("usuario");
                if (usuario[0].value === "") {
                    usuario[0].focus();
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