<%@page import="java.util.List"%>
<%@page import="modelos.Cozinha"%>
<%@page import="modelos.PedidoCliente"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta da Cozinha</title>
        <link rel="stylesheet" href="styles/estilos.css"> 
    </head>
    <header>

        <style>     

            table, th, td {
                border: 1px solid black;
            }

            table {
                width: 35%;
            }

            td{
                text-align: center;
            }
        </style>

    </header>

    <body>
        <p><a href="functions.jsp">Voltar</a></p>
        <h1>Consulta Cozinha</h1>
        <hr />
        <%
            Cozinha coz = new Cozinha();
            List<Cozinha> cz = coz.lovPedidosCoz("andamento");

        %>

        <table>
            <thead>
                <tr>
                    <th>Mesa</th>
                    <th>Produto</th>
                    <th>Observação</th>
                    <th>Produto</th>
                    <th>Editar</th>
                    <th>Excluir</th>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <% for (Cozinha c : cz) {%>
                    <td><%out.write("" + c.getCodMesa());  %></td> 
                    <td><%out.write("" + c.getCodProduto());  %></td> 
                    <td><%out.write(c.getObservacao());  %></td> 
                    <td><%out.write(c.getDescProduto());  %></td> 
                    <td><%out.write("<a href=editaCozinha.jsp?observacao=" + c.getObservacao() + ">Editar</a>");%></td> 
                    <td><%out.write("<a href=excluCozinha.jsp?observacao=" + c.getObservacao() + ">Excluir</a>");%></td>
                </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>
