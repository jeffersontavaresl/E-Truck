<%@page import="modelos.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>        
        <!-- Recebe os dados da página HTML -->
        <%
            Fornecedor forn = new Fornecedor();
            forn.setCnpj(request.getParameter("cdCnpj"));
            forn.setRazaoSocial(request.getParameter("cdSoc"));
            forn.setTelefone(request.getParameter("cdTel"));
            forn.setEmail(request.getParameter("cdEml"));
            forn.setNomeContato(request.getParameter("cdNom"));

            if (forn.adicionarFornecedor()) {
                response.sendRedirect("cadastraFornecedor.jsp?pmensagem=Fornecedor salvo com sucesso");
            } else {
                response.sendRedirect("cadastraFornecedor.jsp?pmensagem=Problema ao salvar Fornecedor");
            }
        %>     
    </body>
</html>
