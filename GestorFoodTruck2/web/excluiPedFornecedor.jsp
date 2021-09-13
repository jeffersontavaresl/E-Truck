<%@page import="modelos.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir pedido de fornecedor</title>
    </head>
    <body>
        <%
            String idCodPedFornecedor = request.getParameter("codPedFornecedor");
            Administrador adm = new Administrador();
            if (idCodPedFornecedor != null) {
                adm = adm.consultarPedidoItem(Integer.parseInt(idCodPedFornecedor));
                if (adm.excluirPedidoItem()) {
                    response.sendRedirect("consultaPedFornecedor.jsp?pmensagem=Pedido excluido com sucesso");
                } else {
                    response.sendRedirect("consultaPedFornecedor.jsp?pmensagem=Erro ao excluir pedido");
                }
            }
        %>
    </body>
</html>
