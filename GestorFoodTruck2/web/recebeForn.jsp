<%@page import="modelos.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastra fornecedor</title>
    </head>
    <body>
        
        <%
        
        Fornecedor forn= new Fornecedor();
        forn.setCnpj(request.getParameter("cdCnpj"));
        forn.setRazaoSocial(request.getParameter("cdSoc"));
        forn.setTelefone(request.getParameter("cdTel"));
        forn.setEmail(request.getParameter("cdEml"));
        forn.setNomeContato(request.getParameter("cdNom"));
        
        
        if (forn.adicionarFornecedor()) {
            response.sendRedirect("consultaForn.jsp?pmensagem=Fornecedor salvo com sucesso");
        } else {
            response.sendRedirect("consultaForn.jsp?pmensagem=Problema ao salvar Fornecedor");
    }
        %>
        
        
    </body>
</html>
