<%@page import="java.util.ArrayList"%>
<%@page import="modelos.PedidoCliente"%>
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
            String idCodMesa = request.getParameter("codMesa"); 
            String codMesa = "";
            if (idCodMesa != null){
                PedidoCliente pdCliente = new PedidoCliente();
                codMesa = idCodMesa;
                pdCliente = pdCliente.consultarPedido(Integer.parseInt(codMesa));
                        }
        %>
        
        <form action="recebeEditaPedido.jsp" method="POST">
             <% PedidoCliente pdCliente = new PedidoCliente();
                 List<PedidoCliente> pedCliente1 = pdCliente.consultaPedido(Integer.parseInt(codMesa));
                 List<PedidoCliente> mesas = pdCliente.lovMesa();
             %>
                        
                        <label>Código do Produto</label>
                        <input type="number" name="codProduto" 
                               value="<%out.write("" + pdCliente.getCodProduto());%>" />
                                 
                        <br />
                        
                        <label>Observação</label>
                        <input type="text" name="obsPedido" 
                               value="<%out.write(""+pdCliente.getObservacao());%>" />
                        <br />
            
                        <label for="codmesa">Cod Mesa</label>
                        <select name="codMesa">
                            <% for(PedidoCliente m: mesas){ %>
                            <option value ="<%out.write(""+m.getCodMesa());%>">
                                    <% out.write(m.getMesa()); %>
                            </option>
                                    <%}%>
                        </select>

                        <br />
       
                        <hr />
                        <input type="submit" value="Alterar" />
        </form>
        
    </body>
</html>
