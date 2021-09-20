<%@page import="modelos.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <!--Requerimento do código vindo da consulta para exclusão-->
        <%
            String codMetodo = request.getParameter("codPagto");
            Administrador m = new Administrador();
            if (codMetodo != null) {
                m = m.consultarMetodoPagamento(Integer.parseInt(codMetodo));
                if (m.excluiMetodoPagamento()) {
                    response.sendRedirect("consultaMetodoPagamento.jsp?pmensagem=Metodo de pagamento excluido com sucesso");
                } else {
                    response.sendRedirect("consultaMetodoPagamento.jsp?pmensagem=ERRO AO EXCLUIR. FORMA DE PAGAMENTO ATRELADA AO RELATORIO. CASO TENHA DUVIDAS, NOS CONTATE NO CHAT.");
                }
            }
        %>
    </body>
</html>
