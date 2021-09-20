<%@page import="modelos.Cardapio"%>
<%@page import="utils.Formatador"%>
<!-- Recebe os dados da página HTML -->
<%
    Cardapio cardapio = new Cardapio();
    Formatador form = new Formatador();
    cardapio.setDescProduto(request.getParameter("nomPrd"));
    cardapio.setPreco(form.converterVirgulaParaPonto((request.getParameter("vlrPrd"))));

    if (cardapio.cadastrarItem()) {
        response.sendRedirect("cadastraItem.jsp?pmensagem=Item salvo com sucesso");
    } else {
        response.sendRedirect("cadastraItem.jsp?pmensagem=Problemas ao salvar Item");
    }
%>
