<%@page import="modelos.PedidoCliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <% 
          int codproduto = Integer.parseInt(request.getParameter("codproduto"));
          String pedido = request.getParameter("pedido");
          String observacao = request.getParameter("observacao");
          String status = request.getParameter("status");
          
          //instancia o carro
          PedidoCliente ped = new PedidoCliente();
          ped.setCodProduto(codproduto);
          ped.setProduto(pedido);
          ped.setObservacao(observacao);
          ped.setStatus(status);
          
          
          if(ped.RealizarPedido()){
                response.sendRedirect("realizapedido.jsp?pmensagem=Pedido realizado com sucesso!");
          } else {
                response.sendRedirect("realizadopedido.jsp?pmensagem=Não foi possivel realizar o pedido");
          }
        %>
    </body>
</html>
