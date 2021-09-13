<%@page import="modelos.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclui Mesa</title>
    </head>
    <body>
        <%
            String codMetodo = request.getParameter("codPagto");
            Administrador m = new Administrador();
            if (codMetodo != null) {
                m = m.consultarMetodoPagamento(Integer.parseInt(codMetodo));
                if (m.excluiMetodoPagamento()) {
                    response.sendRedirect("consultaMetodoPagamento.jsp?pmensagem=Forma de pagamento excluida com sucesso");
                } else {
                    response.sendRedirect("consultaMesas.jsp?pmensagem=Erro ao excluir forma de pagamento");
                }
            }
        %>
    </body>
</html>
