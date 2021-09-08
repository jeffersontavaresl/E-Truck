<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>E-Truck / Funções</title>
        <!-- Icone da Página-->
        <link rel="icon" type="image/x-icon" href="styles/imagens/favicon.ico" />
        <!-- Bootstrap e Botões-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="styles/functions.css" rel="stylesheet"/>
        <link href="styles/functions02.css" rel="stylesheet"/>
	<link href="styles/realizar.css" rel="stylesheet"/>
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->

            <div class="bg-padrao border-end" id="sidebar-wrapper">
                <div class="bg-padrao sidebar-heading" id="etruck">E-Truck<br></div>

                <div class="bg-padrao list-group list-group-flush">
		    <a class="dropdown-btn p-3 mt-1 btn-funcoes" href="functions.jsp"><i class="fas fa-home"></i> Início</a>
                    <a class="dropdown-btn p-3 mt-1 btn-funcoes" href="#!"><i class="fas fa-solid fa-user"></i> Garçom</a>
                    <div class="dropdown-container">
                        <a class="list-group-item p-3 btn-funcoes-drop" href="realizarPedido.jsp">Realizar Pedido</a>
                        <a class="list-group-item p-3 btn-funcoes-drop" href="consultapedido.jsp">Consultar Pedido</a>
                    </div>

                    <a class="dropdown-btn p-3 mt-1 btn-funcoes" href="#!"><i class="fas fa-solid fa-utensils"></i> Cozinha</a>
                    <div class="dropdown-container">
                        <a class="list-group-item p-3 btn-funcoes-drop" href="consultaCozinha.jsp">Consulta Cozinha</a>


                    </div>

                    <a class="dropdown-btn p-3 mt-1 btn-funcoes" href="#!"><i class="fas fa-solid fa-cash-register"></i> Caixa</a>
                    <div class="dropdown-container">
                        <a class="list-group-item p-3 btn-funcoes-drop" href="consultacaixa.jsp">Finalizar Pedido</a>
                    </div>

                    <a class="dropdown-btn p-3 mt-1 btn-funcoes" href="#!"><i class="fas fa-solid fa-clipboard"></i> Cardápio</a>
                    <div class="dropdown-container">
                        <a class="list-group-item p-3 btn-funcoes-drop" href="cadastraItem.jsp">Adicionar Item</a>
                        <a class="list-group-item p-3 btn-funcoes-drop" href="consultaItem.jsp">Consultar Itens</a>
                    </div>

                    <a class="dropdown-btn p-3 mt-1 btn-funcoes" href="#!"><i class="fas fa-solid fa-table"></i> Mesa</a>
                    <div class="dropdown-container">
                        <a class="list-group-item p-3 btn-funcoes-drop" href="cadastraMesa.jsp">Cadastrar Mesa</a>
                        <a class="list-group-item p-3 btn-funcoes-drop" href="consultaMesas.jsp">Consultar Mesa</a>
                    </div>

                    <a class="dropdown-btn p-3 mt-1 btn-funcoes" href="#!"><i class="fas fa-solid fa-cart-arrow-down"></i> Insumo</a>
                    <div class="dropdown-container">
                        <a class="list-group-item p-3 btn-funcoes-drop" href="cadastroInsumo.jsp">Cadastrar Estoque</a>
                        <a class="list-group-item p-3 btn-funcoes-drop" href="consultaInsumo.jsp">Consultar Estoque</a>
                        <a class="list-group-item p-3 btn-funcoes-drop" href="realizarPedFornecedor.jsp">Realizar Pedido Fornecedor</a>
                        <a class="list-group-item p-3 btn-funcoes-drop" href="consultaPedFornecedor.jsp">Consultar Pedido Fornecedor</a>
                    </div>

                    <a class="dropdown-btn p-3 mt-1 btn-funcoes" href="#!"><i class="fas fa-solid fa-user-tie"></i> Administrador</a>
                    <div class="dropdown-container">
                        <a class="list-group-item p-3 btn-funcoes-drop" href="cadastraFornecedor.jsp">Cadastrar Fornecedor</a>
                        <a class="list-group-item p-3 btn-funcoes-drop" href="consultaAlertaEstq.jsp">Estoque em Alerta</a>
                        <a class="list-group-item p-3 btn-funcoes-drop" href="consultaForn.jsp">Consulta Fornecedor</a>
                        <a class="list-group-item p-3 btn-funcoes-drop" href="consultaRelatorio.jsp">Relatório de Pagamentos</a>
                    </div>
                    <br><br><br>
                    <p id="login">
                        <%
                            String login = (String) session.getAttribute("login");
                            if (login == null) {
                                response.sendRedirect("login.jsp");
                            } else {
                                out.print("Bem vindo," + login + "<br/>");
                            }
                        %>
                    </p>

                </div>
            </div>
            <div id="page-content-wrapper">
                <!-- Conteúdo da Página-->
                <div class="container-fluid">
            <button class="btn btn-primary" id="sidebarToggle">Menu</button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent"></div>
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
                    </form>
                </div>
            </div>
        </div>
            </div>
        </div>


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

        <!--JS - SIDEBAR-->
        <script src="js/sidebar.js"></script>
        <script src="js/scripts.js"></script>

        <!--FONT AWESOME-->
        <script src="https://kit.fontawesome.com/941d2c80e7.js" crossorigin="anonymous"></script>
    </body>
</html>
