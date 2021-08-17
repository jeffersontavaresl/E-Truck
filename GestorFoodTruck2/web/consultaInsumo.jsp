<%@page import="java.util.List"%>
<%@page import="modelos.Insumo"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estoque do Food Truck</title>
        <link rel="stylesheet" href="styles/estilos.css"> 
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
       
        <h1>Consulta Itens</h1>
        <hr />
        <%
          Insumo insumo = new Insumo();
          List<Insumo> lista = insumo.lovItem();
        %>
        <table>
            <thead>
                <tr>
                  <th>Código do produto</th>
                  <th>Nome do produto</th>
                  <th>Valor</th>
                  <th>Und de Medida</th>
                  <th>Saldo em Estoque</th>
                  <th>Qtde de Estoque Alerta</th>
                  <th>Editar</th>
                  <th>Excluir</th>
                  
                </tr>
            </thead>
            <tbody>
                <% for(Insumo c : lista) { %>
                   <tr>
                       <td><% out.write("" + c.getCodInsumo());   %></td>
                        <td><% out.write(c.getDescInsumo());  %></td>
                        <td><% out.write("" + c.getCustoInsumo()); %></td>
                        <td><% out.write(c.getUndMedida()); %></td>
                        <td><% out.write("" + c.getSldEstqInsumo()); %></td>
                        <td><% out.write("" + c.getQtdEstqAlerta()); %></td>
                        <td><%out.write("<a href=editaInsumo.jsp?codInsumo="+c.getCodInsumo()+">Editar</a>");%></td> 
                        <td><%out.write("<a href=excluiInsumo.jsp?codInsumo="+c.getCodInsumo()+">Excluir</a>");%></td>   
                   </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>
