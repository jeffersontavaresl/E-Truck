<%@page import="java.util.List"%>
<%@page import="modelos.Cardapio"%>
<%@page import="modelos.PedidoCliente"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta dos Pedidos</title>
        <link rel="stylesheet" href="styles/estilos.css"> 
    </head>
    <body>
        <div class="container-fluid border w-50 h-75 mt-3 mb-4" id="head">
            <div class="container-fluid d-flex justify-content-center mt-4">
        <p><a href="functions.jsp">Voltar</a></p>
        <h1>Consulta Itens</h1>
        <hr />
        <%
            PedidoCliente pcli = new PedidoCliente();
            List<PedidoCliente> ped = pcli.consultaPedido("andamento");
        %>
        </div>
        <div class="container-fluid mt-2 mr-4">
        <table>
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
                   
                    <td><% out.print(""+pc.getMesa());   %></td>
                    <td><% out.write("" + pc.getCodPedido());   %></td>
                    <td><% out.write("" + pc.getCodProduto());   %></td>
                    <td><%out.write(pc.getDescProduto());  %></td>
                    <td><%out.write(pc.getObservacao()); %></td>   
                    <td><%out.write(pc.getStatusPagto()); %></td>   
                    <td><%out.write(pc.getStatusPedido()); %></td>   
                    <td><%out.write("<a href=editaPedido.jsp?codPedido="+pc.getCodPedido()+">Editar</a>");%></td> 
                    <td><%out.write("<a href=cancelarPedido.jsp?codPedido="+pc.getCodPedido()+">Excluir</a>");%></td>
                </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>
