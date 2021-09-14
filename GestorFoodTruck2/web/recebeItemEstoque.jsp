<%@page import="modelos.Insumo"%>
<%
    Insumo insumo = new Insumo();
   
    insumo.setDescInsumo(request.getParameter("descInsumo"));
    insumo.setCustoInsumo(Float.parseFloat(request.getParameter("custoInsumo")));
    insumo.setSldEstqInsumo(Float.parseFloat(request.getParameter("sldEstoque")));
    insumo.setUndMedida(request.getParameter("undMedida"));
    insumo.setQtdEstqAlerta(Float.parseFloat(request.getParameter("qtdEstqAlerta")));
   
    if (insumo.cadastrarItem()) {
            response.sendRedirect("cadastroInsumo.jsp?pmensagem=Item salvo com sucesso");
    } else {
            response.sendRedirect("cadastroInsumo.jsp?pmensagem=Problemas ao salvar Item");
    }   
%>