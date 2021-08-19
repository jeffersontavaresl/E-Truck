<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Insumo"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alerta de Estoque</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <link rel="stylesheet" href="styles/tabelas.css">
    </head> 
    <body>
        <%
          Insumo insumo = new Insumo();
          List<Insumo> lista = insumo.AlertaEstq();
        %>
        <div class="container-fluid">
            <table class="tabela table table-borderless table-striped rounded-1">
            <thead>
                <tr>
                  <th>Código do produto</th>
                  <th>Nome do produto</th>
                  <th>Und de Medida</th>
                  <th>Saldo em Estoque</th>
                  <th>Qtde de Estoque Alerta</th>
                  <th>Realizar Pedido</th>                 
                </tr>
            </thead>
                <tbody>
              
                <%for(Insumo c : lista) { %>
                    <tr>
                    <td><% out.write("" + c.getCodInsumo());   %></td>
                    <td><% out.write(c.getDescInsumo());  %></td>
                    <td><% out.write(c.getUndMedida()); %></td>
                    <td><% out.write("" + c.getSldEstqInsumo()); %></td>
                    <td><% out.write("" + c.getQtdEstqAlerta()); %></td>
                    <td><%out.write("<a href=realizarPedFornecedor.jsp?>Pedir</a>");%></td> 
                    </tr> 

                <%}%>
            </tbody>
        </table>
        </div>
    </body>
</html>
