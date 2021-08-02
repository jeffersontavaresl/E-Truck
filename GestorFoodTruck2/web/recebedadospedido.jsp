<%@page import="modelos.PedidoCliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
          //recebe os valores da tela HTML  
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
                response.sendRedirect("realizapedido.jsp?pmensagem=Carro salvo com sucesso");
          } else {
                response.sendRedirect("realizadopedido.jsp?pmensagem=Problemas ao salvar Carro");
          }
        %>
    </body>
</html>
