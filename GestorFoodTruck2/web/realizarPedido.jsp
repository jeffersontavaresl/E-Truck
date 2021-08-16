<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.PedidoCliente"%>
<%@page import="modelos.Cardapio"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>E-Truck - Funções</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="styles/imagens/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="styles/functions.css" rel="stylesheet"/>
        <link href="styles/botoes.css" rel="stylesheet"/>
        <link href="styles/realizar.css" rel="stylesheet"/>
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->

            <div class="border-end  bg-primary" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-primary" id="etruck">E-Truck<br></div>

                <div class="list-group list-group-flush bg-primary">

                    <a class="dropdown-btn p-3 mt-1 btn-funcoes" href="#!">Garçom</a>
                    <div class="dropdown-container">
                        <a class="list-group-item p-3 btn-funcoes-drop" href="realizarPedido.jsp">Realizar Pedido</a>
                        <a class="list-group-item p-3 btn-funcoes-drop" href="consultapedido.jsp">Consultar Pedido</a>
                    </div>

                    <a class="dropdown-btn p-3 mt-1 btn-funcoes" href="#!">Cozinha</a>
                    <div class="dropdown-container">
                        <a class="list-group-item p-3 btn-funcoes-drop" href="atualizaPedido.jsp">Atualizar Pedido</a>
                    </div>

                    <a class="dropdown-btn p-3 mt-1 btn-funcoes" href="#!">Caixa</a>
                    <div class="dropdown-container">
                        <a class="list-group-item p-3 btn-funcoes-drop" href="consultacaixa.jsp">Finalizar Pedido</a>
                    </div>

                    <a class="dropdown-btn p-3 mt-1 btn-funcoes" href="#!">Administrador</a>
                    <div class="dropdown-container">
                        <a class="list-group-item p-3 btn-funcoes-drop" href="#!">nsei</a>
                    </div>
                    
                    <%
                        String login = (String) session.getAttribute("login");
                        if (login == null) {
                            response.sendRedirect("login.jsp");
                        } else {
                            out.print("Bem vindo," + login + "<br/>");
                        }
                        %>

                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- REALIZAR PEDIDO-->
                <div class="container-fluid">
                    <div class="container-fluid border w-50 h-75 mt-3 mb-4" id="head">
                        <div class="container-fluid d-flex justify-content-center mt-4">
                            <h1>Realizar Pedido</h1><br>

                            <%
                                PedidoCliente pcli = new PedidoCliente();
                                List<PedidoCliente> mesas = pcli.lovMesa();

                                Cardapio card = new Cardapio();
                                List<Cardapio> produtos = card.lovCardapio();

                            %>
                        </div>
                        <div class="container-fluid mt-2 mr-4">
                            <form action="recebeRealizarPedido.jsp" method="POST">
                                <p class="font-weight-bold">
                                    <%                        if (request.getParameter("pmensagem") != null)
                                            out.write(request.getParameter("pmensagem"));
                                    %>
                                </p>
                                <label>Código da mesa</label><br>
                                <select name="codMesa" class="form-control">
                                    <% for (PedidoCliente m : mesas) {%>
                                    <option value="<%out.write("" + m.getCodMesa());%>">
                                        <% out.write(m.getMesa());%>
                                    </option>
                                    <%}%>
                                </select><br>

                                <label>Produto</label><br>
                                <select name="codProduto" class="form-control">
                                    <% for (Cardapio p : produtos) {%>
                                    <option value="<%out.write("" + p.getCodProduto());%>">
                                        <% out.write(p.getDescProduto());%>
                                    </option>
                                    <%}%>

                                </select><br>

                                <label>Observação</label><br>
                                <input type="text" name="observacao" class="form-control" placeholder="Insira as observações"><br>

                                <label>Status do Pagamento</label><br>
                                <select name="statusPagto" class="form-control">
                                    <option value="pendente">Pendente</option>
                                </select><br>

                                <label>Status do Pedido</label><br>
                                <select name="statusPedido" class="form-control">
                                    <option value="andamento">Andamento</option>
                                </select><br>
                                <div class="text-center mb-3">
                                    <a href="functions.jsp" class="btn btn-primary">Início</a>
                                    <input type="submit" value="Confirmar" class="btn btn-success"/>
                                    <input type="reset" value="Cancelar" class="btn btn-danger"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </body>

    <script src="js/scripts.js"></script>
</html>
