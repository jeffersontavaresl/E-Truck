<%@page import="modelos.Cardapio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclui Mesa</title>
    </head>
    <body>
        <%
            String codProduto = request.getParameter("codProduto");
            Cardapio c = new Cardapio();
            if (codProduto != null) {
                c = c.consultarItem(Integer.parseInt(codProduto));
                if (c.excluirItem()) {
                    response.sendRedirect("consultaItem.jsp?pmensagem=Item excluido com sucesso");
                } else {
                    response.sendRedirect("consultaItem.jsp?pmensagem=Erro ao excluir item");
                }
            }
        %>
    </body>
</html>
