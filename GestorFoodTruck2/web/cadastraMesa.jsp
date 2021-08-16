<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de mesas</title>
    </head>
    <body>
           
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
    
        <form action="recebeDadosMesa.jsp" method="POST">
           <div class="container">
               <div class="box">
                   <h2>Cadastro de Mesas</h2>
                   <div class="itens">
                       <label><b>Nome da mesa</b></label> <br>
                       <input type="text" name="nomMesa" placeholder="Nome da mesa"> <br><br>
                       
                       <input type="button" value="Salvar" onclick="enviarDados()" />
                       <input type="reset" value="Cancelar" />
                   </div>
               </div> 
           </div>
        </form>  
        
                
<script>
    function enviarDados(){
        
            var cnpj = document.getElementsByName("nomMesa");
            if(cnpj[0].value === ""){
                cnpj[0].focus();
                alert("Informe o Nome da mesa");
                exit();
            }
            
            
            document.forms[0].submit();
    }        
    
</script> 
    </body>
</html>
