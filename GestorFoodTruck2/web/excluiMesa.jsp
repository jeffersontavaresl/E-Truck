<%@page import="modelos.Mesa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclui Mesa</title>
    </head>
    <body>
        <%
            String idMesa = request.getParameter("codmesa");;
            Mesa m = new Mesa();
            if (idMesa != null) {
                m = m.consultaMesa(Integer.parseInt(idMesa));
                if (m.excluiMesa()) {
                    response.sendRedirect("consultaMesas.jsp?pmensagem=Mesa excluido com sucesso");
                } else {
                    response.sendRedirect("consultaMesas.jsp?pmensagem=Erro ao excluir mesa");
                }
            }
        %>       
    </body>
</html>
