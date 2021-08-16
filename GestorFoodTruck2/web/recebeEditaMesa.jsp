<%@page import="modelos.Mesa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recebe edita mesa</title>
    </head>
    <body>
        <%
        
        String nomMesa = request.getParameter("nomMesa");
        Integer idMesa = Integer.parseInt(request.getParameter("codMesa"));
        
        Mesa mesa = new Mesa();
        mesa.setMesa(nomMesa);
        mesa.setCodmesa(idMesa);
        
        if(mesa.alteraMesa()){
                response.sendRedirect("consultaMesas.jsp?pmensagem=Mesa editada com sucesso");
            } else {
                response.sendRedirect("consultaMesas.jsp?pmensagem=Problemas ao editar mesa");
            }    
        %>
    </body>
</html>
