<%@page import="modelos.Usuario"%>
<!-- Recebe os dados da página HTML -->
<%
    Usuario usu = new Usuario();

    usu.setLogin(request.getParameter("login"));
    usu.setSenha(request.getParameter("senha"));

    if (usu.cadastrarUsuario()) {
        response.sendRedirect("cadastrousuario.jsp?pmensagem=Cadastro salvo com sucesso! Retorne ao login.");
    } else {
        response.sendRedirect("cadastrousuario.jsp?pmensagem=Usuario ja existe!");
    }
%>
