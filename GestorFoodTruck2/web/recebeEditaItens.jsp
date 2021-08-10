<%@page import="modelos.Cardapio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
        //recebe os valores da tela HTML  
            String nome   = request.getParameter("nome");
            Float valor  = Float.parseFloat(request.getParameter("email"));
          
            //instancia o Cliente
            Cardapio card = new Cardapio();
            card.setProduto(nome);
            card.setPreco(valor);
          
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
