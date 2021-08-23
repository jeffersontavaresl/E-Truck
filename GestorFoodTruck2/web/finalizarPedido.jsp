<%@page import="modelos.Caixa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Caixa</title>
    </head>
    <body>
        <%
            int codmesa = Integer.parseInt(request.getParameter("codmesa"));
            String statusPagto = request.getParameter("statusPagto");
           
            Caixa caixa = new Caixa();
            caixa.setCodMesa(codmesa);
            caixa.setStatusPagto("Pago");
            
            if(caixa.fecharPedido(codmesa)){
            response.sendRedirect("consultacaixa.jsp?pmensagem=Pedido finalizado com sucesso");
            } else { 
            response.sendRedirect("consultacaixa.jsp?pmensagem=Falha ao finalizar pedido");
            }
        %>
    </body>
</html>
