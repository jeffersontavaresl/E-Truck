<%@page import="modelos.Mesa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recebe Mesa</title>
    </head>
    <body>
        <%
            Mesa mesa = new Mesa();
            mesa.setMesa(request.getParameter("nomMesa"));
            
            if(mesa.cadastraMesa()){
                response.sendRedirect("cadastraMesa.jsp?pmensagem=Mesa cadastrada com sucesso");
            }else{
                response.sendRedirect("cadastraMesa.jsp?pmensagem=Problemas ao salvar mesa");
            }
        %>
    </body>
</html>
