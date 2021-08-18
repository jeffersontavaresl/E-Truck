<%@page import="java.util.List"%>
<%@page import="modelos.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta Fonecedor</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="styles/tabelas.css">
    </head>
            
    <body>
        <%
          Fornecedor forn = new Fornecedor();
          List<Fornecedor> lista = forn.lovFornecedores();
        %>
        <div class="container-fluid">
        <table class="tabela table table-borderless table-striped rounded-1">
            <thead>
                <tr>
                  <th>Código do Fornecedor</th>
                  <th>CNPJ</th>
                  <th>Razão Social</th>
                  <th>Telefone</th>
                  <th>E-mail</th>
                  <th>Nome Contato</th>
                  <th>Editar</th>
                  <th>Exclui</th>
                </tr>
            </thead>
            <tbody>
                <% for(Fornecedor f : lista) { %>
                   <tr>
                       <td><%  out.write("" + f.getCodFornecedor());%></td>
                        <td><% out.write(f.getCnpj());   %></td>
                        <td><% out.write(f.getRazaoSocial());  %></td>
                        <td><% out.write(f.getTelefone()); %></td>  
                        <td><% out.write(f.getEmail()); %></td> 
                        <td><% out.write(f.getNomeContato()); %></td> 
                        <td><% out.write("<a href=editaFornecedor.jsp?codFornecedor="+f.getCodFornecedor()+">Editar</a>");%></td> 
                        <td><% out.write("<a href=excluiFornecedor.jsp?codFornecedor="+f.getCodFornecedor()+">Excluir</a>");%></td>
                   </tr> 
                <%}%>
            </tbody>
        </table>
        </div>
    </body>
</html>
