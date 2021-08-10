<%@page import="java.util.List"%>
<%@page import="modelos.Cardapio"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cardápio do Food Truck</title>
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
          Cardapio card = new Cardapio();
          List<Cardapio> lista = card.lovCardapio();
        %>
        <table>
            <thead>
                <tr>
                  <th>Código do produto</th>
                  <th>Nome do produto</th>
                  <th>Valor</th>
                  <th>Editar</th>
                  <th>Excluir</th>
                  
                </tr>
            </thead>
            <tbody>
                <% for(Cardapio c : lista) { %>
                   <tr>
                       <td><% out.write("" + c.getCodProduto());   %></td>
                        <td><% out.write(c.getDescProduto());  %></td>
                        <td><% out.write("" + c.getPreco()); %></td>   
                        <td><%out.write("<a href=editaItem.jsp?codProduto="+c.getCodProduto()+">Editar</a>");%></td> 
                        <td><%out.write("<a href=excluiItem.jsp?codProduto="+c.getCodProduto()+">Excluir</a>");%></td>   
                   </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>
