<%@page import="modelos.Insumo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--FAVICON-->
        <link rel="icon"  type="image/gif" href="styles/imagens/hamburger-solid.svg">
        <title>Insumos</title>
    </head>
    <body>    
        <h1>Itens do Estoque</h1>
        <%
            String idCodInsumo = request.getParameter("codInsumo");
            Insumo i = new Insumo();
            if (idCodInsumo != null) {
                i = i.consultarInsumo(Integer.parseInt(idCodInsumo));
                if (i.excluirItem()) {
                    response.sendRedirect("consultaInsumo.jsp?pmensagem=Insumo excluido com sucesso.");
                } else {
                    response.sendRedirect("consultaInsumo.jsp?pmensagem=Erro ao excluir insumo");
                }
            }
        %>  
    </body>
</html>
