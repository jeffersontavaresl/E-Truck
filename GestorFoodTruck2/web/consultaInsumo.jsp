<%@page import="java.util.List"%>
<%@page import="modelos.Insumo"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estoque do Food Truck</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="styles/tabelas.css">
    </head>
    <body>   
        <%
          Insumo insumo = new Insumo();
          List<Insumo> lista = insumo.lovItem();
        %>
        <div class="container-fluid">
            <table class="tabela table table-borderless table-striped rounded-1">
            <thead>
                <tr>
                  <th>Código do produto</th>
                  <th>Nome do produto</th>
                  <th>Saldo em Estoque</th>
                  <th>Qtde de Estoque Alerta</th>
                  <th>Und de Medida</th>
                  <th>Valor</th>
                  <th>Editar</th>
                  <th>Excluir</th>
                  
                </tr>
            </thead>
            <tbody>
                <% for(Insumo c : lista) { %>
                   <tr>
                       <td><% out.write("" + c.getCodInsumo());   %></td>
                        <td><% out.write(c.getDescInsumo());  %></td>
                        <td><% out.write("" + c.getSldEstqInsumo()); %></td>
                        <td><% out.write("" + c.getQtdEstqAlerta()); %></td>
                        <td><% out.write(c.getUndMedida()); %></td>
                        <td><% out.write("R$" + c.getCustoInsumo()); %></td>
                        <td><%out.write("<a href=editaInsumo.jsp?codInsumo="+c.getCodInsumo()+">Editar</a>");%></td> 
                        <td><%out.write("<a href=excluiInsumo.jsp?codInsumo="+c.getCodInsumo()+">Excluir</a>");%></td>   
                   </tr> 
                <%}%>
            </tbody>
        </table>
        </div>
    </body>
</html>
