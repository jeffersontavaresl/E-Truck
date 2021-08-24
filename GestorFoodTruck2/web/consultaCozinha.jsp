<%@page import="java.util.List"%>
<%@page import="modelos.Cozinha"%>
<%@page import="modelos.PedidoCliente"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta da Cozinha</title>
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
            Cozinha coz = new Cozinha();
            List<Cozinha> cz = coz.lovPedidosCoz("andamento");

        %>

        <div class="container-fluid">
            <table class="tabela table table-borderless table-striped rounded-1">
                <thead>
                    <tr>
                        <th>Mesa</th>
                        <th>Produto</th>
                        <th>Observação</th>
                        <th>Atualizar</th>
                    </tr>
                </thead>
                <tbody>
                <form action="atualizaPedido.jsp" method="POST">
                    <tr>
                        <% for (Cozinha c : cz) {%>
                                                <td><%out.write(c.getMesa());  %></td>
                        <td><%out.write(c.getDescProduto());  %></td>
                        <td><%out.write(c.getObservacao());  %></td>
                        <td><%out.write("<a href=atualizaPedido.jsp?codpedido=" + c.getCodPedido() + "&statusPedido=" + c.getStatusPedido() + ">Atualizar Status</a>");%></td>
                        <td><%c.getCodMesa();%></td> 
                        <td><% c.getCodProduto();%></td>  
                        <td><% c.getCodPedido();%></td>                        
                        </tr> 
                    <%}%>
                    </tbody>
                </form>
            </table>
        </div>
    </body>
</html>
