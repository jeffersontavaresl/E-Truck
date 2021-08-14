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
        
            String data = request.getParameter(Date.valueOf("date"));
            String vlrTotal = request.getParameter("vlrTotal");
            int codpagto = Integer.parseInt(request.getParameter("formPagto"));
            
            Caixa caixa = new Caixa ();
            caixa.setDataMovimento(data);
            caixa.setCodFormPagto(codpagto);
            caixa.setVlrTotal(vlrTotal);
            
            if(caixa.InserirFormaPagto()){
            response.sendRedirect("consultacaixa.jsp?pmensagem=Pagamento inserido com sucesso");
            } else { 
            response.sendRedirect("consultapedido.jsp?pmensagem=Falha ao inserir pagamento");
            }
        %>
    </body>
</html>
