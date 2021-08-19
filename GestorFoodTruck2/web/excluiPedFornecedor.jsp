<%@page import="modelos.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir pedido de fornecedor</title>
    </head>
    <body>
        <%
          String idCodPedFornecedor = request.getParameter("codPedFornecedor");
          Administrador adm = new Administrador();
          if (idCodPedFornecedor != null){
              adm = adm.consultarPedidoItem(Integer.parseInt(idCodPedFornecedor));
              if(adm.excluirPedidoItem()){
              out.write("Item excluido com sucesso");
              response.sendRedirect("consultaPedFornecedor.jsp");
          }
          else
          {
              out.write("Problemas ao excluir o fornecedor");
              response.sendRedirect("consultaPedFornecedor.jsp");
          }
          }          
        %>
    </body>
</html>
