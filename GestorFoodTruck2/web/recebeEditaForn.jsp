<%@page import="modelos.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recebe edita Fornecedor</title>
    </head>
    <body>
        <%
        
        String emlForn = request.getParameter("emlF");
        String telForn = request.getParameter("telF");        
        String nomForn = request.getParameter("nomF");
        int idForn = Integer.parseInt(request.getParameter("codF"));
        
        Fornecedor forn = new Fornecedor();
        forn.setEmail(emlForn);
        forn.setTelefone(telForn);
        forn.setNomeContato(nomForn);
        forn.setCodFornecedor(idForn);
        
        if(forn.alterarFornecedor()){
                response.sendRedirect("consultaForn.jsp?pmensagem=Fornecedor editado com sucesso");
            } else {
                response.sendRedirect("consultaForn.jsp?pmensagem=Problemas ao editar fornecedor");
            }    
        %>
    </body>
</html>
