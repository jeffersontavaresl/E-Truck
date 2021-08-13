<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    
        <form action="recebeForn.jsp" method="POST">
           <div class="container">
               <div class="box">
                   <h2>Cadastro de fornecedor</h2>
                   <div class="itens">
                       <label><b>CNPJ</b></label> <br>
                       <input type="text" name="cdCnpj" placeholder="CNPJ"> <br><br>
                       
                       <label><b>Razão social</b></label> <br>
                       <input type="text" name="cdSoc" placeholder="Razão Social"> <br><br>

                       <label><b>Telefone</b></label> <br>
                       <input type="number" name="cdTel" placeholder="Telefone"> <br><br>
                       
                       <label><b>E-mail</b></label> <br>
                       <input type="email" name="cdEml" placeholder="E-mail"> <br><br>
                       
                        <label><b>Nome</b></label> <br>
                       <input type="text" name="cdNom" placeholder="Nome"> <br><br>
                       
                       <input type="button" value="Salvar" onclick="enviarDados()" />
                       <input type="reset" value="Cancelar" />
                   </div>
               </div> 
           </div>
        </form>  
        
                
<script>
    function enviarDados(){
        
            var cnpj = document.getElementsByName("cdCnpj");
            if(cnpj[0].value === ""){
                cnpj[0].focus();
                alert("Informe o CNPJ");
                exit();
            }
            
            var rzSoc = document.getElementsByName("cdSoc");
            if(rzSoc[0].value === ""){
                rzSoc[0].focus();
                alert("Informe a razão social");
                exit();
            }
            
            var eml = document.getElementsByName("cdTel");
            if(eml[0].value === ""){
                eml[0].focus();
                alert("Informe o telefone");
                exit();
            }
            
            var tel = document.getElementsByName("cdEml");
            if(tel[0].value === ""){
                tel[0].focus();
                alert("Informe o e-mail");
                exit();
            }
            
            var nomF = document.getElementsByName("cdNom");
            if(nomF[0].value === ""){
                nomF[0].focus();
                alert("Informe o Nome");
                exit();
            }
            
            document.forms[0].submit();
    }        
    
</script> 
    </body>
</html>
