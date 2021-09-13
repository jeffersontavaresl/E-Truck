<%@page import="modelos.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclui Mesa</title>
    </head>
    <body>
        <%
          String codMetodo = request.getParameter("codPagto");
          Administrador m = new Administrador();
          if (codMetodo != null){
              m = m.consultarMetodoPagamento(Integer.parseInt(codMetodo));
              if(m.excluiMetodoPagamento()){
              out.write("Método excluido com sucesso");
              response.sendRedirect("consultaMetodoPagamento.jsp");
          }
          else
          {
              out.write("Problemas ao excluir método");
          }
          }          
        %>
    </body>
</html>
