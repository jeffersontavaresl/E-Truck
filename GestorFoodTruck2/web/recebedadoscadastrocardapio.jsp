<%@page import="modelos.Cardapio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cardapio card = new Cardapio();
 
    card.setNomeProduto(request.getParameter("nomeProduto"));
    card.setCodProduto(request.getParameter("codProduto"));
    card.setTipoProduto(request.getParameter("tipoProduto"));
    card.setPreco(Integer.parseInt(request.getParameter("preco")));
    if (card.incluirCliente()) {
            response.sendRedirect("cadastraitemcardapio.jsp?pmensagem=Cliente salvo com sucesso");
    } else {
            response.sendRedirect("cadastraitemcardapio.jsp?pmensagem=Problemas ao salvar cliente");
    }
    
%>