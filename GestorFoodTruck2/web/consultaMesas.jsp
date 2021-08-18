<%@page import="java.util.List"%>
<%@page import="modelos.Mesa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Mesas</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <link rel="stylesheet" href="styles/tabelas.css">
    </head>
    <body>
        <%
            Mesa mesa = new Mesa();
            List<Mesa> lista = mesa.lovMesa();
        %>
        <div class="container-fluid">
            <table class="tabela table table-borderless table-striped rounded-1">
                <thead>
                    <tr>
                        <th>Código da mesa</th>
                        <th>Nome da mesa</th> 
                        <th>Editar</th>
                        <th>Excluir</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Mesa m : lista) { %>
                    <tr>
                        <td><%  out.write("" + m.getCodmesa());   %></td>
                        <td><% out.write(m.getMesa());  %></td>   
                        <td><%out.write("<a href=editaMesa.jsp?codmesa=" + m.getCodmesa() + ">Editar</a>");%></td> 
                        <td><%out.write("<a href=excluiMesa.jsp?codmesa=" + m.getCodmesa() + ">Excluir</a>");%></td> 
                    </tr> 
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
