<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.PedidoCliente"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancelar Pedido</title>
    </head>
    <body>
        <h1>Cancelar item do pedido</h1>
        <%
          String codPedido = request.getParameter("codPedido");
          PedidoCliente pedcliente = new PedidoCliente();
          codPedido = codPedido;
          if (codPedido != null){
              pedcliente.consultarPedido(Integer.parseInt(codPedido));
              if(pedcliente.cancelarPedido(Integer.parseInt(codPedido))){
              out.write("Item excluido com sucesso");
              response.sendRedirect("consultapedido.jsp");
          }
          else
          {
              out.write("Problemas ao excluir item");
          }
          } 
        %>
    </body>
</html>
