<%@page import="java.util.List"%>
<%@page import="modelos.Cardapio"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cardápio do Food Truck</title>

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
            Cardapio card = new Cardapio();
            List<Cardapio> lista = card.lovCardapio();
        %>
        <div class="container-fluid">
            <table class="tabela table table-borderless table-striped rounded-1">
                <thead>
                    <tr>
                        <th>Código do produto</th>
                        <th>Nome do produto</th>
                        <th>Valor</th>
                        <th>Editar</th>
                        <th>Excluir</th>

                    </tr>
                </thead>
                <tbody>
                    <% for (Cardapio c : lista) { %>
                    <tr>
                        <td><% out.write("" + c.getCodProduto());   %></td>
                        <td><% out.write(c.getDescProduto());  %></td>
                        <td><% out.write("" + c.getPreco()); %></td>   
                        <td><%out.write("<a href=editaItem.jsp?codProduto=" + c.getCodProduto() + ">Editar</a>");%></td> 
                        <td><%out.write("<a href=excluiItem.jsp?codProduto=" + c.getCodProduto() + ">Excluir</a>");%></td>   
                    </tr> 
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
