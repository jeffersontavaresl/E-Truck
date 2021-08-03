<%@page import="Modelos.Cardapio"%>
<%
    Cardapio cardapio = new Cardapio();
 
    cardapio.setcodProduto(Integer.parseInt(request.getParameter("codProduto")));
    cardapio.setproduto(request.getParameter("produto"));
    cardapio.setpreco(Float.parseFloat(request.getParameter("preco")));
   
    if (cardapio.cadastraItem()) {
            response.sendRedirect("cadastraPedido.jsp?pmensagem=Item salvo com sucesso");
    } else {
            response.sendRedirect("cadastraPedido.jsp?pmensagem=Problemas ao salvar Item");
    }
    
%>
