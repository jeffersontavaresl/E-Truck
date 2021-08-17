<%@page import="modelos.Cardapio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edita Item</title>
        <link href="styles/botoes.css" rel="stylesheet"/>
        <link href="styles/realizar.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>

    <body>
        <div class="container-fluid">
            <div class="container-fluid border w-50 h-75 mt-3 mb-4" id="head">
                <div class="container-fluid d-flex justify-content-center mt-4">
                    <h1>Edita Item</h1><br>
                    <hr />

                    <%
                        String idcodPedido = request.getParameter("codProduto");
                        Cardapio c = new Cardapio();
                        if (idcodPedido != null) {
                            c = c.consultarItem(Integer.parseInt(idcodPedido));
                        }
                    %>
                </div>
                <div class="container-fluid mt-2 mr-4">
                    <form action="recebeEditaItens.jsp" method="POST">

                        <label>Nome do produto</label>
                        <input type="text" class="form-control" name="nome" 
                               value="<%out.write(c.getDescProduto());%>" />
                        <br />
                        <label>Preço</label>
                        <input type="text" class="form-control" name="vlr" 
                               value="<%out.write("" + c.getPreco());%>" />
                        <br />
                        <label>Codigo Produto</label>
                        <input type="text" class="form-control" name="codProduto" 
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
