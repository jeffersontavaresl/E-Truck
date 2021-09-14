<%@page import="modelos.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclui fornecedor</title>
        <!--FAVICON-->
        <link rel="icon"  type="image/gif" href="styles/imagens/hamburger-solid.svg">
    </head>
    <body>
        <%
          String idForn = request.getParameter("codFornecedor");
          Fornecedor f = new Fornecedor();  
          if (idForn != null) {
            f = f.consultarFonecedor(Integer.parseInt(idForn));
            if(f.excluirFornecedor()){
                response.sendRedirect("consultaForn.jsp?pmensagem=Fornecedor excluido com sucesso");
            } else {
                response.sendRedirect("consultaForn.jsp?pmensagem=Erro ao excluir Fornecedor");
            }
        }
        %>
    </body>
</html>
