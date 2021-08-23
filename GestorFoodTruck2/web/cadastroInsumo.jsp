<%@page contentType="text/html" pageEncoding="UTF-8"%>﻿
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8" />
        <title>Cadastrar Insumo</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="styles/realizar.css" rel="stylesheet"/>
    </head>

    <body>
        <p id="login">
            <%
                String login = (String) session.getAttribute("login");
                if (login == null) {
                    response.sendRedirect("login.jsp");
                }
            %>
        </p>
        <div class="container-fluid">
            <div class="container-fluid border w-50 h-75 mt-3 mb-4" id="head">
                <div class="container-fluid d-flex justify-content-center mt-4">
                    <h2>Cadastro de Insumo</h2><br>  
                </div>
                <div class="container-fluid mt-2 mr-4">
                    <form action="recebeItemEstoque.jsp" method="POST">
                        <p class="font-weight-bold">
                            <%                        if (request.getParameter("pmensagem") != null)
                                    out.write(request.getParameter("pmensagem"));
                            %>
                        </p>
                        <div class="container">
                            <div class="box">

                                <div class="itens">
                                    <label class="form-label">Nome do Item</label>
                                    <input type="text" maxlength="20" class="form-control" name="descInsumo" placeholder="Nome do Insumo"> <br>

                                    <label class="form-label">Custo Insumo</label>
                                    <input type="text" maxlength="6" class="form-control" name="custoInsumo" placeholder="Preço do produto"> <br>

                                    <label class="form-label">Saldo em Estoque</label> <br>
                                    <input type="text" maxlength="6" class="form-control" name="sldEstoque" placeholder="Saldo em estoque"> <br>

                                    <label class="form-label">Unidade de Medida</label> <br>
                                    <input type="text" maxlength="20" class="form-control" name="undMedida" placeholder="Unidade de Medida"> <br>

                                    <label class="form-label">Quantidade para Est. Alerta</label> <br>
                                    <input type="text" maxlength="6" class="form-control" name="qtdEstqAlerta" placeholder="Estoque de Alerta"> <br>

                                    <div class="text-center mb-3">
                                        <a href="functions.jsp" class="btn btn-primary">Início</a>
                                        <input type="button" value="Salvar" onclick="enviarDados()" class="btn btn-success" />
                                        <input type="reset" value="Cancelar" class="btn btn-danger"/>

                                    </div>
                                </div> 
                            </div>
                    </form>  


                    <script>
                        function enviarDados() {

                            var descInsumo = document.getElementsByName("descInsumo");
                            if (descInsumo[0].value === "") {
                                descInsumo[0].focus();
                                alert("Informe o Nome do produto");
                                exit();
                            }

                            var custoInsumo = document.getElementsByName("custoInsumo");
                            if (custoInsumo[0].value === "") {
                                valorItem[0].focus();
                                alert("Informe o Preço do produto");
                                exit();
                            }

                            var sldEstoque = document.getElementsByName("sldEstoque");
                            if (sldEstoque[0].value === "") {
                                sldEstoque[0].focus();
                                alert("Informe o saldo em estoque");
                                exit();
                            }

                            var undMedida = document.getElementsByName("undMedida");
                            if (undMedida[0].value === "") {
                                undMedida[0].focus();
                                alert("Informe a unidade de medida");
                                exit();
                            }

                            var qtdEstqAlerta = document.getElementsByName("qtdEstqAlerta");
                            if (qtdEstqAlerta[0].value === "") {
                                qtdEstqAlerta[0].focus();
                                alert("Informe o estoque de alerta");
                                exit();
                            }


                            document.forms[0].submit();
                        }

                    </script>  
                    </body>
                    </html>
