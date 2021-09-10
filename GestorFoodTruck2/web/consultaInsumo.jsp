<%@page import="java.util.List"%>
<%@page import="modelos.Insumo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>E-Truck Management - Consultar Insumos</title>
        <!-- Icone da Página-->
        <link rel="icon" type="image/x-icon" href="styles/imagens/favicon.ico" />
        <!-- Bootstrap e Botões-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="styles/functions.css" rel="stylesheet"/>
        <link href="styles/functions02.css" rel="stylesheet"/>
        <link rel="stylesheet" href="styles/tabelas.css">
    </head>
            <style>
    .msg-popup2 {
        z-index: 10;
        width: 20%;
        height: 15vh;
        margin-left:  700px;
        margin-right: 400px;
        top: 250px;
        background-color: rgb(58, 42, 200);
        display: none;
        position: absolute;
        border: 2px solid #b2b2b2;
        -webkit-border-radius: 15px;
        border-radius: 10px;
        -webkit-box-shadow: 0px 1px 4px 0px rgba(43, 40, 40, 0.6) inset;
        box-shadow: 0px 1px 4px 0px rgba(43, 40, 40, 0.6) inset;
        -webkit-transition: all 0.2s linear;
        transition: all 0.2s linear;       
        }
    </style>
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
                <%
                    Insumo insumo = new Insumo();
                    List<Insumo> lista = insumo.lovItem();
                %>
                <div class="container-fluid">
                    <button class="btn btn-primary" id="sidebarToggle">Menu</button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent"></div>
                    <table class="tabela table table-borderless table-striped rounded-1">
                        <thead>
                            <tr>
                                <th>Código do produto</th>
                                <th>Nome do produto</th>
                                <th>Saldo em Estoque</th>
                                <th>Qtde de Estoque Alerta</th>
                                <th>Und de Medida</th>
                                <th>Valor</th>
                                <th>Editar</th>
                                <th>Excluir</th>

                            </tr>
                        </thead>
                        <tbody>
                            <% for (Insumo c : lista) { %>
                            <tr>
                                <td><% out.write("" + c.getCodInsumo());   %></td>
                                <td><% out.write(c.getDescInsumo());  %></td>
                                <td><% out.write("" + c.getSldEstqInsumo()); %></td>
                                <td><% out.write("" + c.getQtdEstqAlerta()); %></td>
                                <td><% out.write(c.getUndMedida()); %></td>
                                <td><% out.write("R$" + c.getCustoInsumo()); %></td>
                                <td><%out.write("<a href=editaInsumo.jsp?codInsumo=" + c.getCodInsumo() + ">" + "<i class='far fa-edit'       style='color:blue'></i></a>");%></td> 
                                <td>
                                    <a type="button" id="botaoexcluir" 
                                        onclick="mostrarExclusao(<%out.write("" + c.getCodInsumo());%>)">
                                        <i class='far fa-trash-alt' style='color:red'></i> 
                                    </a>
                                </td>   
                            </tr> 
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- POP UP DE CONFIRMAÇÃO DE EXCLUSÃO -->                
        
        <div class="msg-popup2">
            <h5 class="text-center" style="color: #ffffff; font-family: arial-bold ">EXCLUSÃO</h5>
            <h5 class="text-center" style="color: #ffffff;">Confirma a <b>exclusão</b>?</h5>
            <div class="text-center">                
                <a href=""><button class="btn btn-dark" click="cancela()"> Não </button></a>
                <a id="exclui" href="#"><button class="btn btn-danger" id="excluir"> Sim </button></a>                    
            </div>
        </div>       
        <script>
            function cancela() {
                document.getElementsByClassName("msg-popup2")[0].style.display = "none";
            }
        
            function mostrarExclusao(insumo) {
                document.getElementsByClassName("msg-popup2")[0].style.display = "block";
                var link = document.getElementById("exclui");
                link.href = "excluiInsumo.jsp?codInsumo=" + insumo;
            }
        </script> 
        
        <!--JS - SIDEBAR-->
        <script src="js/sidebar.js"></script>
        <script src="js/scripts.js"></script>

        <!--FONT AWESOME-->
        <script src="https://kit.fontawesome.com/941d2c80e7.js" crossorigin="anonymous"></script>
    </body>
</html>
