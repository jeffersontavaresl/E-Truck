<%@page import="modelos.PedidoCliente"%>

<%
    String codMesa = request.getParameter("codMesa");
    String codProduto = request.getParameter("codProduto");
    String observacao = request.getParameter("observacao");
    String statusPagto = request.getParameter("statusPagto");
    String statusPedido = request.getParameter("statusPedido");

    PedidoCliente pc = new PedidoCliente();
    pc.setCodMesa(Integer.parseInt(codMesa));
    pc.setCodProduto(Integer.parseInt(codProduto));
    pc.setObservacao(observacao);
    pc.setStatusPagto(statusPagto);
    pc.setStatusPedido(statusPedido);

    if (pc.realizarPedido()) {
        response.sendRedirect("realizarPedido.jsp?pmensagem=Pedido salvo com sucesso");
    } else {
        response.sendRedirect("realizarPedido.jsp?pmensagem=Problemas ao realizar pedido");
    }


%>


