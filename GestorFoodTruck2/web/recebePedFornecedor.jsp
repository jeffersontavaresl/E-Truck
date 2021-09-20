<%@page import="modelos.Administrador"%>
<!-- Recebe os dados da página HTML -->
<%
    Administrador adm = new Administrador();
   
    adm.setCodFornecedor(Integer.parseInt(request.getParameter("codFornecedor")));
    adm.setCodInsumo(Integer.parseInt(request.getParameter("codInsumo")));
    adm.setQtdInsumo(Float.parseFloat(request.getParameter("qntdeinsumo")));
    adm.setUndMedida(request.getParameter("undMedida"));
    adm.setStatusPedido(request.getParameter("statusPedido"));
   
    if (adm.realizarPedidoItem()) {
            response.sendRedirect("realizarPedFornecedor.jsp?pmensagem=Pedido realizado com sucesso");
    } else {
            response.sendRedirect("realizarPedFornecedor.jsp?pmensagem=Problemas ao realizar pedido");
    } 
%>
