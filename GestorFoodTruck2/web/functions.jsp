<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Truck</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/style.css">

</head>

<body>

    <!--VALIDAÇÃO DE USUÁRIO PARA ENTRADA NO SITE-->
        <%
            String login = (String) session.getAttribute("login");
            if(login == null) {
                response.sendRedirect("login.jsp");
            } else {
                out.print("Bem vindo,"+ login + "<br/>");
            }
        %>
    
    <!-- INÍCIO SIDEBAR -->
    <div class="container-fluid h-100">
        <div class="row h-100">
            <aside class="col-12 col-md-2 p-0 bg-dark">
                <nav class="navbar navbar-expand navbar-dark bg-primary flex-md-column flex-row align-items-start">
                    <div class="collapse navbar-collapse">
                        <ul class="flex-md-column flex-row navbar-nav w-100 justify-content-between">

                            <!-- LINKS SIDEBAR -->
                            <li class="nav-item">
                                <p class="h2" style="border-bottom: 1px solid rgb(255, 217, 217); color:white;">E-Truck</p>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link pl-0" href="index.html">Início</a>
                            </li>
                            <li class="nav-item">
                                <a class="pronto nav-link pl-0" href="realizarPedido.jsp">Realizar Pedido</a>
                            </li>
                            <li class="nav-item">
                                <a class="pronto nav-link pl-0" href="consultapedido.jsp">Consultar Pedido</a>
                            </li>
                            <li class="nav-item">
                                <a class="pronto nav-link pl-0" href="cadastraItem.jsp">Cadastrar Cardápio</a>
                            </li>
                            <li class="nav-item">
                                <a class="pronto nav-link pl-0" href="consultaItem.jsp">Consultar Cardápio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link pl-0" href="consultacaixa.jsp">Consulta Caixa</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link pl-0" href="consultaCozinha.jsp">Consulta Cozinha</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link pl-0" href="deslogarusuario.jsp">Deslogar</a>
                            </li>

                        </ul>
                    </div>
                </nav>
            </aside>
            <main class="col">
            </main>
        </div>
    </div>

    
    

    
</body>

</html>
