<%@page import="modelos.Administrador"%>
<%@page import="utils.Formatador"%>
<!-- Recebe os dados da página HTML -->
<%
    Administrador adm = new Administrador();
    Formatador form = new Formatador();
    adm.setCodFornecedor(Integer.parseInt(request.getParameter("codFornecedor")));
    adm.setCodInsumo(Integer.parseInt(request.getParameter("codInsumo")));
    adm.setQtdInsumo(form.converterVirgulaParaPonto(request.getParameter("qntdeinsumo")));
    adm.setUndMedida(request.getParameter("undMedida"));
    adm.setStatusPedido(request.getParameter("statusPedido"));
   
    if (adm.realizarPedidoItem()) {
            response.sendRedirect("realizarPedFornecedor.jsp?pmensagem=Pedido realizado com sucesso");
    } else {
            response.sendRedirect("realizarPedFornecedor.jsp?pmensagem=Problemas ao realizar pedido");
    } 
%>
