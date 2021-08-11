<%@page import="java.util.List"%>
<%@page import="modelos.PedidoCliente"%>
<%@page import="modelos.Cardapio"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta dos Pedidos</title>
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
          PedidoCliente pcli = new PedidoCliente();
          List<PedidoCliente> ped = pcli.lovPedidos();
          
          Cardapio card = new Cardapio();
          List<Cardapio> cd = card.lovCardapio();
        %>
        <table>
            <thead>
                <tr>
                  <th>Código do pedido</th>
                  <th>Código do produto</th>
                  <th>Produto</th>
                  <th>Observação</th>
                  <th>Status do Pagamento</th>
                  <th>Status do Pedido</th>
                  <th>Editar</th>
                  <th>Excluir</th>
                  
                </tr>
            </thead>
            <tbody>
                <% for(PedidoCliente pc : ped) { %>
                <% for(Cardapio c : cd) { %>
                   <tr>
                       <td><% out.write("" + pc.getCodPedido());   %></td>
                       <td><% out.write("" + c.getCodProduto());   %></td>
                        <td><% out.write(c.getDescProduto());  %></td>
                        <td><% out.write("" + pc.getObservacao()); %></td>   
                        <td><% out.write("" + pc.getStatusPagto()); %></td>   
                        <td><% out.write("" + pc.getStatusPedido()); %></td>   
                        <td><%out.write("<a href=#?codPedido="+pc.getCodPedido()+">Editar</a>");%></td> 
                        <td><%out.write("<a href=#?codPedido="+pc.getCodPedido()+">Excluir</a>");%></td>   
                   </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>
