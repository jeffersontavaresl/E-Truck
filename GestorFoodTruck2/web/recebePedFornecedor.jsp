<%@page import="modelos.Administrador"%>
<%
    Administrador adm = new Administrador();
   
    adm.setCodFornecedor(Integer.parseInt(request.getParameter("codFornecedor")));
    adm.setCodInsumo(Integer.parseInt(request.getParameter("codInsumo")));
    adm.setQtdInsumo(Float.parseFloat(request.getParameter("qntdeinsumo")));
    adm.setUndMedida(request.getParameter("undMedida"));
   
    if (adm.realizarPedidoItem()) {
            response.sendRedirect("realizarPedFornecedor.jsp?pmensagem=Item salvo com sucesso");
    } else {
            response.sendRedirect("realizarPedFornecedor.jsp?pmensagem=Problemas ao salvar Item");
    }
    
%>