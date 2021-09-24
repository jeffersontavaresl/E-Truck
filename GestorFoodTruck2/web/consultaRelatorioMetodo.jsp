<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Caixa"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.math.RoundingMode"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>E-truck Management - Consultar Relatório</title>
        <!--FAVICON-->
        <link rel="icon"  type="image/gif" href="styles/imagens/hamburger-solid.svg">
        <!-- Bootstrap e Botões-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <link rel="stylesheet" href="styles/caixa.css">
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
                    <!-- Verifica se o usuário está logado -->
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
                <!-- Conteúdo da página -->
                <div class="container-fluid">
                    <button class="btn btn-primary" id="sidebarToggle">Menu</button>
                    <%
                        List<Caixa> caixas = new ArrayList();
                        String data = request.getParameter("data");
                        String tipoPagto = request.getParameter("codformpagto");
                        if ((data != null) && (tipoPagto != null)) {
                            Caixa caixa = new Caixa();
                            Date dataa = Date.valueOf(data);
                            int codFormPagto = Integer.parseInt(tipoPagto);
                            caixas = caixa.gerarRelatorioMetodo(dataa, codFormPagto);
                        }
                        Caixa caixa = new Caixa();
                        List<Caixa> tipos = caixa.lovPagtos();
                    %>
                    <form action="consultaRelatorioMetodo.jsp" method="POST">
                        <div class="consultarMesa">
                            <label>Data do pagamento</label> <br>
                            <input type="date" name="data" required> <br><br>

                            <label>Método de Pagamento</label> <br>
                            <select name="codformpagto" required>
                                <% for (Caixa t : tipos) { %>
                                <option value="<%out.write("" + t.getCodFormPagto());%>">
                                    <% out.write(t.getDescFormPagto());%>
                                    <% out.write(t.getDescBandeira());%>
                                </option>
                                <%}%>
                            </select>  
                            <br><br>
                            <input type="submit" value="Consultar" class="btn btn-success"/>
                            <a class="btn btn-primary mt-2 mb-2" href="consultaRelatorio.jsp">Consulta Geral</a>
                        </div>
                    </form>
                    <table class="tabela table table-borderless table-striped rounded-1">
                        <thead>
                        <th>Data do Pagamento</th>
                        <th>Forma de Pagamento</th>
                        <th>Bandeira</th>
                        <th>Valor Pago</th>            
                        </thead>
                        <tbody class="produtos">
                            <% for (Caixa c : caixas) {%>
                            <tr>
                                <td><% out.write("" + c.getDataMovimento()); %></td>
                                <td><% out.write(c.getDescFormPagto()); %></td>
                                <td><% out.print(c.getDescBandeira());%></td>
                                <td><% out.write("R$" + c.getVlrTotal()); %></td>
                            </tr> 
                            <%}%>
                            <%
                                /* Loop para calcular o valor total */
                                float vlrTotal = 0;
                                for (Caixa c : caixas) {
                                    float vlrUnd = c.getVlrTotal();
                                    vlrTotal += vlrUnd;
                                }
                                /* Função para ajustar o valor total para duas casas decimais */
                                BigDecimal bd = new BigDecimal(vlrTotal).setScale(3, RoundingMode.HALF_EVEN);
                            %>
                        </tbody>
                    </table>
                    <div class="valorTotal">
                        <h3><%out.write("Valor Total: R$" + bd.doubleValue());%></h3>
                    </div>  
                </div>
            </div>
            <!--JS - SIDEBAR-->
            <script src="js/sidebar.js"></script>
            <script src="js/scripts.js"></script>

            <!--FONT AWESOME-->
            <script src="https://kit.fontawesome.com/941d2c80e7.js" crossorigin="anonymous"></script>
    </body>
</html>
