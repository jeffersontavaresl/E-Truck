<%@page import="java.util.List"%>
<%@page import="modelos.Cardapio"%>
<%@page import="modelos.PedidoCliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>E-Truck Management - Consultar Pedidos</title>
        <!--FAVOICON-->
        <link rel="icon"  type="image/gif" href="styles/imagens/hamburger-solid.svg">
        <!-- Bootstrap e Botões-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="styles/functions.css" rel="stylesheet"/>
        <link href="styles/functions02.css" rel="stylesheet"/>
        <link rel="stylesheet" href="styles/tabelas.css">
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="bg-padrao border-end" id="sidebar-wrapper">
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
                        <a class="list-group-item p-3 btn-funcoes-drop" href="cadastroMetodoPagamento.jsp">Cadastrar Forma de Pagamento</a>
                        <a class="list-group-item p-3 btn-funcoes-drop" href="consultaMetodoPagamento.jsp">Consultar Formas de Pagamento</a>
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
                <%
                    PedidoCliente pcli = new PedidoCliente();
                    List<PedidoCliente> ped = pcli.consultaPedido("andamento");
                %>
                <div class="container-fluid">
                    <button class="btn btn-primary" id="sidebarToggle">Menu</button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent"></div>
                    <table class="tabela table table-borderless table-striped rounded-1">
                        <thead>
                            <tr>
                                <th>Mesa</th>
                                <th>Código do pedido</th>
                                <th>Código do produto</th>
                                <th>Produto</th>
                                <th>Observação</th>
                                <th>Status do Pagamento</th>
                                <th>Status do Pedido</th>
                                <th>Editar</th>
                                <th>Excluir</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (PedidoCliente pc : ped) { %>
                            <tr>
                                <td><% out.print("" + pc.getMesa());   %></td>
                                <td><% out.write("" + pc.getCodPedido());   %></td>
                                <td><% out.write("" + pc.getCodProduto());   %></td>
                                <td><%out.write(pc.getDescProduto());  %></td>
                                <td><%out.write(pc.getObservacao()); %></td>   
                                <td><%out.write(pc.getStatusPagto()); %></td>   
                                <td><%out.write(pc.getStatusPedido()); %></td>   

                                <!--EDITAR INSUMO-->
                                <td><%out.write("<a class='btn' href=editaPedido.jsp?codPedido=" + pc.getCodPedido() + ">" + "<i class='far fa-edit'       style='color:blue'></i></a>");%></td>

                                <!--BOTÃO QUE INICIA O MODAL DE EXCLUSÃO DO INSUMO-->
                                <td><button type="button" class="btn" data-toggle="modal" data-target="#excluirDados" onclick="nrExcluir(<%out.write("" + pc.getCodPedido());%>)">
                                        <i class='far fa-trash-alt'  style='color:red'></i>  
                                    </button>

                                    <!--MODAL EXCLUSÃO DE ITEM-->
                                    <div class="modal fade" id="excluirDados" tabindex="-1" role="dialog" aria-labelledby="modalExclusao" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="modalExclusao">Deseja excluir o pedido?</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                    <a class="btn text-white" style="background-color:rgb(58, 42, 148)" id="confirmar">Excluir</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            function nrExcluir(pedido) {
                var link = document.getElementById("confirmar");
                link.href = "cancelarPedido.jsp?codPedido=" + pedido;
            }
        </script>
        <!--JS - SIDEBAR-->
        <script src="js/sidebar.js"></script>
        <script src="js/scripts.js"></script>

        <!--FONT AWESOME-->
        <script src="https://kit.fontawesome.com/941d2c80e7.js" crossorigin="anonymous"></script>

        <!--JQUERY E POPPER.JS-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
