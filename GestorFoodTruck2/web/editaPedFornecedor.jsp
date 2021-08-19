<%@page import="modelos.Administrador"%>
<%@page import="modelos.Insumo"%>
<%@page import="java.util.List"%>
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
    <body> 
        <div class="container-fluid">
            <div class="container-fluid border w-50 h-75 mt-5 mb-4" id="tabela">
                <div class="container-fluid d-flex justify-content-center mt-4">
                    <h1>Editar pedido</h1>
                    <%
                        String idCodPedFornecedor = request.getParameter("codPedFornecedor");
                        Administrador adm = new Administrador();
                        if (idCodPedFornecedor != null) {
                            adm = adm.consultarPedidoItem(Integer.parseInt(idCodPedFornecedor));
                        }                  
                    %>
                </div>
                <div class="container-fluid mt-3 mr-4">
                    <form action="recebeEditaPedFornecedor.jsp" method="POST">
                        <%
                            Insumo ins = new Insumo();
                            List<Insumo> insumos = ins.lovItem();
                        %>
                        
                        <label class="form-label">Código do Pedido</label> <br>
                        <input type="text" class="form-control" name="codPedFornecedor" placeholder="Código do fornecedor" 
                        readonly  value="<%out.write("" + adm.getCodPedFornecedor());%>"/> <br>
                        <div class="text-center mb-3"> 
                            
                        <label class="form-label">Descrição</label> <br>
                         <select name="codInsumo" class="form-label">
                            <% for (Insumo i : insumos) {%>
                            <option value="<%out.write("" + i.getCodInsumo());%>">
                                <% out.write(i.getDescInsumo());%>
                            </option>
                                <%}%>
                        </select><br>

                        <label class="form-label">Quantidade</label> <br>
                        <input type="text" class="form-control" name="quantidade" placeholder="Quantidade" /> <br>

                        <label class="form-label">Unidade de Medida</label> <br>
                        <input type="text" class="form-control" name="undMedida" placeholder="Unidade de Medida"/> <br>

                            <input type="submit" value="Alterar" class="btn btn-primary"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>     
</html>
