<%@page import="modelos.Caixa"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--FAVICON-->
        <link rel="icon"  type="image/gif" href="styles/imagens/hamburger-solid.svg">
        <title>Caixa</title>
    </head>
    <body>
        <%
            int codmesa = Integer.parseInt(request.getParameter("codmesa"));
            String statusPagto = request.getParameter("statusPagto");
            Date data = Date.valueOf(request.getParameter("data"));
            float vlrTotal = Float.parseFloat(request.getParameter("vlrTotal"));
            int codpagto = Integer.parseInt(request.getParameter("formPagto"));
           
            Caixa caixa = new Caixa();
            caixa.setCodMesa(codmesa);
            caixa.setStatusPagto("Pago");
            caixa.setDataMovimento(data);
            caixa.setCodFormPagto(codpagto);
            caixa.setVlrTotal(vlrTotal);
            
            if(caixa.fecharPedido(codmesa)){
                caixa.InserirFormaPagto();
            response.sendRedirect("consultacaixa.jsp?pmensagem=Pedido finalizado com sucesso");
            } else { 
            response.sendRedirect("consultacaixa.jsp?pmensagem=Falha ao finalizar pedido");
            }
        %>
    </body>
</html>
