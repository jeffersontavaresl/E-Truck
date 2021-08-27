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
        <title>Consulta do Caixa</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="styles/consulta.css">
    </head>
    <p id="login">
        <%
            String login = (String) session.getAttribute("login");
            if (login == null) {
                response.sendRedirect("login.jsp");
            }
        %>
    </p>
    <body>

        <%
            List<Caixa> caixas = new ArrayList();
            String codmesa = request.getParameter("idmesa");
            String statusPagto = "pendente";
            int idmesa = 0;
            if (codmesa != null) {
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

            <div class="principal">

                <div class="consultarMesa">
                    
                    <select name="idmesa" style="width: 95px;">
                        <% for (PedidoCliente m : mesas) { %>
                        <option value="<%out.write("" + m.getCodMesa());%>">
                            <% out.write(m.getMesa());%>
                        </option>
                        <%}%>
                    </select> 
                     
                    <br>
                    <input type="submit" value="Consultar" class="btn btn-primary"/>
                    </form>
                </div>

                <table class="TBcaixa">
                    <thead>
                    <th>Cod Produto</th>
                    <th>Produto</th>
                    <th>Status Pagamento</th>
                    <th>Valor</th>
                    </thead>

                    <tbody>
                        <% int mesa = 0;
                            String status = "";
                        %>
                        <% for (Caixa c : caixas) {%>
                        <tr>
                            <td><% out.write("" + c.getCodProduto()); %></td>
                            <td><% out.write(c.getDescProduto()); %></td>
                            <td><% out.write(c.getStatusPagto()); %></td>
                            <td><% out.print("R$" + c.getVlrTotal());%></td>
                            <% mesa = c.getCodMesa(); %>
                            <% status = c.getStatusPagto(); %>
                        </tr> 
                        <%}%>
                        <%
                            float vlrTotal = 0;
                            for (Caixa c : caixas) {
                                float vlrUnd = c.getVlrTotal();
                                vlrTotal += vlrUnd;
                            }
                        %>
                        
                    </tbody>
                </table>

                        <br>
                        
                <div class="PGcaixa">
                    <h3 class="vlrTotal"><%out.write("Valor Total: R$" + vlrTotal);%></h3>
                    <button class="btnFN"><%out.write("<a class=submit href=finalizarPedido.jsp?codmesa=" + mesa + "&statusPagto=" + status + ">Finalizar Pedido</a>");%></button>
                </div>     
            </div>
                <br><br>
            <main class="formpag">
                <%
                    List<Caixa> forms = caixa.lovPagtos();
                %>

                <div class="divpag">
                    <h2  class="pagTit">Forma de Pagamento</h2>
                    <form action="recebeFormPagto.jsp" method="POST" class="tpPagForm">

                        <label><b>Data do pagamento</b></label> <br>
                        <input type="date" name="data" id="dat"> <br><br>

                        <label><b>Valor Pago</b></label> <br>
                        <input type="text" maxlength="10" class="form-control" name="vlrTotal" 
                               value="<%out.write("" + vlrTotal);%>" />                            
                        <br><br>

                        <label>Forma de Pagamento</label><br>
                        <select name="formPagto" class="form-control">
                            <% for (Caixa c : forms) {%>
                            <option value="<%out.write("" + c.getCodFormPagto());%>">
                                <% out.write(c.getDescFormPagto());%>
                                <% out.write(c.getDescBandeira());%>
                            </option>
                            <%}%>
                        </select><br>
                        <button class="pagamentoSubmit" onclick="enviarDados()">Salvar</button>
                    </form>  
                </div>
            </main>
            <script>
                function enviarDados() {

                    var data = document.getElementsByName("data");
                    if (data[0].value === "") {
                        data[0].focus();
                        alert("Informe a data");
                        exit();
                    }

                    var vlrTotal = document.getElementsByName("vlrTotal");
                    if (vlrTotal[0].value === "") {
                        vlrTotal[0].focus();
                        alert("Informe o valor total");
                        exit();
                    }

                    var formPagto = document.getElementsByName("formPagto");
                    if (formPagto[0].value === "") {
                        formPagto[0].focus();
                        alert("Informe a forma de pagamento");
                        exit();
                    }

                    document.forms[0].submit();
                }
                
                
                document.getElementById('dat').value = new Date().toISOString().substring(0, 10);
            </script>  
    </body>
</html>
