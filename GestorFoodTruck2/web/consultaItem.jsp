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
    
    table{
        background-color: black;
        color: white;
       
    }
    
    body {
        background-color: orange;
        margin: 0px;
        color: white;
    }
</style>
        
    </header>
    
    <body>
       
        <h1>Consulta Itens</h1>
        <hr />
        <%
          Cardapio card = new Cardapio();
          List<Cardapio> listaItens = card.lovCardapio();
        %>
        <table>
            <thead>
                <tr>
                  <th>Código do produto</th>
                  <th>Nome do produto</th>
                  <th>Valor do produto</th>
                </tr>
            </thead>
            <tbody>
                <% for(Cardapio c : listaItens) { %>
                   <tr>
                       <td><% out.write("" + c.getCodProduto());   %></td>
                        <td><% out.write(c.getProduto());  %></td>
                        <td><% out.write("" + c.getPreco()); %></td>   
                   </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>
