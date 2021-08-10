<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.PedidoCliente"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Realizar Pedido</title>
    </head>
    <body>
        <h1>Realizar Pedido</h1>

        <%
            PedidoCliente pcli = new PedidoCliente();
            List<PedidoCliente> pclientes = pcli.lovMesa();

        %>

        <form action="recebeRealizarPedido.jsp" method="POST">
            <label>Código da mesa<br></label>
            <select name="codmesa">
                <% for (PedidoCliente pc : pclientes) {%>
            </select>
            <label>Código do produto<br></label>
            <input type="text" name="codProduto" placeholder="Insira o código do produto" required><br><br>
            <label>Observação<br></label>
            <input type="text" name="observacao" placeholder="Observação: " required><br><br>
            <label>Status do Pagamento<br></label>
            <input type="text" name="statusPagto" placeholder="Status do pagamento" required><br><br>
            <label>Status do Pedido<br></label>
            <input type="text" name="statusPedido" placeholder="Status do pedido" required>
        </form>
    </body>
</html>
