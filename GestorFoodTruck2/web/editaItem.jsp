<%@page import="modelos.Cardapio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edita Item</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="styles/editar.css" rel="stylesheet"/>
    </head>

    <body>
        <div class="container-fluid">
            <div class="container-fluid border w-50 h-75 mt-5 mb-4" id="tabela">
                <div class="container-fluid d-flex justify-content-center mt-4">
                    <h1>Editar Item</h1><br>
                    <hr />
                    <br>

                    <%
                        String idcodPedido = request.getParameter("codProduto");
                        Cardapio c = new Cardapio();
                        if (idcodPedido != null) {
                            c = c.consultarItem(Integer.parseInt(idcodPedido));
                        }
                    %>
                </div>
                <div class="container-fluid mt-3 mr-4">
                    <form action="recebeEditaItens.jsp" method="POST">

                        <label>Nome do produto</label>
                        <input type="text" maxlength="30" class="form-control" name="nome" 
                               value="<%out.write(c.getDescProduto());%>" />
                        <br />
                        <label>Preço</label>
                        <input type="text" maxlength="5" class="form-control" name="vlr" 
                               value="<%out.write("" + c.getPreco());%>" />
                        <br />
                        <label>Código do Produto</label>
                        <input type="text" class="form-control" name="codProduto" readonly
                               value="<%out.write("" + c.getCodProduto());%>" />
                        <br />
                        <div class="text-center mb-3">
                            <input type="submit" value="Alterar" class="btn btn-primary"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>                  
</html>
