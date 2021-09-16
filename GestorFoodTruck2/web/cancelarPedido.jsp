<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.PedidoCliente"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-truck Management - Cancelar Pedido</title>
        <!--FAVICON-->
        <link rel="icon"  type="image/gif" href="styles/imagens/hamburger-solid.svg">
    </head>
    <body>
        <!-- Recebe os dados da página para excluir um pedido realizado -->
        <h1>Cancelar item do pedido</h1>
        <%
            String codPedido = request.getParameter("codPedido");
            PedidoCliente pedcliente = new PedidoCliente();
            if (codPedido != null) {
                pedcliente.consultarPedido(Integer.parseInt(codPedido));
                if (pedcliente.cancelarPedido(Integer.parseInt(codPedido))) {
                    response.sendRedirect("consultapedido.jsp?pmensagem=Pedido excluido com sucesso");
                } else {
                    response.sendRedirect("consultapedido.jsp?pmensagem=Erro ao excluir pedido");
                }
            }
        %>
    </body>
</html>
