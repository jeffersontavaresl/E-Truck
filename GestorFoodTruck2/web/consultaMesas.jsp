<%@page import="java.util.List"%>
<%@page import="modelos.Mesa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Mesas</title>
    </head>
    <body>
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
    
    <body>
       
        <h1>Consulta Fornecedor</h1>
        <hr />
        <%
          Mesa mesa = new Mesa();
          List<Mesa> lista = mesa.lovMesa();
        %>
        <table>
            <thead>
                <tr>
                  <th>Código da mesa</th>
                  <th>Nome da mesa</th> 
                  <th>Editar</th>
                  <th>Excluir</th>
                </tr>
            </thead>
            <tbody>
                <% for(Mesa m : lista) { %>
                   <tr>
                       <td><%  out.write("" + m.getCodmesa());   %></td>
                        <td><% out.write(m.getMesa());  %></td>   
                        <td><%out.write("<a href=editaMesa.jsp?codmesa="+m.getCodmesa()+">Editar</a>");%></td> 
                        <td><%out.write("<a href=excluiMesa.jsp?codmesa="+m.getCodmesa()+">Excluir</a>");%></td> 
                   </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>
