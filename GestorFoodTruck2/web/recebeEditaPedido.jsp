<%@page import="modelos.PedidoCliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>    
        <!-- Recebe os dados da página HTML -->
        <%
            int codPedido = Integer.parseInt(request.getParameter("codPedido"));
            int codProduto = Integer.parseInt(request.getParameter("codProduto"));
            String obsPedido = request.getParameter("obsPedido");

            PedidoCliente pc = new PedidoCliente();
            pc.setCodProduto(codProduto);
            pc.setObservacao(obsPedido);
            pc.setCodPedido(codPedido);

            if (pc.alterarPedido(codPedido)) {
                response.sendRedirect("consultapedido.jsp?pmensagem=Pedido alterado com sucesso");
            } else {
                response.sendRedirect("consultapedido.jsp?pmensagem=Falha ao editar pedido");
            }
        %>       
    </body>
</html>
