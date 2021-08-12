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
          String codMesa = request.getParameter("codMesa");
          PedidoCliente pedcliente = new PedidoCliente();
          codMesa = codMesa;
          if (codMesa != null){
              pedcliente.consultarPedido(Integer.parseInt(codMesa));
              if(pedcliente.cancelarPedido(Integer.parseInt(codMesa))){
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
