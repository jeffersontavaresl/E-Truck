<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.PedidoCliente"%>
<%@page import="modelos.Caixa"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        List<PedidoCliente> pedclientes = new ArrayList();
        String codpedido = request.getParameter("idpedido");
        int idpedido = 0;
        if(codpedido != null){
            PedidoCliente pedcliente = new PedidoCliente();
            idpedido = Integer.parseInt(codpedido);
            pedclientes = pedcliente.consultaPedido(idpedido);
            }
        %>
        <form action="consultapedido.jsp" method="POST">
            <%
            PedidoCliente pedcliente = new PedidoCliente();
            List<PedidoCliente> pedscliente = pedcliente.lovPedidos();
           %>
                           <div class="form-group col-md-3 h-1">
                    <label for="codpedido">Código do Pedido</label>
                    <select name="idpedido">
                        <% for(PedidoCliente c: pedscliente){ %>
                           <option value="<%out.write(c.getCodPedido());%>">
                                          <% out.write(""+c.getCodPedido()); %>
                                          
                           </option>
                        <%}%>
                    </select> 
                </div>
                <div class="form-group col-md-3 h-1">
                    <input type="submit" value="Consultar" class="btn btn-primary"/>
                </div>
            <table id="config">
            <thead>
            <th>Produto</th>
            <th>Observacao</th>
            <th>Forma de pagamento</th>
            <button<th>Realizar pagamento </th></button>    
        </thead>
        <tbody>
            <% for (PedidoCliente c : pedclientes) {%>
            <tr>
                <td><% out.write(c.getProduto()); %></td>
                <td><% out.write(c.getStatusPedido()); %></td>
               
            </tr> 
            <%}%>
        </tbody>
    </table>
    </form>
    </body>
</html>
