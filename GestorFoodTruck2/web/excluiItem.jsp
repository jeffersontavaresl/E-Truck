<%@page import="modelos.Cardapio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cardapio</title>
    </head>
    <body> 
        <h1>Itens do Cardapio</h1>
        <%
          String idProduto = request.getParameter("codProduto");
          Cardapio c = new Cardapio();  
          if (idProduto != null) {
            c = c.consultarItem(Integer.parseInt(idProduto));
            if(c.excluirItem()){
                response.sendRedirect("consultaItem.jsp?pmensagem=Item excluido com sucesso");
            } else {
                response.sendRedirect("consultaItem.jsp?pmensagem=PRODUTO ATRELADO AO RELATORIO DE PAGAMENTO. PARA MAIS INFORMACOES CONTATE O SUPORTE.");
            }
        }
        %>   
    </body>
</html>
