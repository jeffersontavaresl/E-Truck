<%@page import="modelos.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <!--Requerimento do código vindo da consulta para exclusão-->
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
