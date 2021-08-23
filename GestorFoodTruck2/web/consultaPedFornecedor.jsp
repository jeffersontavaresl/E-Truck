<%@page import="java.util.List"%>
<%@page import="modelos.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta dos Pedidos</title>
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
            Administrador adm = new Administrador();
            List<Administrador> adms = adm.lovPedidosForn("pendente");
        %>
        <div class="container-fluid">
            <table class="tabela table table-borderless table-striped rounded-1">
                <thead>
                <th>Cod Fornecedor</th>
                <th>CNPJ</th>
                <th>Razao Social</th>
                <th>Nome Contato</th>
                <th>Cod do Pedido</th>
                <th>Cod do Insumo</th>
                <th>Descrição do Insumo</th>
                <th>Quantidade</th>
                <th>Unidade de Medida</th>
                <th>Custo</th>
                <th>Stauts</th>
                <th>Editar</th>
                <th>Excluir</th>
                </thead>
                <tbody>
                    <% for (Administrador a : adms) {%>
                    <tr>
                        <td><% out.write("" + a.getCodFornecedor()); %></td>
                        <td><% out.write(a.getCnpj()); %></td>
                        <td><% out.write(a.getRazaoSocial()); %></td>
                        <td><% out.write(a.getNomeContato()); %></td>
                        <td><% out.write("" + a.getCodPedFornecedor());%></td>                                    
                        <td><% out.write("" + a.getCodInsumo());%></td>
                        <td><% out.write(a.getDescInsumo());%></td>
                        <td><% out.write("" + a.getQtdInsumo());%></td>
                        <td><% out.write("" + a.getUndMedida());%></td>
                        <td><% out.write("" + a.getCustoInsumo());%></td>
                        <td><% out.write("" + a.getStatusPedido());%></td>
                        <td><%out.write("<a href=editaPedFornecedor.jsp?codPedFornecedor=" + a.getCodPedFornecedor() + ">Editar</a>");%></td> 
                        <td><%out.write("<a href=excluiPedFornecedor.jsp?codPedFornecedor=" + a.getCodPedFornecedor() + ">Excluir</a>");%></td>
                    </tr> 
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
