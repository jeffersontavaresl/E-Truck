<%@page import="modelos.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edita Fornecedor</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="styles/editar.css" rel="stylesheet"/>
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
        <div class="container-fluid">
            <div class="container-fluid border w-50 h-75 mt-5 mb-4" id="tabela">
                <div class="container-fluid d-flex justify-content-center mt-4">
                    <h1>Edita fornecedor</h1>
                    <%
                        String idForn = request.getParameter("codFornecedor");
                        Fornecedor f = new Fornecedor();
                        if (idForn != null) {
                            f = f.consultarFonecedor(Integer.parseInt(idForn));
                        }
                    %>
                </div>
                <div class="container-fluid mt-3 mr-4">
                    <form action="recebeEditaForn.jsp" method="POST">

                        <label class="form-label">E-mail</label> <br>
                        <input type="text" maxlength="40" class="form-control" name="emlF" placeholder="E-mail"
                               value="<%out.write(f.getEmail());%>"/> <br>

                        <label class="form-label">Telefone</label> <br>
                        <input type="number" maxlength="20" class="form-control" name="telF" placeholder="Telefone"
                               value="<%out.write(f.getTelefone());%>"/> <br>

                        <label class="form-label">Nome</label> <br>
                        <input type="text" maxlength="20" class="form-control" name="nomF" placeholder="Nome"
                               value="<%out.write(f.getNomeContato());%>"/> <br>

                        <label class="form-label">Código do fornecedor</label> <br>
                        <input type="text" class="form-control" name="codF" placeholder="Código do fornecedor" 
                               value="<%out.write("" + f.getCodFornecedor());%>"/> <br>
                        <div class="text-center mb-3">
                            <input type="submit" value="Alterar" class="btn btn-primary"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>     
</html>
