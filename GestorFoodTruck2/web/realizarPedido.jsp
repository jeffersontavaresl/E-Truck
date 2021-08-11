<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.PedidoCliente"%>
<%@page import="modelos.Cardapio"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Realizar Pedido</title>
    </head>
    <body>
        <h1>Realizar Pedido</h1>
        <h2>
        <%
            if(request.getParameter("pmensagem") != null)         
               out.write(request.getParameter("pmensagem"));
         %>
        </h2>
        <%
            PedidoCliente pcli = new PedidoCliente();
            List<PedidoCliente> mesas = pcli.lovMesa();

            Cardapio card = new Cardapio();
            List<Cardapio> produtos = card.lovCardapio();

        %>

        <form action="recebeRealizarPedido.jsp" method="POST">

            <label>Código da mesa</label>
            <select name="codMesa">
                <% for (PedidoCliente m : mesas) {%>
                <option value="<%out.write("" + m.getCodMesa());%>">
                    <% out.write(m.getMesa());%>
                </option>
                <%}%>
            </select><br><br>

            <label>Produto</label>
            <select name="codProduto">
                <% for (Cardapio p : produtos) {%>
                <option value="<%out.write("" + p.getCodProduto());%>">
                    <% out.write(p.getDescProduto());%>
                </option>
                <%}%>

            </select><br><br>

            <label>Observação<br></label>
            <input type="text" name="observacao" placeholder="Insira as observações"><br><br>

            <label>Status do Pagamento<br></label>
            <select name="statusPagto">
                <option value="pendente">Pendente</option>
            </select><br><br>

            <label>Status do Pedido<br></label>
            <select name="statusPedido">
                <option value="andamento">Andamento</option>
            </select><br><br>

            <a href="index.html">Início</a>
            <input type="submit" value="Confirmar"/>
            <input type="reset" value="Cancelar" />
        </form>
    </body>
</html>
