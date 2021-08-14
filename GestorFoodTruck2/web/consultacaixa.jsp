<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelos.PedidoCliente"%>
<%@page import="modelos.Cardapio"%>
<%@page import="modelos.Caixa"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/caixa.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        List<Caixa> caixas = new ArrayList();
        String codmesa = request.getParameter("idmesa");
        String statusPagto = "pendente";
        int idmesa = 0;
        if(codmesa != null){
            Caixa caixa = new Caixa();
            idmesa = Integer.parseInt(codmesa);
            caixas = caixa.consultaPedido(idmesa, statusPagto);
        }
        %>
        <form action="consultacaixa.jsp" method="POST">
            <%
            PedidoCliente pedcliente = new PedidoCliente();
            Caixa caixa = new Caixa();
            List<PedidoCliente> mesas = pedcliente.lovMesa();
           %>
           <section>
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
            <% for (Caixa c : caixas) {%>
            <tr>
                <td><% out.write(""+c.getCodProduto()); %></td>
                <td><% out.write(c.getDescProduto()); %></td>
                <td><% out.write(c.getStatusPagto()); %></td>
                <td><% out.print(c.getVlrTotal());%></td>
                <td><%out.write("<a href=finalizarPedido.jsp?codmesa=" + c.getCodMesa() + "&statusPagto=" + c.getStatusPagto() +">Atualizar Status</a>");%></td>
            </tr> 
            <%}%>
            <%  
                float vlrTotal = 0;
                for(Caixa c : caixas){
                    float vlrUnd = c.getVlrTotal();
                    vlrTotal += vlrUnd;
                    } 

        %>
        <td id="vlr"><%out.write("Valor Total: " + vlrTotal); %></td>
        
        </tbody>
        </table>
        </form>
            </section>
    </body>
</html>
