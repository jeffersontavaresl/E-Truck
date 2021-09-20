<%@page import="modelos.Cardapio"%>
<%@page import="utils.Formatador"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <!--FAVOICON-->
        <link rel="icon"  type="image/gif" href="styles/imagens/hamburger-solid.svg">
    </head>
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
</html>
