<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Realizar pedido</title>
    </head>
    <body>
            <div class ="container">
                <div id="cadastro">
                    <form action="recebedadospedido.jsp" method="POST">
                        <div>
                        <label>Código do produto</label>
                        <input type="text" name="codproduto" style="width: 60px" maxlength="7"/> 

                        <br />
                        <label>Pedido do cliente</label>
                        <input type="text" name="pedido" />

                        <br />
                        <label>Observação</label>
                        <input type="text" name="observacao" />
                        
                        <br />
                        <label>Status</label>
                        <input type="text" name="status" />
                       
                         <hr />
                         <input type="button" value="Salvar" onclick="enviaForm()"/>
                         <input type="reset" value="Cancelar" />
                    </div>
                    </form>
                </div>
            </div>
    <script>
            function enviaForm(){
                var codproduto = document.getElementsByName("codproduto");
                if(codproduto[0].value === ""){
                    codproduto[0].focus();
                    alert("Informe o código do produto");
                    exit();
                }
                
                var pedido = document.getElementsByName("pedido");
                if(pedido[0].value === ""){
                    pedido[0].focus();
                    alert("Informe o pedido");
                    exit();
                }
                var observacao = document.getElementsByName("observacao");
                if(observacao[0].value === ""){
                    observacao[0].focus();
                    alert("Informe a observacao");
                    exit();
                }
                var status = document.getElementsByName("status");
                if(status[0].value === ""){
                    status[0].focus();
                    alert("Informe o status");
                    exit();
                } 
                document.forms[0].submit();                
            }
        </script>        
    </body>
</html>
