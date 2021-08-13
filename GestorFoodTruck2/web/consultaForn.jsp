<%@page import="java.util.List"%>
<%@page import="modelos.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta Fonecedor</title>
    </head>
    <style>     
    
    table, th, td {
  border: 1px solid black;
    }
    table {
      width: 35%;
    }
    
    td{
        text-align: center;
    }
</style>
        
    </header>
    
    <body>
       
        <h1>Consulta Fornecedor</h1>
        <hr />
        <%
          Fornecedor forn = new Fornecedor();
          List<Fornecedor> lista = forn.lovFornecedores();
        %>
        <table>
            <thead>
                <tr>
                  <th>CNPJ</th>
                  <th>Razão Social</th>
                  <th>Telefone</th>
                  <th>E-mail</th>
                  <th>Nome Contato</th>
                  
                </tr>
            </thead>
            <tbody>
                <% for(Fornecedor f : lista) { %>
                   <tr>
                       <td><%  out.write(f.getCnpj());   %></td>
                        <td><% out.write(f.getRazaoSocial());  %></td>
                        <td><% out.write(f.getTelefone()); %></td>  
                        <td><% out.write(f.getEmail()); %></td> 
                        <td><% out.write(f.getNomeContato()); %></td> 
                          
                   </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>
