<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Caixa"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/caixa.css">
        <title>Consulta Relatórios</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="styles/tabelas.css">
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
            String pData = request.getParameter("data");
            if (pData != null) {
                Caixa caixa = new Caixa();
                Date data = Date.valueOf(pData);
                caixas = caixa.gerarRelatorio(data);
            }
        %>
        <form action="consultaRelatorio.jsp" method="POST">
            <%
                Caixa caixa = new Caixa();
            %>
            <div class="consultarMesa">
                <label>Data do pagamento</label> <br>
                <input type="date" name="data"> <br><br>

                <input type="submit" value="Consultar" class="btn btn-primary"/>
            </div>
        </form>

        <table class="tabela table table-borderless table-striped rounded-1">
            <thead>
            <th>Data do Pagamento</th>
            <th>Forma de Pagamento</th>
            <th>Bandeira</th>
            <th>Valor Pago</th>            
        </thead>

        <tbody class="produtos">
            <% for (Caixa c : caixas) {%>
            <tr>
                <td><% out.write("" + c.getDataMovimento()); %></td>
                <td><% out.write(c.getDescFormPagto()); %></td>
                <td><% out.print(c.getDescBandeira());%></td>
                <td><% out.write("R$" + c.getVlrTotal()); %></td>
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
    <div class="valorTotal">
        <h3><%out.write("Valor Total: R$" + vlrTotal);%></h3>
    </div>  
</body>
</html>
