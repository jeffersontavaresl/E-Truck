<%@page import="modelos.Cozinha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cozinha</title>
    </head>
    <body>
        <%
            int codpedido = Integer.parseInt(request.getParameter("codpedido"));
            String statusPedido = request.getParameter("statusPedido");
           
            Cozinha coz = new Cozinha ();
            coz.setCodPedido(codpedido);
            coz.setStatusPedido("Pronto");
            
            if(coz.atualizarPedido(codpedido)){
            response.sendRedirect("consultaCozinha.jsp?pmensagem=Pedido finalizado com sucesso");
            } else { 
            response.sendRedirect("consultaCozinha.jsp?pmensagem=Falha ao finalizar pedido");
            }
        %>
    </body>
</html>
