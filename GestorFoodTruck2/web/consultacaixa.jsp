<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelos.PedidoCliente"%>
<%@page import="modelos.Cardapio"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        List<PedidoCliente> pedclientes = new ArrayList();
        String codmesa = request.getParameter("idmesa");
        int idmesa = 0;
        if(codmesa != null){
            PedidoCliente pedcliente = new PedidoCliente();
            idmesa = Integer.parseInt(codmesa);
            pedclientes = pedcliente.consultaPedido(idmesa);
        }
        %>
        <form action="consultacaixa.jsp" method="POST">
            <%
            PedidoCliente pedcliente = new PedidoCliente();
            List<PedidoCliente> mesas = pedcliente.lovMesa();
           %>
           <div class="form-group col-md-3 h-1">
                    <label for="codmesa">Mesas</label>
                    <select name="idmesa">
                        <% for(PedidoCliente m: mesas){ %>
                           <option value="<%out.write(""+m.getCodMesa());%>">
                                          <% out.write(m.getMesa());%>
                           </option>
                        <%}%>
                    </select> 
                </div>
                <div class="form-group col-md-3 h-1">
                    <input type="submit" value="Consultar" class="btn btn-primary"/>
                </div>
                
                    <table id="config">
            <thead>
            <th>Cod Produto</th>
            <th>Produto</th>
            <th>Status Pagamento</th>
            <th>Valor</th>
        </thead>
        <tbody>
            <% for (PedidoCliente p : pedclientes) {%>
            <tr>
                <td><% out.write(""+p.getCodProduto()); %></td>
                <td><% out.write(p.getProduto()); %></td>
                <td><% out.write(p.getStatusPagto()); %></td>
                <td><% out.print(p.getPreco());%></td> 
                <td>
                </td>
            </tr> 
            <%}%>
        </tbody>
    </table>
        <button type="button" id="botaopagamento"> Finalizar</button>
        </form>
    </body>
</html>
