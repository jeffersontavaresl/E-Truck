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
        String status = request.getParameter("statuspagto");
        int idmesa = 0;
        if(codmesa != null){
            Caixa caixa = new Caixa();
            idmesa = Integer.parseInt(codmesa);
            caixas = caixa.consultaPedido(idmesa, status);
        }
        %>
        <form action="consultacaixa.jsp" method="POST">
            <%
            PedidoCliente pedcliente = new PedidoCliente();
            List<PedidoCliente> pedclientes = pedcliente.consultaPedido(idmesa);
            List<PedidoCliente> mesas = pedcliente.lovMesa();
           %>
           <section>
           <div id="mesa">
                    <label for="codmesa">Mesas</label>
                    <select name="idmesa">
                        <% for(PedidoCliente m: mesas){ %>
                           <option value="<%out.write(""+m.getCodMesa());%>">
                                          <% out.write(m.getMesa());%>
                           </option>
                        <%}%>
                    </select>  
                </div>
                <div id="btnfinalizar">
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
            <% for (Caixa p : caixas) {%>
            <tr>
                <td><% out.write(""+p.getCodProduto()); %></td>
                <td><% out.write(p.getDescProduto()); %></td>
                <td><% out.write(p.getStatusPagto()); %></td>
                <td><% out.print(p.getPreco());%></td> 
                <td>
                    
                </td>
            </tr> 
            <%}%>
            <%  
                float vlrTotal = 0;
                for(Caixa c : caixas){
                    float vlrUnd = c.getPreco();
                    vlrTotal += vlrUnd;
                    }           
        %>
        <td id="vlr"><%out.write("Valor Total: " + vlrTotal); %></td>
        </tbody>
        </table>
        </form>
        <form action="realizapagamento.jsp" method="POST">
            <select name="statuspagto">
            <option value="Pago">Pago</option>
            <option value="Nao Pago" selected>Não pago</option>
            </select>
            <select name="codmesa">
            <option value="1">MESA 1</option>
            <option value="2">MESA 2</option>
            <option value="3">MESA 3</option>
            <option value="4">RETIRADA</option>
            </select>
            <input type="submit" value="Continuar" name="continuar" onclick="enviarpagto()" />
        </form>
        </section>
    <script>
    function enviapagto(){

            var statusPagto = document.getElementsByName("statuspagto");
            if(statusPagto[0].value === ""){
                statusPagto[0].focus();
                alert("Informe o pagamento");
                exit();
            }

            var codmesa = document.getElementsByName("codmesa");
            if(codmesa[0].value === ""){
                codmesa[0].focus();
                alert("Informe a mesa");
                exit();
            }

            document.forms[0].submit();
    }        
    
</script>
    </body>
</html>
