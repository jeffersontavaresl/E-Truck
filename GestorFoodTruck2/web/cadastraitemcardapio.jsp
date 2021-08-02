<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastrar Item</title>
    </head>

    <body>

        <!-- REGISTRO DE ITENS NO CARDÁPIO -->

        <form action="recebedadoscadastrocardapio.jsp"></form>
        <div>
            <label>Nome do produto</label>
            <input type="text" name="nomeproduto" /> <br />
    
            <label>Código do produto</label>
            <input type="text" name="codproduto" /> <br />
    
            <label>Tipo do produto</label>
            <input type="text" name="tipoproduto" /> <br />
    
            <label>Preço</label>
            <input type="text" name="preco" /> <br />
    
            <input type="button" value="Salvar" onclick="enviarDados()" />
            <input type="reset" value="Cancelar" />
        </div>
        



        <script>
            function enviarDados(){
                    var nomeproduto = document.getElementsByName("nomeproduto");
                    if(nomeproduto[0].value === ""){
                        nomeproduto[0].focus();
                        alert("Informe o nome do produto");
                        exit();
                    }
        
                    var codproduto = document.getElementsByName("codproduto");
                    if(codproduto[0].value === ""){
                        codproduto[0].focus();
                        alert("Informe o código do produto");
                        exit();
                    }
        
                    var tipoproduto = document.getElementsByName("tipoproduto");
                    if(tipoproduto[0].value === ""){
                        tipoproduto[0].focus();
                        alert("Informe o tipo do produto");
                        exit();
                    }
        
                    var preco = document.getElementsByName("preco");
                    if(preco[0].value === ""){
                        preco[0].focus();
                        alert("Informe o preço");
                        exit();
                    }
                    document.forms[0].submit();
            }        
            
        </script>   
    </body>

    </html>