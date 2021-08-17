<%@page import="modelos.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edita Fornecedor</title>
    </head>
    <body>
        <h1>Edita fornecedor</h1>
        <%
        String idForn = request.getParameter("codFornecedor");
                      Fornecedor f = new Fornecedor();
                       if (idForn != null){
                          f = f.consultarFonecedor(Integer.parseInt(idForn));
                      }   
        %>
        <form action="recebeEditaForn.jsp" method="POST">
                       
                       <label><b>E-mail</b></label> <br>
                       <input type="text" name="emlF" placeholder="E-mail"
                              value="<%out.write(f.getEmail());%>"/> <br><br>
                       
                       <label><b>Telefone</b></label> <br>
                       <input type="number" name="telF" placeholder="Telefone"
                              value="<%out.write(f.getTelefone());%>"/> <br><br>
                       
                        <label><b>Nome</b></label> <br>
                       <input type="text" name="nomF" placeholder="Nome"
                              value="<%out.write(f.getNomeContato());%>"/> <br><br>
                       
                       <label><b>Código do fornecedor</b></label> <br>
                       <input type="text" name="codF" placeholder="Código do fornecedor" 
                              value="<%out.write("" + f.getCodFornecedor());%>"/> <br><br> 
                        
                        <hr />
                        <input type="submit" value="Alterar" />
                    </form>
    </body>     
</html>
