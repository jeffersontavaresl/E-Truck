<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Fornecedor"%>
<%@page import="modelos.Insumo"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de fornecedores</title>
    </head>
    
    <style>
        .container {
        width: 100vw;
        height: 100vh;
        background: #FF7F24;
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
    }
    .box {
        width: 350px;
        height: 400px;
        background: #fff;
        text-align: center;
        border: solid 3px black;
    }
    
    .itens, label {
        text-align: center;
    }
    </style>
    
    <body>
        <label class="cabecalho" id="msg"> 
         <%
            if(request.getParameter("pmensagem") != null)         
               out.write(request.getParameter("pmensagem"));
         %>
        </label>   
    
        <form action="recebePedFornecedor.jsp" method="POST">
            <%
                Fornecedor forn = new Fornecedor();
                Insumo ins = new Insumo();
                List<Fornecedor> forns = forn.lovFornecedores();
                List<Insumo> insumos = ins.lovItem();
            %>
           <div class="container">
               <div class="box">
                   <h2>Realizar Pedido</h2>
                   <div class="itens">
                       <label><b>Fornecedores</b></label> <br>
                       <select name="codFornecedor">
                            <% for (Fornecedor f : forns) {%>
                            <option value="<%out.write("" + f.getCodFornecedor());%>">
                                <% out.write(f.getRazaoSocial());%>
                            </option>
                                <%}%>
                        </select><br>
                       
                       <label><b>Insumo</b></label> <br>
                       <select name="codInsumo">
                            <% for (Insumo i : insumos) {%>
                            <option value="<%out.write("" + i.getCodInsumo());%>">
                                <% out.write(i.getDescInsumo());%>
                            </option>
                                <%}%>
                        </select><br>
                        
                        <label><b>Quantidade</b></label> <br>
                        <input type="text" name="qntdeinsumo" placeholder="Quantidade"> <br><br>
                       
                        <label><b>Unidade de Medida</b></label> <br>
                        <input type="text" name="undMedida" placeholder="Unidade de Medida"> <br><br>
                       
                       <input type="button" value="Realizar Pedido" onclick="enviarDados()" />
                       <input type="button" value="Consultar Pedidos" onclick="consultaPedFornecedor.jsp" />

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
            
            document.forms[0].submit();
    }        
    
</script> 
    </body>
</html>