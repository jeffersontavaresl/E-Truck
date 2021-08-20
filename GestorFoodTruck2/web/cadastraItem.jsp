<%@page contentType="text/html" pageEncoding="UTF-8"%>﻿
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8" />
        <title>Cadastrar produtos</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="styles/realizar.css" rel="stylesheet"/>
    </head>
    <body>


        <div class="container-fluid">
            <div class="container-fluid border w-50 h-75 mt-3 mb-4" id="head">
                <div class="container-fluid d-flex justify-content-center mt-4">
                    <h2>Cadastro de Itens</h2><br>  
                </div>

                <div class="container-fluid mt-2 mr-4">
                    <form action="recebeItem.jsp" method="POST">
                        <p class="font-weight-bold">
                            <%                        if (request.getParameter("pmensagem") != null)
                                    out.write(request.getParameter("pmensagem"));
                            %>
                        </p>

                        <label class="form-label">Nome do Produto</label> <br>
                        <input type="text" class="form-control" maxlength="30" name="nomPrd" placeholder="Nome do produto"> <br><br>

                        <label class="form-label">Preço do Produto</label> <br>
                        <input type="text" class="form-control" maxlength="5" name="vlrPrd" placeholder="Preço do produto"> <br><br>

                        <div class="text-center mb-3">
                            <a href="functions.jsp" class="btn btn-primary">Início</a>
                            <input type="submit" value="Confirmar" class="btn btn-success"/>
                            <input type="reset" value="Cancelar" class="btn btn-danger"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>




        <script>
            function enviarDados() {

                var nomeItem = document.getElementsByName("nomPrd");
                if (nomeItem[0].value === "") {
                    nomeItem[0].focus();
                    alert("Informe o Nome do produto");
                    exit();
                }

                var valorItem = document.getElementsByName("vlrPrd");
                if (valorItem[0].value === "") {
                    valorItem[0].focus();
                    alert("Informe o Preço do produto");
                    exit();
                }

                document.forms[0].submit();
            }

        </script>  
    </body>
</html>
