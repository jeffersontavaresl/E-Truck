<%@page import="modelos.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Administrador adm = new Administrador();

    adm.setEmail(request.getParameter("email"));
    adm.setUsuario(request.getParameter("usuario"));
    adm.setSenha(request.getParameter("senha"));
    

    if (adm.cadastrarUsuario()) {
        response.sendRedirect("cadastrousuario.jsp?pmensagem=Cadastro salvo com sucesso! Retorne ao login.");
    } else {
        response.sendRedirect("cadastrousuario.jsp?pmensagem=Problemas ao salvar cadastro");
    }
%>
