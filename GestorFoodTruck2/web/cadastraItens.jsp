<%@page contentType="text/html" pageEncoding="UTF-8"%>﻿
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8" />
    <title>Cadastrar pagamento</title>
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
          <%
          //verifica sessão - se usuário não está logado, abre a tela de login
          String login = (String) session.getAttribute("login");
          if(login == null){
              response.sendRedirect("login.jsp");
          }
          %>
<label class="cabecalho" id="msg"> 
         <%
            if(request.getParameter("pmensagem") != null)         
               out.write(request.getParameter("pmensagem"));
         %>
</label>   
    
        <form action="recebeItens.jsp" method="POST">
           <div class="container">
               <div class="box">
                   <h2>Cadastro de Itens</h2>
                   <div class="itens">
                       <label><b>Código do item</b></label> <br>
                       <input type="text" name="codProduto" placeholder="Número do produto"> <br><br>

                       <label><b>Nome do produto</b></label> <br>
                       <input type="text" name="produto" placeholder="Nome do produto"> <br><br>

                       <label><b>Valor do produto</b></label> <br>
                       <input type="text" name="preco" placeholder="Valor do produto"> <br><br>

                       <input type="button" value="Salvar" onclick="enviarDados()" />
                       <input type="reset" value="Cancelar" />
                   </div>
               </div> 
           </div>
        </form>  
        
                
<script>
    function enviarDados(){
            var numItem = document.getElementsByName("codProduto");
            if(numItem[0].value === ""){
                numItem[0].focus();
                alert("Informe o codProduto");
                exit();
            }
            var nomeItem = document.getElementsByName("produto");
            if(nomeItem[0].value === ""){
                nomeItem[0].focus();
                alert("Informe o Nome do produto");
                exit();
            }
            var tipoItem = document.getElementsByName("preco");
            if(tipoItem[0].value === ""){
                tipoItem[0].focus();
                alert("Informe o preco");
                exit();
            }
            document.forms[0].submit();
    }        
    
</script>  
</body>
</html>
