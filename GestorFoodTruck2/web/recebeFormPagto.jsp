<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Caixa"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
            String data = request.getParameter("data");
            String vlrTotal = request.getParameter("vlrTotal");
            String codpagto = request.getParameter("formPagto");
            
            Caixa caixa = new Caixa ();
            caixa.setDataMovimento(Date.valueOf(data));
            caixa.setCodFormPagto(Integer.parseInt(codpagto));
            caixa.setVlrTotal(Float.parseFloat(vlrTotal));
            
            if(caixa.InserirFormaPagto()){
            response.sendRedirect("consultacaixa.jsp?pmensagem=Pagamento inserido com sucesso");
            } else { 
            response.sendRedirect("consultapedido.jsp?pmensagem=Falha ao inserir pagamento");
            }
        %>
    </body>
</html>
