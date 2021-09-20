<%@page import="modelos.Insumo"%>
<%@page import="utils.Formatador"%>
<!-- Recebe os dados da página HTML -->
<%
    Insumo insumo = new Insumo();
    Formatador form = new Formatador();
    insumo.setDescInsumo(request.getParameter("descInsumo"));
    insumo.setCustoInsumo(form.converterVirgulaParaPonto(request.getParameter("custoInsumo")));
    insumo.setSldEstqInsumo(form.converterVirgulaParaPonto(request.getParameter("sldEstoque")));
    insumo.setUndMedida(request.getParameter("undMedida"));
    insumo.setQtdEstqAlerta(form.converterVirgulaParaPonto(request.getParameter("qtdEstqAlerta")));
   
    if (insumo.cadastrarItem()) {
            response.sendRedirect("cadastroInsumo.jsp?pmensagem=Item salvo com sucesso");
    } else {
            response.sendRedirect("cadastroInsumo.jsp?pmensagem=Problemas ao salvar Item");
    }   
%>
