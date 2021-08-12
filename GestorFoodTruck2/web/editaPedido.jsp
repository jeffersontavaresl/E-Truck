<%@page import="java.util.ArrayList"%>
<%@page import="modelos.PedidoCliente"%>
<%@page import="modelos.Cardapio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edita Pedido</title>
    </head>
    <body>
        <h1>Edita Pedido</h1>
        
        <%  
           
            List<PedidoCliente> pedclientes = new ArrayList<>();
            String codpedido = request.getParameter("codPedido");
            String codPedido = "";
            String codMesa = "";
            if (codpedido != null){
                PedidoCliente pdCliente = new PedidoCliente();
                codPedido = codpedido;
                pdCliente = pdCliente.consultarPedido(Integer.parseInt(codPedido));
                        }
        %>
        
        <form action="recebeEditaPedido.jsp" method="POST">
             <% PedidoCliente pdCliente = new PedidoCliente();
                Cardapio card = new Cardapio();
                 List<PedidoCliente> mesas = pdCliente.lovMesa();
                 List<PedidoCliente> pedidos = pdCliente.lovPedidos();
                 List<Cardapio> cardapio = card.lovCardapio();
             %>
                        
                        <label>Novo produto</label>
                        <select name="codProduto">
                            <% for(Cardapio c: cardapio){ %>
                            <option value ="<%out.write(""+c.getCodProduto());%>">
                                    <% out.write(c.getDescProduto()); %>
                            </option>
                                    <%}%>
                        </select>                             
                        <br />
                        
                        <label>Observação</label>
                        <input type="text" name="obsPedido" placeholder="Observação" />
                        </br>
                        
                        <label>Código do Pedido</label>
                        <input type="text" name="codPedido" placeholder="Pedido" />

                        <br />
                        <hr />
                        <input type="submit" value="Alterar" />
        </form>
        
    </body>
</html>
