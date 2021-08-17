<%@page import="modelos.Insumo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cardapio</title>
    </head>
    <body>
        
        <h1>Itens do Estoque</h1>
        <%
          String idCodInsumo = request.getParameter("codInsumo");
          Insumo i = new Insumo();
          if (idCodInsumo != null){
              i = i.consultarInsumo(Integer.parseInt(idCodInsumo));
              if(i.excluirItem()){
              out.write("Item excluido com sucesso");
              response.sendRedirect("consultaInsumo.jsp");
          }
          else
          {
              out.write("Problemas ao excluir item");
          }
          }          
        %>
      
    </body>
</html>