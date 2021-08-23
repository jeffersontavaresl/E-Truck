<%@page import="java.util.List"%>
<%@page import="modelos.Cardapio"%>
<%@page import="modelos.PedidoCliente"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta dos Pedidos</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="styles/tabelas.css">
    </head>
    <p id="login">
        <%
            String login = (String) session.getAttribute("login");
            if (login == null) {
                response.sendRedirect("login.jsp");
            }
        %>
    </p>
    <body>
        <%
            PedidoCliente pcli = new PedidoCliente();
            List<PedidoCliente> ped = pcli.consultaPedido("andamento");
        %>
        <div class="container-fluid">
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
                        <td><%out.write("<a href=editaPedido.jsp?codPedido=" + pc.getCodPedido() + ">Editar</a>");%></td> 
                        <td><%out.write("<a href=cancelarPedido.jsp?codPedido=" + pc.getCodPedido() + ">Excluir</a>");%></td>
                    </tr> 
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
