<%@page contentType="text/html" pageEncoding="UTF-8"%>﻿
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8" />
    <title>Cadastrar Insumo</title>
</head>

<Style>

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

    h2 {
        background: #FFD700;
        margin-top: 0px;
        padding-top: 8px;
    }

    body {
        margin: 0px;
    }

    .itens, label {
        text-align: center;
    }
    textarea{
        width: 340px;
        height: 150px;
    }

</Style>

<body>

<label class="cabecalho" id="msg"> 
         <%
            if(request.getParameter("pmensagem") != null)         
               out.write(request.getParameter("pmensagem"));
         %>
</label>   
    
        <form action="recebeItemEstoque.jsp" method="POST">
           <div class="container">
               <div class="box">
                   <h2>Cadastro de Insumo</h2>
                   <div class="itens">
                       <label><b>Nome do Item</b></label> <br>
                       <input type="text" name="descInsumo" placeholder="Nome do Insumo"> <br><br>

                       <label><b>Custo Insumo</b></label> <br>
                       <input type="text" name="custoInsumo" placeholder="Preço do produto"> <br><br>
                       
                       <label><b>Saldo em Estoque</b></label> <br>
                       <input type="text" name="sldEstoque" placeholder="Saldo em estoque"> <br><br>
                       
                       <label><b>Unidade de Medida</b></label> <br>
                       <input type="text" name="undMedida" placeholder="Unidade de Medida"> <br><br>
                       
                       <label><b>Quantidade para Est. Alerta</b></label> <br>
                       <input type="text" name="qtdEstqAlerta" placeholder="Estoque de Alerta"> <br><br>

                       <input type="button" value="Salvar" onclick="enviarDados()" />
                       <input type="reset" value="Cancelar" />
                   </div>
               </div> 
           </div>
        </form>  
        
                
<script>
    function enviarDados(){

            var descInsumo = document.getElementsByName("descInsumo");
            if(descInsumo[0].value === ""){
                descInsumo[0].focus();
                alert("Informe o Nome do produto");
                exit();
            }

            var custoInsumo = document.getElementsByName("custoInsumo");
            if(custoInsumo[0].value === ""){
                valorItem[0].focus();
                alert("Informe o Preço do produto");
                exit();
            }
            
            var sldEstoque = document.getElementsByName("sldEstoque");
            if(sldEstoque[0].value === ""){
                sldEstoque[0].focus();
                alert("Informe o saldo em estoque");
                exit();
            }
            
            var undMedida = document.getElementsByName("undMedida");
            if(undMedida[0].value === ""){
                undMedida[0].focus();
                alert("Informe a unidade de medida");
                exit();
            }
            
            var qtdEstqAlerta = document.getElementsByName("qtdEstqAlerta");
            if(qtdEstqAlerta[0].value === ""){
                qtdEstqAlerta[0].focus();
                alert("Informe o estoque de alerta");
                exit();
            }
            
            
            document.forms[0].submit();
    }        
    
</script>  
</body>
</html>