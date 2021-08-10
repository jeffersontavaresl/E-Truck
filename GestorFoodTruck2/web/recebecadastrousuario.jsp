<%@page import="modelos.Usuario"%>
<%
    Usuario usu = new Usuario();

    usu.setLogin(request.getParameter("login"));
    usu.setSenha(request.getParameter("senha"));

    if (usu.cadastrarUsuario()) {
        response.sendRedirect("cadastrousuario.jsp?pmensagem=Cadastro salvo com sucesso! Retorne ao login.");
    } else {
        response.sendRedirect("cadastrousuario.jsp?pmensagem=Problemas ao salvar cadastro");
    }
%>
