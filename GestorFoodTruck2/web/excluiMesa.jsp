<%@page import="modelos.Mesa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclui Mesa</title>
    </head>
    <body>
        <%
            String idMesa = request.getParameter("codmesa");
            Mesa m = new Mesa();
            if (idMesa != null) {
                m = m.consultaMesa(Integer.parseInt(idMesa));
                if (m.excluiMesa()) {
                    response.sendRedirect("consultaMesas.jsp?pmensagem=Mesa excluida com sucesso");
                } else {
                    response.sendRedirect("consultaMesas.jsp?pmensagem=ERRO AO EXCLUIR MESA. A MESA ESTA ATRELADA AO SISTEMA. CASO TENHA DUVIDAS, NOS CONTATE NO CHAT!");
                }
            }
        %>       
    </body>
</html>
