<%@page import="modelos.Cardapio"%>
<%@page import="utils.Formatador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <!-- Recebe os dados da página HTML -->
        <% 
            Formatador form = new Formatador();
            
            String nome   = request.getParameter("nome");
            float vlr  = form.converterVirgulaParaPonto(request.getParameter("vlr"));
            Integer idcodProduto = Integer.parseInt(request.getParameter("codProduto"));
            
            Cardapio card = new Cardapio();
            card.setDescProduto(nome);
            card.setPreco(vlr);
            card.setCodProduto(idcodProduto);
            
            if(card.alterarItem()){
                response.sendRedirect("consultaItem.jsp?pmensagem=Item editado com sucesso");
            } else {
                response.sendRedirect("consultaItem.jsp?pmensagem=Problemas ao editar item");
            }          
        %>        
    </body>
</html>
