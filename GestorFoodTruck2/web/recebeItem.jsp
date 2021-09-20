<%@page import="modelos.Cardapio"%>
<!-- Recebe os dados da página HTML -->
<%
    Cardapio cardapio = new Cardapio();
    cardapio.setDescProduto(request.getParameter("nomPrd"));
    cardapio.setPreco(Float.parseFloat(request.getParameter("vlrPrd")));

    if (cardapio.cadastrarItem()) {
        response.sendRedirect("cadastraItem.jsp?pmensagem=Item salvo com sucesso");
    } else {
        response.sendRedirect("cadastraItem.jsp?pmensagem=Problemas ao salvar Item");
    }
%>
