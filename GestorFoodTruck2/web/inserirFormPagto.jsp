<%@page import="java.util.List"%>
<%@page import="modelos.Caixa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Caixa caixa = new Caixa();
            List<Caixa> forms = caixa.lovPagtos();
        %>
        <form action="recebeFormPagto.jsp" method="POST">
           <div class="container">
               <div class="box">
                   <h2>Forma de Pagamento</h2>
                   <div class="itens">
                       <label><b>Data do pagamento</b></label> <br>
                       <input type="date" name="data" placeholder="Data do pagamento"> <br><br>

                       <label><b>Valor Pago</b></label> <br>
                       <input type="text" name="vlrTotal" placeholder="Valor Pago"> <br><br>
                       
                        <label>Forma de Pagamento</label><br>
                        <select name="formPagto" class="form-control">
                        <% for (Caixa c : forms) {%>
                        <option value="<%out.write("" + c.getCodFormPagto());%>">
                            <% out.write(c.getDescFormPagto());%>
                            <% out.write(c.getDescBandeira());%>
                        </option>
                        <%}%>
                    </select><br>

                       <input type="button" value="Salvar" onclick="enviarDados()" />
                       <input type="reset" value="Cancelar" />
                   </div>
               </div> 
           </div>
        </form>  
        
                
<script>
    function enviarDados(){

            var data = document.getElementsByName("data");
            if(data[0].value === ""){
                data[0].focus();
                alert("Informe a data");
                exit();
            }

            var vlrTotal = document.getElementsByName("vlrTotal");
            if(vlrTotal[0].value === ""){
                vlrTotal[0].focus();
                alert("Informe o valor total");
                exit();
            }
            
            var formPagto = document.getElementsByName("formPagto");
            if(formPagto[0].value === ""){
                formPagto[0].focus();
                alert("Informe a forma de pagamento");
                exit();
            }

            document.forms[0].submit();
    }        
    
</script>  
    </body>
</html>
