<%@page import="modelos.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <!-- Recebe os dados da página HTML -->
        <%
            Administrador metodo = new Administrador();
            metodo.setDescPagto(request.getParameter("nomeMetodo"));
            metodo.setDescBandeira(request.getParameter("nomeBandeira"));
            
            if(metodo.cadastraMetodoPagamento()){
                response.sendRedirect("cadastroMetodoPagamento.jsp?pmensagem=Metodo cadastrada com sucesso");
            }else{
                response.sendRedirect("cadastroMetodoPagamento.jsp?pmensagem=Problemas ao salvar Método");
            }
        %>
    </body>
</html>
