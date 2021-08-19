<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Insumo"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alerta de Estoque</title>
    </head>
    <header>
        <style>     
    
    table, th, td {
  border: 1px solid black;
    }

    table {
      width: 35%;
    }
    
    td{
        text-align: center;
    }
        </style>
    </header>   
    <body>
        <%
          Insumo insumo = new Insumo();
          List<Insumo> lista = insumo.AlertaEstq();
        %>
        <table>
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
    </body>
</html>
