<%@page import="modelos.Cardapio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cardapio</title>
    </head>
    <body>
        
        <h1>Itens do Cardapio</h1>
        <%
          String idcodPedido = request.getParameter("codProduto");
          Cardapio c = new Cardapio();
          if (idcodPedido != null){
              c = c.consultarItem(Integer.parseInt(idcodPedido));
              if(c.excluirItem()){
              out.write("Item excluido com sucesso");
              response.sendRedirect("consultaItem.jsp");
          }
          else
          {
              out.write("Problemas ao excluir item");
          }
          }          
        %>
      
    </body>
</html>