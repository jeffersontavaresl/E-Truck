<%@page import="modelos.PedidoCliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        
        <%
        
            int codPedido = Integer.parseInt(request.getParameter("codPedido"));
            int codProduto = Integer.parseInt(request.getParameter("codProduto"));
            String obsPedido = request.getParameter("obsPedido");
            
            PedidoCliente pc = new PedidoCliente ();
            pc.setCodProduto(codProduto);
            pc.setObservacao(obsPedido);
            
            if(pc.alterarPedido(codPedido)){
            response.sendRedirect("consultapedido.jsp?pmensagem=Pedido alterado com sucesso");
            } else { 
            response.sendRedirect("consultapedido.jsp?pmensagem=Falha ao editar pedido");
            }
        %>
        
        
    </body>
</html>