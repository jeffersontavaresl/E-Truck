<%@page import="java.util.ArrayList"%>
<%@page import="modelos.PedidoCliente"%>
<%@page import="modelos.Cardapio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Pedido</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="styles/editar.css" rel="stylesheet"/>
    </head>
    <body>
        <div class="container-fluid">
            <div class="container-fluid border w-50 h-75 mt-5 mb-4" id="tabela">
                <div class="container-fluid borderless w-50 h-75 mt-3 mb-4">
                    <h1>Editar Pedido</h1>

                    <%

                        List<PedidoCliente> pedclientes = new ArrayList<>();
                        String codpedido = request.getParameter("codPedido");
                        String codPedido = "";
                        String codMesa = "";
                        if (codpedido != null) {
                            PedidoCliente pdCliente = new PedidoCliente();
                            codPedido = codpedido;
                            pdCliente = pdCliente.consultarPedido(Integer.parseInt(codPedido));
                        }
                    %>
                </div>
                <div class="container-fluid mt-3 mr-4">
                    <form action="recebeEditaPedido.jsp" method="POST">
                        <% PedidoCliente pdCliente = new PedidoCliente();
                            Cardapio card = new Cardapio();
                            List<PedidoCliente> mesas = pdCliente.lovMesa();
                            List<PedidoCliente> pedidos = pdCliente.lovPedidos();
                            List<Cardapio> cardapio = card.lovCardapio();
                        %>
                        
                        <label>Novo produto</label>
                        <select name="codProduto" class="form-control">
                            <% for (Cardapio c : cardapio) { %>
                            <option value ="<%out.write("" + c.getCodProduto());%>">
                                <% out.write(c.getDescProduto()); %>
                            </option>
                            <%}%>
                        </select>                             
                        <br>

                        <label>Observação</label>
                        <input type="text" class="form-control" name="obsPedido" placeholder="Observação" />
                        <br>

                        <label>Código do Pedido</label>
                        <input type="text" class="form-control" name="codPedido" placeholder="Pedido" />
                        <br>
                        
                        <div class="text-center mb-3">
                            <input type="submit" value="Alterar" class="btn btn-primary"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
