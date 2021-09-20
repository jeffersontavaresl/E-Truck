<%@page import="modelos.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <!-- Recebe os dados da página HTML -->
        <%
        int idCodPedFornecedor = Integer.parseInt(request.getParameter("codPedFornecedor"));
        int codInsumo = Integer.parseInt(request.getParameter("codInsumo"));
        float quantidade = Float.parseFloat(request.getParameter("quantidade"));        
        String undMedida = request.getParameter("undMedida");
                
        Administrador adm = new Administrador();
        adm.setCodInsumo(codInsumo);
        adm.setQtdInsumo(quantidade);
        adm.setUndMedida(undMedida);
               
        if(adm.alterarPedidoItem(idCodPedFornecedor)){
                response.sendRedirect("consultaPedFornecedor.jsp?pmensagem=Fornecedor editado com sucesso");
            } else {
                response.sendRedirect("consultaPedFornecedor.jsp?pmensagem=Problemas ao editar fornecedor");
            }    
        %>
    </body>
</html>
