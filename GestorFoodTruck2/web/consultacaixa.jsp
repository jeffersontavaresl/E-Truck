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
        <main class="login">
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
           <div class="loginContainer">
                    <label for="codmesa" class="loginTitulo">Mesas</label>
                    <select name="idmesa">
                        <% for(PedidoCliente m: mesas){ %>
                           <option value="<%out.write(""+m.getCodMesa());%>">
                                          <% out.write(m.getMesa());%>
                           </option>
                        <%}%>
                    </select>  
                
                <div>
                    <input type="submit" value="Consultar" class="loginSubmit"/>
                </div>
                
            <table class="loginBorder">
            <thead>
            <th>Cod Produto</th>
            <th>Produto</th>
            <th>Status Pagamento</th>
            <th>Valor</th>
        </thead>
        
        <tbody class="produtos">
            <% int mesa = 0;
               String status = "";
            %>
            <% for (Caixa c : caixas) {%>
            <tr>
                <td><% out.write(""+c.getCodProduto()); %></td>
                <td><% out.write(c.getDescProduto()); %></td>
                <td><% out.write(c.getStatusPagto()); %></td>
                <td><% out.print(c.getVlrTotal());%></td>
                    <% mesa = c.getCodMesa(); %>
                    <% status = c.getStatusPagto(); %>
            </tr> 
            <%}%>
            <%  
                float vlrTotal = 0;
                for(Caixa c : caixas){
                    float vlrUnd = c.getVlrTotal();
                    vlrTotal += vlrUnd;
                    } 
            %>
        <td><%out.write("Valor Total: " + vlrTotal); %></td>
        </tbody>
        </table>
        <button class="loginSubmit"><%out.write("<a href=finalizarPedido.jsp?codmesa=" + mesa + "&statusPagto=" + status +">Finalizar Pedido</a>");%></button>
        </div>
        </form>
            </section>
        </main> 
    </body>
</html>
