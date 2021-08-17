<%@page import="modelos.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclui fornecedor</title>
    </head>
    <body>
        <%
          String idForn = request.getParameter("codFornecedor");
          Fornecedor f = new Fornecedor();
          if (idForn != null){
              f = f.consultarFonecedor(Integer.parseInt(idForn));
              if(f.excluirFornecedor()){
              out.write("Fornecedor excluido com sucesso");
              response.sendRedirect("consultaForn.jsp");
          }
          else
          {
              out.write("Problemas ao excluir o fornecedor");
          }
          }          
        %>
    </body>
</html>
