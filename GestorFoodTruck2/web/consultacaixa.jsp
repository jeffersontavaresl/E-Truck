<%@page import="java.math.RoundingMode"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelos.PedidoCliente"%>
<%@page import="modelos.Cardapio"%>
<%@page import="modelos.Caixa"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.math.BigDecimal"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>E-Truck Management - Caixa</title>
        <!--FAVOICON-->
        <link rel="icon"  type="image/gif" href="styles/imagens/hamburger-solid.svg">
        <!-- Bootstrap e BotÃµes-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="styles/functions.css" rel="stylesheet"/>
        <link href="styles/functions02.css" rel="stylesheet"/>
        <link rel="stylesheet" href="styles/consulta.css">
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
                <!-- ConteÃºdo da PÃ¡gina-->
                <div class="container-fluid">
                    <button class="btn btn-primary" id="sidebarToggle">Menu</button>                
                    <div class="collapse navbar-collapse" id="navbarSupportedContent"></div>
                    <%
                        List<Caixa> caixas = new ArrayList();
                        String codmesa = request.getParameter("idmesa");
                        String statusPagto = "pendente";
                        int idmesa = 0;
                        if (codmesa != null) {
                            Caixa caixa = new Caixa();
                            idmesa = Integer.parseInt(codmesa);
                            caixas = caixa.consultaPedido(idmesa, statusPagto);
                        }
                    %>
                    <form action="consultacaixa.jsp" method="POST">
                        <%
                            PedidoCliente pedcliente = new PedidoCliente();
                            Caixa caixa = new Caixa();
                            List<PedidoCliente> mesas = pedcliente.lovMesa();
                        %>
                        <div class="principal">
                            <div class="consultarMesa">                    
                                <select name="idmesa" style="width: 95px;">
                                    <% for (PedidoCliente m : mesas) { %>
                                    <option value="<%out.write("" + m.getCodMesa());%>">
                                        <% out.write(m.getMesa());%>
                                    </option>
                                    <%}%>
                                </select> 
                                <input type="submit" value="Consultar" class="btn btn-primary"/>
                                </form>
                            </div>
                            <table class="TBcaixa">
                                <thead>
                                <th>Cod Produto</th>
                                <th>Produto</th>
                                <th>Status Pagamento</th>
                                <th>Valor</th>
                                </thead>
                                <tbody>
                                    <% int mesa = 0;
                                        String status = "";
                                    %>
                                    <% for (Caixa c : caixas) {%>
                                    <tr>
                                        <td><% out.write("" + c.getCodProduto()); %></td>
                                        <td><% out.write(c.getDescProduto()); %></td>
                                        <td><% out.write(c.getStatusPagto()); %></td>
                                        <td><% out.print("R$" + c.getVlrTotal());%></td>
                                        <% mesa = c.getCodMesa(); %>
                                        <% status = c.getStatusPagto(); %>
                                    </tr> 
                                    <%}%>
                                    <%
                                        float vlrTotal = 0;
                                        for (Caixa c : caixas) {
                                            float vlrUnd = c.getVlrTotal();
                                            vlrTotal += vlrUnd;
                                        }
                                        BigDecimal bd = new BigDecimal(vlrTotal).setScale(3, RoundingMode.HALF_EVEN);
                                    %>                               
                                </tbody>
                            </table>
                            <div class="PGcaixa">
                                <h3 class="vlrTotal"><%out.write("Valor Total: R$" + bd.doubleValue());%></h3>
                            </div>  
                        </div>                           
                        <main class="formpag">
                            <%
                                List<Caixa> forms = caixa.lovPagtos();
                            %>
                            <div class="divpag">
                                <form action="finalizarPedido.jsp" method="POST" class="tpPagForm">
                                    <select hidden type="text" name="codmesa" class="form-control">
                                        <option value="<%out.write("" + mesa);%>">
                                            <% out.write("" + mesa);%>
                                        </option>
                                    </select>
                                    <select hidden type="text" name="statusPagto" class="form-control">
                                        <option value="<%out.write(status);%>">
                                            <% out.write(status);%>
                                        </option>
                                    </select>
                                    <label><b>Data do pagamento</b></label>
                                    <input type="date" required name="data" id="dat"> <br>

                                    <label><b>Valor Pago</b></label>
                                    <input type="text" required maxlength="10" class="form-control" name="vlrTotal"
                                           value="<%out.write("" + bd.doubleValue());%>" />                            
                                    <br>

                                    <label><b>Forma de Pagamento</b></label>
                                    <select name="formPagto" class="form-control">
                                        <% for (Caixa c : forms) {%>
                                        <option value="<%out.write("" + c.getCodFormPagto());%>">
                                            <% out.write(c.getDescFormPagto());%>
                                            <% out.write(c.getDescBandeira());%>
                                        </option>
                                        <%}%>
                                    </select><br>
                                    <button class="btn btn-primary" onclick="enviarDados()" >Finalizar</button>
                                </form>  
                                </br>
                                <!-- Calculadora do troco -->
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                                    Troco
                                </button>

                                <!-- MODAL PARA CALCULAR TROCO -->
                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Calcular Troco</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="calcular">
                                                    Valor Recebido:<input id="num1" type="number">
                                                    <br />
                                                    <select  hidden type="number" id="num2" class="form-control">
                                                        <option value="<%out.write("" + bd.doubleValue());%>"> 
                                                            <% out.write("" + bd.doubleValue());%>
                                                        </option>
                                                    </select>
                                                    <input hidden type="radio" checked name="vlrTotal" id="subtracao"/>
                                                    Troco: R$<div id="resp"></div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary" onclick="main()" >Calcular</button>
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>  
                            <!-- Fim Calculadora -->  
                            </div>
                        </main>
                        <script>
                            function enviarDados() {
                                var data = document.getElementsByName("data");
                                if (data[0].value === "") {
                                    data[0].focus();
                                    alert("Informe a data");
                                    exit();
                                }

                                var vlrTotal = document.getElementsByName("vlrTotal");
                                if (vlrTotal[0].value === "") {
                                    vlrTotal[0].focus();
                                    alert("Informe o valor total");
                                    exit();
                                }

                                var formPagto = document.getElementsByName("formPagto");
                                if (formPagto[0].value === "") {
                                    formPagto[0].focus();
                                    alert("Informe a forma de pagamento");
                                    exit();
                                }

                                var codmesa = document.getElementsByName("codmesa");
                                if (codmesa[0].value === "") {
                                    codmesa[0].focus();
                                    alert("Informe a mesa");
                                    exit();
                                }

                                var statusPagto = document.getElementsByName("statusPagto");
                                if (statusPagto[0].value === "") {
                                    statusPagto[0].focus();
                                    alert("Informe o stauts");
                                    exit();
                                }

                                document.forms[0].submit();
                            }

                            document.getElementById('dat').value = new Date().toISOString().substring(0, 10);

                            //Função para calcular o troco
                            function main()
                            {
                                var resp = document.getElementById('resp');
                                var num1 = parseFloat(document.getElementById("num1").value);
                                var num2 = parseFloat(document.getElementById("num2").value);
                                var texto = '';


                                if (document.getElementById('subtracao').checked)
                                    texto = subtracao(num1, num2);

                                resp.innerHTML = texto;
                            }

                            function subtracao(x, y)
                            {

                                return (x - y);
                            }
                        </script>  
                </div>
            </div>

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
