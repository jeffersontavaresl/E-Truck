<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Insumo"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="styles/editar.css" rel="stylesheet"/>
        <title>Edita Insumo</title>
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
            String idCodInsumo = request.getParameter("codInsumo");
            Insumo i = new Insumo();
            if (idCodInsumo != null) {
                i = i.consultarInsumo(Integer.parseInt(idCodInsumo));
            }
        %>
        <div class="container-fluid">
            <div class="container-fluid border w-50 h-75 mt-5 mb-4" id="tabela">
                <div class="container-fluid d-flex justify-content-center mt-4">
                    <h1>Editar Insumo</h1><br>
                    <hr />
                </div>
                <div class="container-fluid mt-3 mr-4">
                    <form action="recebeEditaInsumo.jsp" method="POST">

                        <label>Código do Insumo</label>
                        <input  type="text" class="form-control" name="codInsumo" readonly
                                value="<%out.write("" + i.getCodInsumo());%>" />
                        <br/>

                        <label>Nome do Insumo</label>
                        <input type="text" class="form-control" name="nome" readonly
                               value="<%out.write(i.getDescInsumo());%>" />
                        <br />
                        <label>Saldo em Estoque</label>
                        <input type="text" class="form-control" maxlength="6" name="sldEstoque"  />
                        <br />
                        <label>Qtde de Estoque Alerta</label>
                        <input type="text" class="form-control" maxlength="6" name="qtdEstqAlerta" 
                               value="<%out.write("" + i.getQtdEstqAlerta());%>" />
                        <br />

                        <label>Valor</label>
                        <input type="text" class="form-control" maxlength="6" name="vlr" 
                               value="<%out.write("" + i.getCustoInsumo());%>" />

                        <hr />
                        <div class="text-center mb-3">
                            <input type="submit" value="Alterar" class="btn btn-primary" />
                        </div>
                    </form>
                </div>
                </body>
                </html>
