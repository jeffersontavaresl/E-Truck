<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Fornecedor"%>
<%@page import="modelos.Insumo"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Realizar Pedido</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="styles/realizar.css" rel="stylesheet"/>
    </head>
    <body>
        <div class=<"container-fluid">
            <div class="container-fluid border w-50 h-75 mt-3 mb-4" id="head">
                <div class="container-fluid d-flex justify-content-center mt-4">
                    <h2>Realizar Pedido Para Fornecedores</h2><br>  
                </div>
        <div class="container-fluid mt-2 mr-4">
        <form action="recebePedFornecedor.jsp" method="POST">
            <p class="font-weight-bold">
             <%  if (request.getParameter("pmensagem") != null)
                 out.write(request.getParameter("pmensagem"));
              %>
            </p>
            <%
                Fornecedor forn = new Fornecedor();
                Insumo ins = new Insumo();
                List<Fornecedor> forns = forn.lovFornecedores();
                List<Insumo> insumos = ins.lovItem();
            %>
           <div class="container">
               <div class="box">
                   <div class="itens">
                       <label class="form-label">Fornecedores</label> <br>
                       <select class="form-control" name="codFornecedor">
                            <% for (Fornecedor f : forns) {%>
                            <option value="<%out.write("" + f.getCodFornecedor());%>">
                                <% out.write(f.getRazaoSocial());%>
                            </option>
                                <%}%>
                        </select><br>
                       
                       <label class="form-label">Insumo</label> <br>
                       <select class="form-control" name="codInsumo">
                            <% for (Insumo i : insumos) {%>
                            <option value="<%out.write("" + i.getCodInsumo());%>">
                                <% out.write(i.getDescInsumo());%>
                            </option>
                                <%}%>
                        </select><br>
                        
                        <label class="form-label">Quantidade</label> <br>
                        <input type="text" class="form-control" name="qntdeinsumo" placeholder="Quantidade"> <br>
                       
                        <label class="form-label">Unidade de Medida</label> <br>
                        <input type="text" class="form-control" name="undMedida" placeholder="Unidade de Medida"> <br>
                        
                        <label class="form-label">Status</label> <br>
                        <select class="form-control" name="statusPedido" class="form-control">
                                    <option value="pendente">Pendente</option>
                        </select><br><br>
                       
                       <div class="text-center mb-3">
                       <a href="functions.jsp" class="btn btn-primary">Início</a>
                       <input type="button" class="btn btn-success" value="Realizar Pedido" onclick="enviarDados()" />
                       <a href="consultaPedFornecedor.jsp" class="btn btn-danger">Consultar Pedidos</a>

                   </div>
               </div> 
           </div>
        </form>  
        
                
<script>
    function enviarDados(){
        
            var codFornecedor = document.getElementsByName("codFornecedor");
            if(codFornecedor[0].value === ""){
                codFornecedor[0].focus();
                alert("Informe o fornecedor");
                exit();
            }
            
            var codInsumo = document.getElementsByName("codInsumo");
            if(codInsumo[0].value === ""){
                codInsumo[0].focus();
                alert("Informe o insumo");
                exit();
            }
            
            var qntdeinsumo = document.getElementsByName("qntdeinsumo");
            if(qntdeinsumo[0].value === ""){
                qntdeinsumo[0].focus();
                alert("Informe a quantidade");
                exit();
            }
            
            var undMedida = document.getElementsByName("undMedida");
            if(undMedida[0].value === ""){
                undMedida[0].focus();
                alert("Informe a unidade de medida");
                exit();
            }
            
            var statusPedido = document.getElementsByName("statusPedido");
            if(statusPedido[0].value === ""){
                statusPedido[0].focus();
                alert("Informe o status");
                exit();
            }
            
            document.forms[0].submit();
    }        
    
</script> 
    </body>
</html>
