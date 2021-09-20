<%@page import="modelos.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <!-- Recebe os dados da página HTML -->
        <%      
        String codMetodo = request.getParameter("codPagto");
        String descMetodo = request.getParameter("descMetodo");
        String descBandeira = request.getParameter("descBandeira");
        
        Administrador metodo = new Administrador();
        metodo.setCodPagto(Integer.parseInt(codMetodo));
        metodo.setDescPagto(descMetodo);
        metodo.setDescBandeira(descBandeira);
        
        if(metodo.alterarMetodoPagamento()){
                response.sendRedirect("consultaMetodoPagamento.jsp?pmensagem=Metodo editado com sucesso");
            } else {
                response.sendRedirect("consultaMetodoPagamento.jsp?pmensagem=Problemas ao editar Método");
            }    
        %>
    </body>
</html>
