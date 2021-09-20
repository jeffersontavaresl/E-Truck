<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Insumo"%>
<%@page import="utils.Formatador"%>
<!DOCTYPE html>
<html>
    <body>
        <!-- Recebe os dados da página HTML -->
        <%
            Formatador form = new Formatador();
            
            String nome   = request.getParameter("nome");
            float sldEstoque  = form.converterVirgulaParaPonto(request.getParameter("sldEstoque"));
            float qtdEstqAlerta  = form.converterVirgulaParaPonto(request.getParameter("qtdEstqAlerta"));
            float vlr = form.converterVirgulaParaPonto(request.getParameter("vlr"));
            int codInsumo = Integer.parseInt(request.getParameter("codInsumo"));
            
            Insumo insumo = new Insumo();
            insumo.setDescInsumo(nome);
            insumo.setSldEstqInsumo(sldEstoque);
            insumo.setQtdEstqAlerta(qtdEstqAlerta);
            insumo.setCustoInsumo(vlr);
            insumo.setCodInsumo(codInsumo);
            
            if(insumo.atualizarSldEstoque()){
                response.sendRedirect("consultaInsumo.jsp?pmensagem=Insumo editado com sucesso");
            } else {
                response.sendRedirect("consultaInsumo.jsp?pmensagem=Problemas ao editar o insumo");
            }          
        %>        
    </body>
</html>
