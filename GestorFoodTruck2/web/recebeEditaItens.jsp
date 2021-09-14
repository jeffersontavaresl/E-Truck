<%@page import="modelos.Cardapio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <% 
            String nome   = request.getParameter("nome");
            float vlr  = Float.parseFloat(request.getParameter("vlr"));
            Integer idcodProduto = Integer.parseInt(request.getParameter("codProduto"));
            
            Cardapio card = new Cardapio();
            card.setDescProduto(nome);
            card.setPreco(vlr);
            card.setCodProduto(idcodProduto);
            
            if(card.alterarItem()){
                response.sendRedirect("consultaItem.jsp?pmensagem=Cliente editado com sucesso");
            } else {
                response.sendRedirect("consultaItem.jsp?pmensagem=Problemas ao editar cliente");
            }          
        %>        
       <hr />
       <a href="consultacliente.jsp">Consulta item</a> 
    </body>
</html>
