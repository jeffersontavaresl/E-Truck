<%@page contentType="text/html" pageEncoding="UTF-8"%>﻿
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8" />
    <title>Cadastrar produtos</title>
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
    
        <form action="recebeItem.jsp" method="POST">
           <div class="container">
               <div class="box">
                   <h2>Cadastro de Itens</h2>
                   <div class="itens">
                       <label><b>Nome do Item</b></label> <br>
                       <input type="text" name="nomPrd" placeholder="Nome do produto"> <br><br>

                       <label><b>Tipo do Item</b></label> <br>
                       <input type="text" name="vlrPrd" placeholder="Preço do produto"> <br><br>

                       <input type="button" value="Salvar" onclick="enviarDados()" />
                       <input type="reset" value="Cancelar" />
                   </div>
               </div> 
           </div>
        </form>  
        
                
<script>
    function enviarDados(){

            var nomeItem = document.getElementsByName("nomPrd");
            if(nomeItem[0].value === ""){
                nomeItem[0].focus();
                alert("Informe o Nome do produto");
                exit();
            }

            var tipoItem = document.getElementsByName("vlrPrd");
            if(tipoItem[0].value === ""){
                tipoItem[0].focus();
                alert("Informe o Preço do produto");
                exit();
            }

            document.forms[0].submit();
    }        
    
</script>  
</body>
</html>